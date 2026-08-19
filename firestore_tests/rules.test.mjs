import { after, before, describe, it } from 'node:test';
import { readFileSync } from 'node:fs';
import {
  assertFails,
  assertSucceeds,
  initializeTestEnvironment,
} from '@firebase/rules-unit-testing';
import { doc, getDoc, setDoc, deleteDoc } from 'firebase/firestore';

/**
 * The security-rules matrix for `users/{uid}/actions/{actionId}`.
 *
 * Day 14 opened exactly one new door — an owner may delete their own mirror
 * documents — and the point of this file is to prove that only that door
 * opened. Everything here runs against the Firestore emulator, so nothing
 * touches the real project and no credentials are needed.
 */

const PROJECT_ID = 'action-rules-test';
const OWNER = 'uid-owner';
const STRANGER = 'uid-stranger';

/** The exact Day-8 mirror payload the rules validate. */
const validMirror = (id) => ({
  schemaVersion: 1,
  id,
  title: 'Water bill',
  status: 'active',
  urgency: 'normal',
  category: 'payment',
  due: '2026-09-21T00:00:00.000',
  dueIsDateOnly: true,
  amountMinorUnits: 5820,
  currency: 'GBP',
  recommendedNextStep: 'Pay it',
  origin: 'extraction',
  createdAt: '2026-08-18T12:00:00.000Z',
  updatedAt: '2026-08-18T12:00:00.000Z',
  completedAt: null,
  archivedAt: null,
});

let testEnv;

const actionDoc = (context, uid, id) =>
  doc(context.firestore(), `users/${uid}/actions/${id}`);

/** Writes a document bypassing the rules, so deletion has something to hit. */
const seed = (uid, id) =>
  testEnv.withSecurityRulesDisabled((context) =>
    setDoc(actionDoc(context, uid, id), validMirror(id)),
  );

before(async () => {
  testEnv = await initializeTestEnvironment({
    projectId: PROJECT_ID,
    firestore: {
      rules: readFileSync('../firestore.rules', 'utf8'),
      host: '127.0.0.1',
      port: 8080,
    },
  });
});

after(async () => {
  await testEnv?.cleanup();
});

describe('the owner', () => {
  it('may read their own Action', async () => {
    await testEnv.clearFirestore();
    await seed(OWNER, 'a1');
    const db = testEnv.authenticatedContext(OWNER);
    await assertSucceeds(getDoc(actionDoc(db, OWNER, 'a1')));
  });

  it('may create a valid Action', async () => {
    await testEnv.clearFirestore();
    const db = testEnv.authenticatedContext(OWNER);
    await assertSucceeds(
      setDoc(actionDoc(db, OWNER, 'a1'), validMirror('a1')),
    );
  });

  // The Day-14 change, and the whole reason this file exists.
  it('may DELETE their own Action', async () => {
    await testEnv.clearFirestore();
    await seed(OWNER, 'a1');
    const db = testEnv.authenticatedContext(OWNER);
    await assertSucceeds(deleteDoc(actionDoc(db, OWNER, 'a1')));
  });

  it('may delete a document that does not exist', async () => {
    await testEnv.clearFirestore();
    const db = testEnv.authenticatedContext(OWNER);
    // A retry after a partially successful deletion must not be an error.
    await assertSucceeds(deleteDoc(actionDoc(db, OWNER, 'never-existed')));
  });
});

describe('another user', () => {
  it('may NOT delete someone else’s Action', async () => {
    await testEnv.clearFirestore();
    await seed(OWNER, 'a1');
    const db = testEnv.authenticatedContext(STRANGER);
    await assertFails(deleteDoc(actionDoc(db, OWNER, 'a1')));
  });

  it('may NOT read someone else’s Action', async () => {
    await testEnv.clearFirestore();
    await seed(OWNER, 'a1');
    const db = testEnv.authenticatedContext(STRANGER);
    await assertFails(getDoc(actionDoc(db, OWNER, 'a1')));
  });

  it('may NOT write into someone else’s collection', async () => {
    await testEnv.clearFirestore();
    const db = testEnv.authenticatedContext(STRANGER);
    await assertFails(setDoc(actionDoc(db, OWNER, 'a2'), validMirror('a2')));
  });
});

describe('an unauthenticated client', () => {
  it('may NOT delete', async () => {
    await testEnv.clearFirestore();
    await seed(OWNER, 'a1');
    const db = testEnv.unauthenticatedContext();
    await assertFails(deleteDoc(actionDoc(db, OWNER, 'a1')));
  });

  it('may NOT read', async () => {
    await testEnv.clearFirestore();
    await seed(OWNER, 'a1');
    const db = testEnv.unauthenticatedContext();
    await assertFails(getDoc(actionDoc(db, OWNER, 'a1')));
  });

  it('may NOT create', async () => {
    await testEnv.clearFirestore();
    const db = testEnv.unauthenticatedContext();
    await assertFails(setDoc(actionDoc(db, OWNER, 'a1'), validMirror('a1')));
  });
});

describe('outside the one reachable path', () => {
  const elsewhere = (context, path) => doc(context.firestore(), path);

  it('the owner may NOT delete outside their actions collection', async () => {
    await testEnv.clearFirestore();
    await testEnv.withSecurityRulesDisabled((context) =>
      setDoc(elsewhere(context, `users/${OWNER}/secrets/s1`), { a: 1 }),
    );
    const db = testEnv.authenticatedContext(OWNER);
    await assertFails(deleteDoc(elsewhere(db, `users/${OWNER}/secrets/s1`)));
  });

  it('the owner may NOT delete their own user document', async () => {
    await testEnv.clearFirestore();
    await testEnv.withSecurityRulesDisabled((context) =>
      setDoc(elsewhere(context, `users/${OWNER}`), { a: 1 }),
    );
    const db = testEnv.authenticatedContext(OWNER);
    await assertFails(deleteDoc(elsewhere(db, `users/${OWNER}`)));
  });

  it('a top-level collection stays unreachable', async () => {
    await testEnv.clearFirestore();
    const db = testEnv.authenticatedContext(OWNER);
    await assertFails(setDoc(elsewhere(db, 'anything/doc1'), { a: 1 }));
    await assertFails(getDoc(elsewhere(db, 'anything/doc1')));
    await assertFails(deleteDoc(elsewhere(db, 'anything/doc1')));
  });
});

describe('write validation is unchanged by the delete rule', () => {
  it('rejects an unknown field', async () => {
    await testEnv.clearFirestore();
    const db = testEnv.authenticatedContext(OWNER);
    await assertFails(
      setDoc(actionDoc(db, OWNER, 'a1'), {
        ...validMirror('a1'),
        sourceId: 'src-1',
      }),
    );
  });

  it('rejects a mismatched id', async () => {
    await testEnv.clearFirestore();
    const db = testEnv.authenticatedContext(OWNER);
    await assertFails(
      setDoc(actionDoc(db, OWNER, 'a1'), validMirror('different')),
    );
  });

  it('rejects an unknown status', async () => {
    await testEnv.clearFirestore();
    const db = testEnv.authenticatedContext(OWNER);
    await assertFails(
      setDoc(actionDoc(db, OWNER, 'a1'), {
        ...validMirror('a1'),
        status: 'deleted',
      }),
    );
  });

  it('rejects a bumped schemaVersion the rules have not seen', async () => {
    await testEnv.clearFirestore();
    const db = testEnv.authenticatedContext(OWNER);
    await assertFails(
      setDoc(actionDoc(db, OWNER, 'a1'), {
        ...validMirror('a1'),
        schemaVersion: 2,
      }),
    );
  });
});
