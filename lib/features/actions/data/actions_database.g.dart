// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions_database.dart';

// ignore_for_file: type=lint
class $ActionsTableTable extends ActionsTable
    with TableInfo<$ActionsTableTable, ActionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urgencyMeta = const VerificationMeta(
    'urgency',
  );
  @override
  late final GeneratedColumn<String> urgency = GeneratedColumn<String>(
    'urgency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueAtWallMeta = const VerificationMeta(
    'dueAtWall',
  );
  @override
  late final GeneratedColumn<String> dueAtWall = GeneratedColumn<String>(
    'due_at_wall',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _amountMinorUnitsMeta = const VerificationMeta(
    'amountMinorUnits',
  );
  @override
  late final GeneratedColumn<int> amountMinorUnits = GeneratedColumn<int>(
    'amount_minor_units',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recommendedNextStepMeta =
      const VerificationMeta('recommendedNextStep');
  @override
  late final GeneratedColumn<String> recommendedNextStep =
      GeneratedColumn<String>(
        'recommended_next_step',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _whyThisMattersMeta = const VerificationMeta(
    'whyThisMatters',
  );
  @override
  late final GeneratedColumn<String> whyThisMatters = GeneratedColumn<String>(
    'why_this_matters',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewedAtMicrosMeta = const VerificationMeta(
    'reviewedAtMicros',
  );
  @override
  late final GeneratedColumn<int> reviewedAtMicros = GeneratedColumn<int>(
    'reviewed_at_micros',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMicrosMeta = const VerificationMeta(
    'createdAtMicros',
  );
  @override
  late final GeneratedColumn<int> createdAtMicros = GeneratedColumn<int>(
    'created_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMicrosMeta = const VerificationMeta(
    'updatedAtMicros',
  );
  @override
  late final GeneratedColumn<int> updatedAtMicros = GeneratedColumn<int>(
    'updated_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMicrosMeta = const VerificationMeta(
    'completedAtMicros',
  );
  @override
  late final GeneratedColumn<int> completedAtMicros = GeneratedColumn<int>(
    'completed_at_micros',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _archivedAtMicrosMeta = const VerificationMeta(
    'archivedAtMicros',
  );
  @override
  late final GeneratedColumn<int> archivedAtMicros = GeneratedColumn<int>(
    'archived_at_micros',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    schemaVersion,
    sourceId,
    title,
    summary,
    status,
    urgency,
    category,
    dueAtWall,
    amountMinorUnits,
    currency,
    recommendedNextStep,
    whyThisMatters,
    origin,
    reviewedAtMicros,
    createdAtMicros,
    updatedAtMicros,
    completedAtMicros,
    archivedAtMicros,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'actions';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_schemaVersionMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('urgency')) {
      context.handle(
        _urgencyMeta,
        urgency.isAcceptableOrUnknown(data['urgency']!, _urgencyMeta),
      );
    } else if (isInserting) {
      context.missing(_urgencyMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('due_at_wall')) {
      context.handle(
        _dueAtWallMeta,
        dueAtWall.isAcceptableOrUnknown(data['due_at_wall']!, _dueAtWallMeta),
      );
    }
    if (data.containsKey('amount_minor_units')) {
      context.handle(
        _amountMinorUnitsMeta,
        amountMinorUnits.isAcceptableOrUnknown(
          data['amount_minor_units']!,
          _amountMinorUnitsMeta,
        ),
      );
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('recommended_next_step')) {
      context.handle(
        _recommendedNextStepMeta,
        recommendedNextStep.isAcceptableOrUnknown(
          data['recommended_next_step']!,
          _recommendedNextStepMeta,
        ),
      );
    }
    if (data.containsKey('why_this_matters')) {
      context.handle(
        _whyThisMattersMeta,
        whyThisMatters.isAcceptableOrUnknown(
          data['why_this_matters']!,
          _whyThisMattersMeta,
        ),
      );
    }
    if (data.containsKey('origin')) {
      context.handle(
        _originMeta,
        origin.isAcceptableOrUnknown(data['origin']!, _originMeta),
      );
    } else if (isInserting) {
      context.missing(_originMeta);
    }
    if (data.containsKey('reviewed_at_micros')) {
      context.handle(
        _reviewedAtMicrosMeta,
        reviewedAtMicros.isAcceptableOrUnknown(
          data['reviewed_at_micros']!,
          _reviewedAtMicrosMeta,
        ),
      );
    }
    if (data.containsKey('created_at_micros')) {
      context.handle(
        _createdAtMicrosMeta,
        createdAtMicros.isAcceptableOrUnknown(
          data['created_at_micros']!,
          _createdAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtMicrosMeta);
    }
    if (data.containsKey('updated_at_micros')) {
      context.handle(
        _updatedAtMicrosMeta,
        updatedAtMicros.isAcceptableOrUnknown(
          data['updated_at_micros']!,
          _updatedAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMicrosMeta);
    }
    if (data.containsKey('completed_at_micros')) {
      context.handle(
        _completedAtMicrosMeta,
        completedAtMicros.isAcceptableOrUnknown(
          data['completed_at_micros']!,
          _completedAtMicrosMeta,
        ),
      );
    }
    if (data.containsKey('archived_at_micros')) {
      context.handle(
        _archivedAtMicrosMeta,
        archivedAtMicros.isAcceptableOrUnknown(
          data['archived_at_micros']!,
          _archivedAtMicrosMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      urgency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}urgency'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      dueAtWall: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}due_at_wall'],
      ),
      amountMinorUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor_units'],
      ),
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      ),
      recommendedNextStep: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recommended_next_step'],
      ),
      whyThisMatters: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}why_this_matters'],
      ),
      origin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin'],
      )!,
      reviewedAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reviewed_at_micros'],
      ),
      createdAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at_micros'],
      )!,
      updatedAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at_micros'],
      )!,
      completedAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_at_micros'],
      ),
      archivedAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}archived_at_micros'],
      ),
    );
  }

  @override
  $ActionsTableTable createAlias(String alias) {
    return $ActionsTableTable(attachedDatabase, alias);
  }
}

class ActionRow extends DataClass implements Insertable<ActionRow> {
  final String id;
  final int schemaVersion;
  final String? sourceId;
  final String title;
  final String? summary;
  final String status;
  final String urgency;
  final String category;

  /// Wall-clock deadline, no timezone. Null = reviewed absence of deadline.
  final String? dueAtWall;
  final int? amountMinorUnits;
  final String? currency;
  final String? recommendedNextStep;
  final String? whyThisMatters;
  final String origin;
  final int? reviewedAtMicros;
  final int createdAtMicros;
  final int updatedAtMicros;
  final int? completedAtMicros;
  final int? archivedAtMicros;
  const ActionRow({
    required this.id,
    required this.schemaVersion,
    this.sourceId,
    required this.title,
    this.summary,
    required this.status,
    required this.urgency,
    required this.category,
    this.dueAtWall,
    this.amountMinorUnits,
    this.currency,
    this.recommendedNextStep,
    this.whyThisMatters,
    required this.origin,
    this.reviewedAtMicros,
    required this.createdAtMicros,
    required this.updatedAtMicros,
    this.completedAtMicros,
    this.archivedAtMicros,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['schema_version'] = Variable<int>(schemaVersion);
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    map['status'] = Variable<String>(status);
    map['urgency'] = Variable<String>(urgency);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || dueAtWall != null) {
      map['due_at_wall'] = Variable<String>(dueAtWall);
    }
    if (!nullToAbsent || amountMinorUnits != null) {
      map['amount_minor_units'] = Variable<int>(amountMinorUnits);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || recommendedNextStep != null) {
      map['recommended_next_step'] = Variable<String>(recommendedNextStep);
    }
    if (!nullToAbsent || whyThisMatters != null) {
      map['why_this_matters'] = Variable<String>(whyThisMatters);
    }
    map['origin'] = Variable<String>(origin);
    if (!nullToAbsent || reviewedAtMicros != null) {
      map['reviewed_at_micros'] = Variable<int>(reviewedAtMicros);
    }
    map['created_at_micros'] = Variable<int>(createdAtMicros);
    map['updated_at_micros'] = Variable<int>(updatedAtMicros);
    if (!nullToAbsent || completedAtMicros != null) {
      map['completed_at_micros'] = Variable<int>(completedAtMicros);
    }
    if (!nullToAbsent || archivedAtMicros != null) {
      map['archived_at_micros'] = Variable<int>(archivedAtMicros);
    }
    return map;
  }

  ActionsTableCompanion toCompanion(bool nullToAbsent) {
    return ActionsTableCompanion(
      id: Value(id),
      schemaVersion: Value(schemaVersion),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      title: Value(title),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      status: Value(status),
      urgency: Value(urgency),
      category: Value(category),
      dueAtWall: dueAtWall == null && nullToAbsent
          ? const Value.absent()
          : Value(dueAtWall),
      amountMinorUnits: amountMinorUnits == null && nullToAbsent
          ? const Value.absent()
          : Value(amountMinorUnits),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      recommendedNextStep: recommendedNextStep == null && nullToAbsent
          ? const Value.absent()
          : Value(recommendedNextStep),
      whyThisMatters: whyThisMatters == null && nullToAbsent
          ? const Value.absent()
          : Value(whyThisMatters),
      origin: Value(origin),
      reviewedAtMicros: reviewedAtMicros == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewedAtMicros),
      createdAtMicros: Value(createdAtMicros),
      updatedAtMicros: Value(updatedAtMicros),
      completedAtMicros: completedAtMicros == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAtMicros),
      archivedAtMicros: archivedAtMicros == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAtMicros),
    );
  }

  factory ActionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionRow(
      id: serializer.fromJson<String>(json['id']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      title: serializer.fromJson<String>(json['title']),
      summary: serializer.fromJson<String?>(json['summary']),
      status: serializer.fromJson<String>(json['status']),
      urgency: serializer.fromJson<String>(json['urgency']),
      category: serializer.fromJson<String>(json['category']),
      dueAtWall: serializer.fromJson<String?>(json['dueAtWall']),
      amountMinorUnits: serializer.fromJson<int?>(json['amountMinorUnits']),
      currency: serializer.fromJson<String?>(json['currency']),
      recommendedNextStep: serializer.fromJson<String?>(
        json['recommendedNextStep'],
      ),
      whyThisMatters: serializer.fromJson<String?>(json['whyThisMatters']),
      origin: serializer.fromJson<String>(json['origin']),
      reviewedAtMicros: serializer.fromJson<int?>(json['reviewedAtMicros']),
      createdAtMicros: serializer.fromJson<int>(json['createdAtMicros']),
      updatedAtMicros: serializer.fromJson<int>(json['updatedAtMicros']),
      completedAtMicros: serializer.fromJson<int?>(json['completedAtMicros']),
      archivedAtMicros: serializer.fromJson<int?>(json['archivedAtMicros']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'sourceId': serializer.toJson<String?>(sourceId),
      'title': serializer.toJson<String>(title),
      'summary': serializer.toJson<String?>(summary),
      'status': serializer.toJson<String>(status),
      'urgency': serializer.toJson<String>(urgency),
      'category': serializer.toJson<String>(category),
      'dueAtWall': serializer.toJson<String?>(dueAtWall),
      'amountMinorUnits': serializer.toJson<int?>(amountMinorUnits),
      'currency': serializer.toJson<String?>(currency),
      'recommendedNextStep': serializer.toJson<String?>(recommendedNextStep),
      'whyThisMatters': serializer.toJson<String?>(whyThisMatters),
      'origin': serializer.toJson<String>(origin),
      'reviewedAtMicros': serializer.toJson<int?>(reviewedAtMicros),
      'createdAtMicros': serializer.toJson<int>(createdAtMicros),
      'updatedAtMicros': serializer.toJson<int>(updatedAtMicros),
      'completedAtMicros': serializer.toJson<int?>(completedAtMicros),
      'archivedAtMicros': serializer.toJson<int?>(archivedAtMicros),
    };
  }

  ActionRow copyWith({
    String? id,
    int? schemaVersion,
    Value<String?> sourceId = const Value.absent(),
    String? title,
    Value<String?> summary = const Value.absent(),
    String? status,
    String? urgency,
    String? category,
    Value<String?> dueAtWall = const Value.absent(),
    Value<int?> amountMinorUnits = const Value.absent(),
    Value<String?> currency = const Value.absent(),
    Value<String?> recommendedNextStep = const Value.absent(),
    Value<String?> whyThisMatters = const Value.absent(),
    String? origin,
    Value<int?> reviewedAtMicros = const Value.absent(),
    int? createdAtMicros,
    int? updatedAtMicros,
    Value<int?> completedAtMicros = const Value.absent(),
    Value<int?> archivedAtMicros = const Value.absent(),
  }) => ActionRow(
    id: id ?? this.id,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    sourceId: sourceId.present ? sourceId.value : this.sourceId,
    title: title ?? this.title,
    summary: summary.present ? summary.value : this.summary,
    status: status ?? this.status,
    urgency: urgency ?? this.urgency,
    category: category ?? this.category,
    dueAtWall: dueAtWall.present ? dueAtWall.value : this.dueAtWall,
    amountMinorUnits: amountMinorUnits.present
        ? amountMinorUnits.value
        : this.amountMinorUnits,
    currency: currency.present ? currency.value : this.currency,
    recommendedNextStep: recommendedNextStep.present
        ? recommendedNextStep.value
        : this.recommendedNextStep,
    whyThisMatters: whyThisMatters.present
        ? whyThisMatters.value
        : this.whyThisMatters,
    origin: origin ?? this.origin,
    reviewedAtMicros: reviewedAtMicros.present
        ? reviewedAtMicros.value
        : this.reviewedAtMicros,
    createdAtMicros: createdAtMicros ?? this.createdAtMicros,
    updatedAtMicros: updatedAtMicros ?? this.updatedAtMicros,
    completedAtMicros: completedAtMicros.present
        ? completedAtMicros.value
        : this.completedAtMicros,
    archivedAtMicros: archivedAtMicros.present
        ? archivedAtMicros.value
        : this.archivedAtMicros,
  );
  ActionRow copyWithCompanion(ActionsTableCompanion data) {
    return ActionRow(
      id: data.id.present ? data.id.value : this.id,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      title: data.title.present ? data.title.value : this.title,
      summary: data.summary.present ? data.summary.value : this.summary,
      status: data.status.present ? data.status.value : this.status,
      urgency: data.urgency.present ? data.urgency.value : this.urgency,
      category: data.category.present ? data.category.value : this.category,
      dueAtWall: data.dueAtWall.present ? data.dueAtWall.value : this.dueAtWall,
      amountMinorUnits: data.amountMinorUnits.present
          ? data.amountMinorUnits.value
          : this.amountMinorUnits,
      currency: data.currency.present ? data.currency.value : this.currency,
      recommendedNextStep: data.recommendedNextStep.present
          ? data.recommendedNextStep.value
          : this.recommendedNextStep,
      whyThisMatters: data.whyThisMatters.present
          ? data.whyThisMatters.value
          : this.whyThisMatters,
      origin: data.origin.present ? data.origin.value : this.origin,
      reviewedAtMicros: data.reviewedAtMicros.present
          ? data.reviewedAtMicros.value
          : this.reviewedAtMicros,
      createdAtMicros: data.createdAtMicros.present
          ? data.createdAtMicros.value
          : this.createdAtMicros,
      updatedAtMicros: data.updatedAtMicros.present
          ? data.updatedAtMicros.value
          : this.updatedAtMicros,
      completedAtMicros: data.completedAtMicros.present
          ? data.completedAtMicros.value
          : this.completedAtMicros,
      archivedAtMicros: data.archivedAtMicros.present
          ? data.archivedAtMicros.value
          : this.archivedAtMicros,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionRow(')
          ..write('id: $id, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('sourceId: $sourceId, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('status: $status, ')
          ..write('urgency: $urgency, ')
          ..write('category: $category, ')
          ..write('dueAtWall: $dueAtWall, ')
          ..write('amountMinorUnits: $amountMinorUnits, ')
          ..write('currency: $currency, ')
          ..write('recommendedNextStep: $recommendedNextStep, ')
          ..write('whyThisMatters: $whyThisMatters, ')
          ..write('origin: $origin, ')
          ..write('reviewedAtMicros: $reviewedAtMicros, ')
          ..write('createdAtMicros: $createdAtMicros, ')
          ..write('updatedAtMicros: $updatedAtMicros, ')
          ..write('completedAtMicros: $completedAtMicros, ')
          ..write('archivedAtMicros: $archivedAtMicros')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    schemaVersion,
    sourceId,
    title,
    summary,
    status,
    urgency,
    category,
    dueAtWall,
    amountMinorUnits,
    currency,
    recommendedNextStep,
    whyThisMatters,
    origin,
    reviewedAtMicros,
    createdAtMicros,
    updatedAtMicros,
    completedAtMicros,
    archivedAtMicros,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionRow &&
          other.id == this.id &&
          other.schemaVersion == this.schemaVersion &&
          other.sourceId == this.sourceId &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.status == this.status &&
          other.urgency == this.urgency &&
          other.category == this.category &&
          other.dueAtWall == this.dueAtWall &&
          other.amountMinorUnits == this.amountMinorUnits &&
          other.currency == this.currency &&
          other.recommendedNextStep == this.recommendedNextStep &&
          other.whyThisMatters == this.whyThisMatters &&
          other.origin == this.origin &&
          other.reviewedAtMicros == this.reviewedAtMicros &&
          other.createdAtMicros == this.createdAtMicros &&
          other.updatedAtMicros == this.updatedAtMicros &&
          other.completedAtMicros == this.completedAtMicros &&
          other.archivedAtMicros == this.archivedAtMicros);
}

class ActionsTableCompanion extends UpdateCompanion<ActionRow> {
  final Value<String> id;
  final Value<int> schemaVersion;
  final Value<String?> sourceId;
  final Value<String> title;
  final Value<String?> summary;
  final Value<String> status;
  final Value<String> urgency;
  final Value<String> category;
  final Value<String?> dueAtWall;
  final Value<int?> amountMinorUnits;
  final Value<String?> currency;
  final Value<String?> recommendedNextStep;
  final Value<String?> whyThisMatters;
  final Value<String> origin;
  final Value<int?> reviewedAtMicros;
  final Value<int> createdAtMicros;
  final Value<int> updatedAtMicros;
  final Value<int?> completedAtMicros;
  final Value<int?> archivedAtMicros;
  final Value<int> rowid;
  const ActionsTableCompanion({
    this.id = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.status = const Value.absent(),
    this.urgency = const Value.absent(),
    this.category = const Value.absent(),
    this.dueAtWall = const Value.absent(),
    this.amountMinorUnits = const Value.absent(),
    this.currency = const Value.absent(),
    this.recommendedNextStep = const Value.absent(),
    this.whyThisMatters = const Value.absent(),
    this.origin = const Value.absent(),
    this.reviewedAtMicros = const Value.absent(),
    this.createdAtMicros = const Value.absent(),
    this.updatedAtMicros = const Value.absent(),
    this.completedAtMicros = const Value.absent(),
    this.archivedAtMicros = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActionsTableCompanion.insert({
    required String id,
    required int schemaVersion,
    this.sourceId = const Value.absent(),
    required String title,
    this.summary = const Value.absent(),
    required String status,
    required String urgency,
    required String category,
    this.dueAtWall = const Value.absent(),
    this.amountMinorUnits = const Value.absent(),
    this.currency = const Value.absent(),
    this.recommendedNextStep = const Value.absent(),
    this.whyThisMatters = const Value.absent(),
    required String origin,
    this.reviewedAtMicros = const Value.absent(),
    required int createdAtMicros,
    required int updatedAtMicros,
    this.completedAtMicros = const Value.absent(),
    this.archivedAtMicros = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       schemaVersion = Value(schemaVersion),
       title = Value(title),
       status = Value(status),
       urgency = Value(urgency),
       category = Value(category),
       origin = Value(origin),
       createdAtMicros = Value(createdAtMicros),
       updatedAtMicros = Value(updatedAtMicros);
  static Insertable<ActionRow> custom({
    Expression<String>? id,
    Expression<int>? schemaVersion,
    Expression<String>? sourceId,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<String>? status,
    Expression<String>? urgency,
    Expression<String>? category,
    Expression<String>? dueAtWall,
    Expression<int>? amountMinorUnits,
    Expression<String>? currency,
    Expression<String>? recommendedNextStep,
    Expression<String>? whyThisMatters,
    Expression<String>? origin,
    Expression<int>? reviewedAtMicros,
    Expression<int>? createdAtMicros,
    Expression<int>? updatedAtMicros,
    Expression<int>? completedAtMicros,
    Expression<int>? archivedAtMicros,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (sourceId != null) 'source_id': sourceId,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (status != null) 'status': status,
      if (urgency != null) 'urgency': urgency,
      if (category != null) 'category': category,
      if (dueAtWall != null) 'due_at_wall': dueAtWall,
      if (amountMinorUnits != null) 'amount_minor_units': amountMinorUnits,
      if (currency != null) 'currency': currency,
      if (recommendedNextStep != null)
        'recommended_next_step': recommendedNextStep,
      if (whyThisMatters != null) 'why_this_matters': whyThisMatters,
      if (origin != null) 'origin': origin,
      if (reviewedAtMicros != null) 'reviewed_at_micros': reviewedAtMicros,
      if (createdAtMicros != null) 'created_at_micros': createdAtMicros,
      if (updatedAtMicros != null) 'updated_at_micros': updatedAtMicros,
      if (completedAtMicros != null) 'completed_at_micros': completedAtMicros,
      if (archivedAtMicros != null) 'archived_at_micros': archivedAtMicros,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActionsTableCompanion copyWith({
    Value<String>? id,
    Value<int>? schemaVersion,
    Value<String?>? sourceId,
    Value<String>? title,
    Value<String?>? summary,
    Value<String>? status,
    Value<String>? urgency,
    Value<String>? category,
    Value<String?>? dueAtWall,
    Value<int?>? amountMinorUnits,
    Value<String?>? currency,
    Value<String?>? recommendedNextStep,
    Value<String?>? whyThisMatters,
    Value<String>? origin,
    Value<int?>? reviewedAtMicros,
    Value<int>? createdAtMicros,
    Value<int>? updatedAtMicros,
    Value<int?>? completedAtMicros,
    Value<int?>? archivedAtMicros,
    Value<int>? rowid,
  }) {
    return ActionsTableCompanion(
      id: id ?? this.id,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      sourceId: sourceId ?? this.sourceId,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      status: status ?? this.status,
      urgency: urgency ?? this.urgency,
      category: category ?? this.category,
      dueAtWall: dueAtWall ?? this.dueAtWall,
      amountMinorUnits: amountMinorUnits ?? this.amountMinorUnits,
      currency: currency ?? this.currency,
      recommendedNextStep: recommendedNextStep ?? this.recommendedNextStep,
      whyThisMatters: whyThisMatters ?? this.whyThisMatters,
      origin: origin ?? this.origin,
      reviewedAtMicros: reviewedAtMicros ?? this.reviewedAtMicros,
      createdAtMicros: createdAtMicros ?? this.createdAtMicros,
      updatedAtMicros: updatedAtMicros ?? this.updatedAtMicros,
      completedAtMicros: completedAtMicros ?? this.completedAtMicros,
      archivedAtMicros: archivedAtMicros ?? this.archivedAtMicros,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (urgency.present) {
      map['urgency'] = Variable<String>(urgency.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (dueAtWall.present) {
      map['due_at_wall'] = Variable<String>(dueAtWall.value);
    }
    if (amountMinorUnits.present) {
      map['amount_minor_units'] = Variable<int>(amountMinorUnits.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (recommendedNextStep.present) {
      map['recommended_next_step'] = Variable<String>(
        recommendedNextStep.value,
      );
    }
    if (whyThisMatters.present) {
      map['why_this_matters'] = Variable<String>(whyThisMatters.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (reviewedAtMicros.present) {
      map['reviewed_at_micros'] = Variable<int>(reviewedAtMicros.value);
    }
    if (createdAtMicros.present) {
      map['created_at_micros'] = Variable<int>(createdAtMicros.value);
    }
    if (updatedAtMicros.present) {
      map['updated_at_micros'] = Variable<int>(updatedAtMicros.value);
    }
    if (completedAtMicros.present) {
      map['completed_at_micros'] = Variable<int>(completedAtMicros.value);
    }
    if (archivedAtMicros.present) {
      map['archived_at_micros'] = Variable<int>(archivedAtMicros.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionsTableCompanion(')
          ..write('id: $id, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('sourceId: $sourceId, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('status: $status, ')
          ..write('urgency: $urgency, ')
          ..write('category: $category, ')
          ..write('dueAtWall: $dueAtWall, ')
          ..write('amountMinorUnits: $amountMinorUnits, ')
          ..write('currency: $currency, ')
          ..write('recommendedNextStep: $recommendedNextStep, ')
          ..write('whyThisMatters: $whyThisMatters, ')
          ..write('origin: $origin, ')
          ..write('reviewedAtMicros: $reviewedAtMicros, ')
          ..write('createdAtMicros: $createdAtMicros, ')
          ..write('updatedAtMicros: $updatedAtMicros, ')
          ..write('completedAtMicros: $completedAtMicros, ')
          ..write('archivedAtMicros: $archivedAtMicros, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActionStepsTableTable extends ActionStepsTable
    with TableInfo<$ActionStepsTableTable, ActionStepRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionStepsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _actionIdMeta = const VerificationMeta(
    'actionId',
  );
  @override
  late final GeneratedColumn<String> actionId = GeneratedColumn<String>(
    'action_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dueAtWallMeta = const VerificationMeta(
    'dueAtWall',
  );
  @override
  late final GeneratedColumn<String> dueAtWall = GeneratedColumn<String>(
    'due_at_wall',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    actionId,
    orderIndex,
    title,
    description,
    dueAtWall,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActionStepRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('action_id')) {
      context.handle(
        _actionIdMeta,
        actionId.isAcceptableOrUnknown(data['action_id']!, _actionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_actionIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('due_at_wall')) {
      context.handle(
        _dueAtWallMeta,
        dueAtWall.isAcceptableOrUnknown(data['due_at_wall']!, _dueAtWallMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {actionId, orderIndex};
  @override
  ActionStepRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionStepRow(
      actionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_id'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      dueAtWall: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}due_at_wall'],
      ),
    );
  }

  @override
  $ActionStepsTableTable createAlias(String alias) {
    return $ActionStepsTableTable(attachedDatabase, alias);
  }
}

class ActionStepRow extends DataClass implements Insertable<ActionStepRow> {
  final String actionId;
  final int orderIndex;
  final String title;
  final String? description;
  final String? dueAtWall;
  const ActionStepRow({
    required this.actionId,
    required this.orderIndex,
    required this.title,
    this.description,
    this.dueAtWall,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['action_id'] = Variable<String>(actionId);
    map['order_index'] = Variable<int>(orderIndex);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || dueAtWall != null) {
      map['due_at_wall'] = Variable<String>(dueAtWall);
    }
    return map;
  }

  ActionStepsTableCompanion toCompanion(bool nullToAbsent) {
    return ActionStepsTableCompanion(
      actionId: Value(actionId),
      orderIndex: Value(orderIndex),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dueAtWall: dueAtWall == null && nullToAbsent
          ? const Value.absent()
          : Value(dueAtWall),
    );
  }

  factory ActionStepRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionStepRow(
      actionId: serializer.fromJson<String>(json['actionId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      dueAtWall: serializer.fromJson<String?>(json['dueAtWall']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'actionId': serializer.toJson<String>(actionId),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'dueAtWall': serializer.toJson<String?>(dueAtWall),
    };
  }

  ActionStepRow copyWith({
    String? actionId,
    int? orderIndex,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> dueAtWall = const Value.absent(),
  }) => ActionStepRow(
    actionId: actionId ?? this.actionId,
    orderIndex: orderIndex ?? this.orderIndex,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    dueAtWall: dueAtWall.present ? dueAtWall.value : this.dueAtWall,
  );
  ActionStepRow copyWithCompanion(ActionStepsTableCompanion data) {
    return ActionStepRow(
      actionId: data.actionId.present ? data.actionId.value : this.actionId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      dueAtWall: data.dueAtWall.present ? data.dueAtWall.value : this.dueAtWall,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionStepRow(')
          ..write('actionId: $actionId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dueAtWall: $dueAtWall')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(actionId, orderIndex, title, description, dueAtWall);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionStepRow &&
          other.actionId == this.actionId &&
          other.orderIndex == this.orderIndex &&
          other.title == this.title &&
          other.description == this.description &&
          other.dueAtWall == this.dueAtWall);
}

class ActionStepsTableCompanion extends UpdateCompanion<ActionStepRow> {
  final Value<String> actionId;
  final Value<int> orderIndex;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> dueAtWall;
  final Value<int> rowid;
  const ActionStepsTableCompanion({
    this.actionId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.dueAtWall = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActionStepsTableCompanion.insert({
    required String actionId,
    required int orderIndex,
    required String title,
    this.description = const Value.absent(),
    this.dueAtWall = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : actionId = Value(actionId),
       orderIndex = Value(orderIndex),
       title = Value(title);
  static Insertable<ActionStepRow> custom({
    Expression<String>? actionId,
    Expression<int>? orderIndex,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? dueAtWall,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (actionId != null) 'action_id': actionId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (dueAtWall != null) 'due_at_wall': dueAtWall,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActionStepsTableCompanion copyWith({
    Value<String>? actionId,
    Value<int>? orderIndex,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? dueAtWall,
    Value<int>? rowid,
  }) {
    return ActionStepsTableCompanion(
      actionId: actionId ?? this.actionId,
      orderIndex: orderIndex ?? this.orderIndex,
      title: title ?? this.title,
      description: description ?? this.description,
      dueAtWall: dueAtWall ?? this.dueAtWall,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (actionId.present) {
      map['action_id'] = Variable<String>(actionId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dueAtWall.present) {
      map['due_at_wall'] = Variable<String>(dueAtWall.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionStepsTableCompanion(')
          ..write('actionId: $actionId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dueAtWall: $dueAtWall, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActionFactsTableTable extends ActionFactsTable
    with TableInfo<$ActionFactsTableTable, ActionFactRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionFactsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _actionIdMeta = const VerificationMeta(
    'actionId',
  );
  @override
  late final GeneratedColumn<String> actionId = GeneratedColumn<String>(
    'action_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _factKeyMeta = const VerificationMeta(
    'factKey',
  );
  @override
  late final GeneratedColumn<String> factKey = GeneratedColumn<String>(
    'fact_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _editedByUserMeta = const VerificationMeta(
    'editedByUser',
  );
  @override
  late final GeneratedColumn<bool> editedByUser = GeneratedColumn<bool>(
    'edited_by_user',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("edited_by_user" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    actionId,
    factKey,
    label,
    value,
    editedByUser,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_facts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActionFactRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('action_id')) {
      context.handle(
        _actionIdMeta,
        actionId.isAcceptableOrUnknown(data['action_id']!, _actionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_actionIdMeta);
    }
    if (data.containsKey('fact_key')) {
      context.handle(
        _factKeyMeta,
        factKey.isAcceptableOrUnknown(data['fact_key']!, _factKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_factKeyMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('edited_by_user')) {
      context.handle(
        _editedByUserMeta,
        editedByUser.isAcceptableOrUnknown(
          data['edited_by_user']!,
          _editedByUserMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_editedByUserMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {actionId, factKey};
  @override
  ActionFactRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionFactRow(
      actionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_id'],
      )!,
      factKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fact_key'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      editedByUser: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}edited_by_user'],
      )!,
    );
  }

  @override
  $ActionFactsTableTable createAlias(String alias) {
    return $ActionFactsTableTable(attachedDatabase, alias);
  }
}

class ActionFactRow extends DataClass implements Insertable<ActionFactRow> {
  final String actionId;
  final String factKey;
  final String label;
  final String value;
  final bool editedByUser;
  const ActionFactRow({
    required this.actionId,
    required this.factKey,
    required this.label,
    required this.value,
    required this.editedByUser,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['action_id'] = Variable<String>(actionId);
    map['fact_key'] = Variable<String>(factKey);
    map['label'] = Variable<String>(label);
    map['value'] = Variable<String>(value);
    map['edited_by_user'] = Variable<bool>(editedByUser);
    return map;
  }

  ActionFactsTableCompanion toCompanion(bool nullToAbsent) {
    return ActionFactsTableCompanion(
      actionId: Value(actionId),
      factKey: Value(factKey),
      label: Value(label),
      value: Value(value),
      editedByUser: Value(editedByUser),
    );
  }

  factory ActionFactRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionFactRow(
      actionId: serializer.fromJson<String>(json['actionId']),
      factKey: serializer.fromJson<String>(json['factKey']),
      label: serializer.fromJson<String>(json['label']),
      value: serializer.fromJson<String>(json['value']),
      editedByUser: serializer.fromJson<bool>(json['editedByUser']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'actionId': serializer.toJson<String>(actionId),
      'factKey': serializer.toJson<String>(factKey),
      'label': serializer.toJson<String>(label),
      'value': serializer.toJson<String>(value),
      'editedByUser': serializer.toJson<bool>(editedByUser),
    };
  }

  ActionFactRow copyWith({
    String? actionId,
    String? factKey,
    String? label,
    String? value,
    bool? editedByUser,
  }) => ActionFactRow(
    actionId: actionId ?? this.actionId,
    factKey: factKey ?? this.factKey,
    label: label ?? this.label,
    value: value ?? this.value,
    editedByUser: editedByUser ?? this.editedByUser,
  );
  ActionFactRow copyWithCompanion(ActionFactsTableCompanion data) {
    return ActionFactRow(
      actionId: data.actionId.present ? data.actionId.value : this.actionId,
      factKey: data.factKey.present ? data.factKey.value : this.factKey,
      label: data.label.present ? data.label.value : this.label,
      value: data.value.present ? data.value.value : this.value,
      editedByUser: data.editedByUser.present
          ? data.editedByUser.value
          : this.editedByUser,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionFactRow(')
          ..write('actionId: $actionId, ')
          ..write('factKey: $factKey, ')
          ..write('label: $label, ')
          ..write('value: $value, ')
          ..write('editedByUser: $editedByUser')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(actionId, factKey, label, value, editedByUser);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionFactRow &&
          other.actionId == this.actionId &&
          other.factKey == this.factKey &&
          other.label == this.label &&
          other.value == this.value &&
          other.editedByUser == this.editedByUser);
}

class ActionFactsTableCompanion extends UpdateCompanion<ActionFactRow> {
  final Value<String> actionId;
  final Value<String> factKey;
  final Value<String> label;
  final Value<String> value;
  final Value<bool> editedByUser;
  final Value<int> rowid;
  const ActionFactsTableCompanion({
    this.actionId = const Value.absent(),
    this.factKey = const Value.absent(),
    this.label = const Value.absent(),
    this.value = const Value.absent(),
    this.editedByUser = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActionFactsTableCompanion.insert({
    required String actionId,
    required String factKey,
    required String label,
    required String value,
    required bool editedByUser,
    this.rowid = const Value.absent(),
  }) : actionId = Value(actionId),
       factKey = Value(factKey),
       label = Value(label),
       value = Value(value),
       editedByUser = Value(editedByUser);
  static Insertable<ActionFactRow> custom({
    Expression<String>? actionId,
    Expression<String>? factKey,
    Expression<String>? label,
    Expression<String>? value,
    Expression<bool>? editedByUser,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (actionId != null) 'action_id': actionId,
      if (factKey != null) 'fact_key': factKey,
      if (label != null) 'label': label,
      if (value != null) 'value': value,
      if (editedByUser != null) 'edited_by_user': editedByUser,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActionFactsTableCompanion copyWith({
    Value<String>? actionId,
    Value<String>? factKey,
    Value<String>? label,
    Value<String>? value,
    Value<bool>? editedByUser,
    Value<int>? rowid,
  }) {
    return ActionFactsTableCompanion(
      actionId: actionId ?? this.actionId,
      factKey: factKey ?? this.factKey,
      label: label ?? this.label,
      value: value ?? this.value,
      editedByUser: editedByUser ?? this.editedByUser,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (actionId.present) {
      map['action_id'] = Variable<String>(actionId.value);
    }
    if (factKey.present) {
      map['fact_key'] = Variable<String>(factKey.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (editedByUser.present) {
      map['edited_by_user'] = Variable<bool>(editedByUser.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionFactsTableCompanion(')
          ..write('actionId: $actionId, ')
          ..write('factKey: $factKey, ')
          ..write('label: $label, ')
          ..write('value: $value, ')
          ..write('editedByUser: $editedByUser, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncOutboxTableTable extends SyncOutboxTable
    with TableInfo<$SyncOutboxTableTable, SyncOutboxRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncOutboxTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _actionIdMeta = const VerificationMeta(
    'actionId',
  );
  @override
  late final GeneratedColumn<String> actionId = GeneratedColumn<String>(
    'action_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMicrosMeta = const VerificationMeta(
    'createdAtMicros',
  );
  @override
  late final GeneratedColumn<int> createdAtMicros = GeneratedColumn<int>(
    'created_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextAttemptAtMicrosMeta =
      const VerificationMeta('nextAttemptAtMicros');
  @override
  late final GeneratedColumn<int> nextAttemptAtMicros = GeneratedColumn<int>(
    'next_attempt_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastFailureClassMeta = const VerificationMeta(
    'lastFailureClass',
  );
  @override
  late final GeneratedColumn<String> lastFailureClass = GeneratedColumn<String>(
    'last_failure_class',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    actionId,
    operation,
    attempts,
    createdAtMicros,
    nextAttemptAtMicros,
    lastFailureClass,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_outbox';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncOutboxRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('action_id')) {
      context.handle(
        _actionIdMeta,
        actionId.isAcceptableOrUnknown(data['action_id']!, _actionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_actionIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('created_at_micros')) {
      context.handle(
        _createdAtMicrosMeta,
        createdAtMicros.isAcceptableOrUnknown(
          data['created_at_micros']!,
          _createdAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtMicrosMeta);
    }
    if (data.containsKey('next_attempt_at_micros')) {
      context.handle(
        _nextAttemptAtMicrosMeta,
        nextAttemptAtMicros.isAcceptableOrUnknown(
          data['next_attempt_at_micros']!,
          _nextAttemptAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextAttemptAtMicrosMeta);
    }
    if (data.containsKey('last_failure_class')) {
      context.handle(
        _lastFailureClassMeta,
        lastFailureClass.isAcceptableOrUnknown(
          data['last_failure_class']!,
          _lastFailureClassMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {actionId};
  @override
  SyncOutboxRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncOutboxRow(
      actionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_id'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      createdAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at_micros'],
      )!,
      nextAttemptAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_attempt_at_micros'],
      )!,
      lastFailureClass: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_failure_class'],
      ),
    );
  }

  @override
  $SyncOutboxTableTable createAlias(String alias) {
    return $SyncOutboxTableTable(attachedDatabase, alias);
  }
}

class SyncOutboxRow extends DataClass implements Insertable<SyncOutboxRow> {
  final String actionId;
  final String operation;
  final int attempts;
  final int createdAtMicros;
  final int nextAttemptAtMicros;
  final String? lastFailureClass;
  const SyncOutboxRow({
    required this.actionId,
    required this.operation,
    required this.attempts,
    required this.createdAtMicros,
    required this.nextAttemptAtMicros,
    this.lastFailureClass,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['action_id'] = Variable<String>(actionId);
    map['operation'] = Variable<String>(operation);
    map['attempts'] = Variable<int>(attempts);
    map['created_at_micros'] = Variable<int>(createdAtMicros);
    map['next_attempt_at_micros'] = Variable<int>(nextAttemptAtMicros);
    if (!nullToAbsent || lastFailureClass != null) {
      map['last_failure_class'] = Variable<String>(lastFailureClass);
    }
    return map;
  }

  SyncOutboxTableCompanion toCompanion(bool nullToAbsent) {
    return SyncOutboxTableCompanion(
      actionId: Value(actionId),
      operation: Value(operation),
      attempts: Value(attempts),
      createdAtMicros: Value(createdAtMicros),
      nextAttemptAtMicros: Value(nextAttemptAtMicros),
      lastFailureClass: lastFailureClass == null && nullToAbsent
          ? const Value.absent()
          : Value(lastFailureClass),
    );
  }

  factory SyncOutboxRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncOutboxRow(
      actionId: serializer.fromJson<String>(json['actionId']),
      operation: serializer.fromJson<String>(json['operation']),
      attempts: serializer.fromJson<int>(json['attempts']),
      createdAtMicros: serializer.fromJson<int>(json['createdAtMicros']),
      nextAttemptAtMicros: serializer.fromJson<int>(
        json['nextAttemptAtMicros'],
      ),
      lastFailureClass: serializer.fromJson<String?>(json['lastFailureClass']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'actionId': serializer.toJson<String>(actionId),
      'operation': serializer.toJson<String>(operation),
      'attempts': serializer.toJson<int>(attempts),
      'createdAtMicros': serializer.toJson<int>(createdAtMicros),
      'nextAttemptAtMicros': serializer.toJson<int>(nextAttemptAtMicros),
      'lastFailureClass': serializer.toJson<String?>(lastFailureClass),
    };
  }

  SyncOutboxRow copyWith({
    String? actionId,
    String? operation,
    int? attempts,
    int? createdAtMicros,
    int? nextAttemptAtMicros,
    Value<String?> lastFailureClass = const Value.absent(),
  }) => SyncOutboxRow(
    actionId: actionId ?? this.actionId,
    operation: operation ?? this.operation,
    attempts: attempts ?? this.attempts,
    createdAtMicros: createdAtMicros ?? this.createdAtMicros,
    nextAttemptAtMicros: nextAttemptAtMicros ?? this.nextAttemptAtMicros,
    lastFailureClass: lastFailureClass.present
        ? lastFailureClass.value
        : this.lastFailureClass,
  );
  SyncOutboxRow copyWithCompanion(SyncOutboxTableCompanion data) {
    return SyncOutboxRow(
      actionId: data.actionId.present ? data.actionId.value : this.actionId,
      operation: data.operation.present ? data.operation.value : this.operation,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      createdAtMicros: data.createdAtMicros.present
          ? data.createdAtMicros.value
          : this.createdAtMicros,
      nextAttemptAtMicros: data.nextAttemptAtMicros.present
          ? data.nextAttemptAtMicros.value
          : this.nextAttemptAtMicros,
      lastFailureClass: data.lastFailureClass.present
          ? data.lastFailureClass.value
          : this.lastFailureClass,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxRow(')
          ..write('actionId: $actionId, ')
          ..write('operation: $operation, ')
          ..write('attempts: $attempts, ')
          ..write('createdAtMicros: $createdAtMicros, ')
          ..write('nextAttemptAtMicros: $nextAttemptAtMicros, ')
          ..write('lastFailureClass: $lastFailureClass')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    actionId,
    operation,
    attempts,
    createdAtMicros,
    nextAttemptAtMicros,
    lastFailureClass,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncOutboxRow &&
          other.actionId == this.actionId &&
          other.operation == this.operation &&
          other.attempts == this.attempts &&
          other.createdAtMicros == this.createdAtMicros &&
          other.nextAttemptAtMicros == this.nextAttemptAtMicros &&
          other.lastFailureClass == this.lastFailureClass);
}

class SyncOutboxTableCompanion extends UpdateCompanion<SyncOutboxRow> {
  final Value<String> actionId;
  final Value<String> operation;
  final Value<int> attempts;
  final Value<int> createdAtMicros;
  final Value<int> nextAttemptAtMicros;
  final Value<String?> lastFailureClass;
  final Value<int> rowid;
  const SyncOutboxTableCompanion({
    this.actionId = const Value.absent(),
    this.operation = const Value.absent(),
    this.attempts = const Value.absent(),
    this.createdAtMicros = const Value.absent(),
    this.nextAttemptAtMicros = const Value.absent(),
    this.lastFailureClass = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncOutboxTableCompanion.insert({
    required String actionId,
    required String operation,
    this.attempts = const Value.absent(),
    required int createdAtMicros,
    required int nextAttemptAtMicros,
    this.lastFailureClass = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : actionId = Value(actionId),
       operation = Value(operation),
       createdAtMicros = Value(createdAtMicros),
       nextAttemptAtMicros = Value(nextAttemptAtMicros);
  static Insertable<SyncOutboxRow> custom({
    Expression<String>? actionId,
    Expression<String>? operation,
    Expression<int>? attempts,
    Expression<int>? createdAtMicros,
    Expression<int>? nextAttemptAtMicros,
    Expression<String>? lastFailureClass,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (actionId != null) 'action_id': actionId,
      if (operation != null) 'operation': operation,
      if (attempts != null) 'attempts': attempts,
      if (createdAtMicros != null) 'created_at_micros': createdAtMicros,
      if (nextAttemptAtMicros != null)
        'next_attempt_at_micros': nextAttemptAtMicros,
      if (lastFailureClass != null) 'last_failure_class': lastFailureClass,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncOutboxTableCompanion copyWith({
    Value<String>? actionId,
    Value<String>? operation,
    Value<int>? attempts,
    Value<int>? createdAtMicros,
    Value<int>? nextAttemptAtMicros,
    Value<String?>? lastFailureClass,
    Value<int>? rowid,
  }) {
    return SyncOutboxTableCompanion(
      actionId: actionId ?? this.actionId,
      operation: operation ?? this.operation,
      attempts: attempts ?? this.attempts,
      createdAtMicros: createdAtMicros ?? this.createdAtMicros,
      nextAttemptAtMicros: nextAttemptAtMicros ?? this.nextAttemptAtMicros,
      lastFailureClass: lastFailureClass ?? this.lastFailureClass,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (actionId.present) {
      map['action_id'] = Variable<String>(actionId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (createdAtMicros.present) {
      map['created_at_micros'] = Variable<int>(createdAtMicros.value);
    }
    if (nextAttemptAtMicros.present) {
      map['next_attempt_at_micros'] = Variable<int>(nextAttemptAtMicros.value);
    }
    if (lastFailureClass.present) {
      map['last_failure_class'] = Variable<String>(lastFailureClass.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxTableCompanion(')
          ..write('actionId: $actionId, ')
          ..write('operation: $operation, ')
          ..write('attempts: $attempts, ')
          ..write('createdAtMicros: $createdAtMicros, ')
          ..write('nextAttemptAtMicros: $nextAttemptAtMicros, ')
          ..write('lastFailureClass: $lastFailureClass, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$ActionsDatabase extends GeneratedDatabase {
  _$ActionsDatabase(QueryExecutor e) : super(e);
  $ActionsDatabaseManager get managers => $ActionsDatabaseManager(this);
  late final $ActionsTableTable actionsTable = $ActionsTableTable(this);
  late final $ActionStepsTableTable actionStepsTable = $ActionStepsTableTable(
    this,
  );
  late final $ActionFactsTableTable actionFactsTable = $ActionFactsTableTable(
    this,
  );
  late final $SyncOutboxTableTable syncOutboxTable = $SyncOutboxTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    actionsTable,
    actionStepsTable,
    actionFactsTable,
    syncOutboxTable,
  ];
}

typedef $$ActionsTableTableCreateCompanionBuilder =
    ActionsTableCompanion Function({
      required String id,
      required int schemaVersion,
      Value<String?> sourceId,
      required String title,
      Value<String?> summary,
      required String status,
      required String urgency,
      required String category,
      Value<String?> dueAtWall,
      Value<int?> amountMinorUnits,
      Value<String?> currency,
      Value<String?> recommendedNextStep,
      Value<String?> whyThisMatters,
      required String origin,
      Value<int?> reviewedAtMicros,
      required int createdAtMicros,
      required int updatedAtMicros,
      Value<int?> completedAtMicros,
      Value<int?> archivedAtMicros,
      Value<int> rowid,
    });
typedef $$ActionsTableTableUpdateCompanionBuilder =
    ActionsTableCompanion Function({
      Value<String> id,
      Value<int> schemaVersion,
      Value<String?> sourceId,
      Value<String> title,
      Value<String?> summary,
      Value<String> status,
      Value<String> urgency,
      Value<String> category,
      Value<String?> dueAtWall,
      Value<int?> amountMinorUnits,
      Value<String?> currency,
      Value<String?> recommendedNextStep,
      Value<String?> whyThisMatters,
      Value<String> origin,
      Value<int?> reviewedAtMicros,
      Value<int> createdAtMicros,
      Value<int> updatedAtMicros,
      Value<int?> completedAtMicros,
      Value<int?> archivedAtMicros,
      Value<int> rowid,
    });

class $$ActionsTableTableFilterComposer
    extends Composer<_$ActionsDatabase, $ActionsTableTable> {
  $$ActionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urgency => $composableBuilder(
    column: $table.urgency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dueAtWall => $composableBuilder(
    column: $table.dueAtWall,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinorUnits => $composableBuilder(
    column: $table.amountMinorUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recommendedNextStep => $composableBuilder(
    column: $table.recommendedNextStep,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whyThisMatters => $composableBuilder(
    column: $table.whyThisMatters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewedAtMicros => $composableBuilder(
    column: $table.reviewedAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedAtMicros => $composableBuilder(
    column: $table.completedAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get archivedAtMicros => $composableBuilder(
    column: $table.archivedAtMicros,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActionsTableTableOrderingComposer
    extends Composer<_$ActionsDatabase, $ActionsTableTable> {
  $$ActionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urgency => $composableBuilder(
    column: $table.urgency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dueAtWall => $composableBuilder(
    column: $table.dueAtWall,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinorUnits => $composableBuilder(
    column: $table.amountMinorUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recommendedNextStep => $composableBuilder(
    column: $table.recommendedNextStep,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whyThisMatters => $composableBuilder(
    column: $table.whyThisMatters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewedAtMicros => $composableBuilder(
    column: $table.reviewedAtMicros,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedAtMicros => $composableBuilder(
    column: $table.completedAtMicros,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get archivedAtMicros => $composableBuilder(
    column: $table.archivedAtMicros,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActionsTableTableAnnotationComposer
    extends Composer<_$ActionsDatabase, $ActionsTableTable> {
  $$ActionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get urgency =>
      $composableBuilder(column: $table.urgency, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get dueAtWall =>
      $composableBuilder(column: $table.dueAtWall, builder: (column) => column);

  GeneratedColumn<int> get amountMinorUnits => $composableBuilder(
    column: $table.amountMinorUnits,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get recommendedNextStep => $composableBuilder(
    column: $table.recommendedNextStep,
    builder: (column) => column,
  );

  GeneratedColumn<String> get whyThisMatters => $composableBuilder(
    column: $table.whyThisMatters,
    builder: (column) => column,
  );

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<int> get reviewedAtMicros => $composableBuilder(
    column: $table.reviewedAtMicros,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completedAtMicros => $composableBuilder(
    column: $table.completedAtMicros,
    builder: (column) => column,
  );

  GeneratedColumn<int> get archivedAtMicros => $composableBuilder(
    column: $table.archivedAtMicros,
    builder: (column) => column,
  );
}

class $$ActionsTableTableTableManager
    extends
        RootTableManager<
          _$ActionsDatabase,
          $ActionsTableTable,
          ActionRow,
          $$ActionsTableTableFilterComposer,
          $$ActionsTableTableOrderingComposer,
          $$ActionsTableTableAnnotationComposer,
          $$ActionsTableTableCreateCompanionBuilder,
          $$ActionsTableTableUpdateCompanionBuilder,
          (
            ActionRow,
            BaseReferences<_$ActionsDatabase, $ActionsTableTable, ActionRow>,
          ),
          ActionRow,
          PrefetchHooks Function()
        > {
  $$ActionsTableTableTableManager(
    _$ActionsDatabase db,
    $ActionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActionsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<String?> sourceId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> urgency = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> dueAtWall = const Value.absent(),
                Value<int?> amountMinorUnits = const Value.absent(),
                Value<String?> currency = const Value.absent(),
                Value<String?> recommendedNextStep = const Value.absent(),
                Value<String?> whyThisMatters = const Value.absent(),
                Value<String> origin = const Value.absent(),
                Value<int?> reviewedAtMicros = const Value.absent(),
                Value<int> createdAtMicros = const Value.absent(),
                Value<int> updatedAtMicros = const Value.absent(),
                Value<int?> completedAtMicros = const Value.absent(),
                Value<int?> archivedAtMicros = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActionsTableCompanion(
                id: id,
                schemaVersion: schemaVersion,
                sourceId: sourceId,
                title: title,
                summary: summary,
                status: status,
                urgency: urgency,
                category: category,
                dueAtWall: dueAtWall,
                amountMinorUnits: amountMinorUnits,
                currency: currency,
                recommendedNextStep: recommendedNextStep,
                whyThisMatters: whyThisMatters,
                origin: origin,
                reviewedAtMicros: reviewedAtMicros,
                createdAtMicros: createdAtMicros,
                updatedAtMicros: updatedAtMicros,
                completedAtMicros: completedAtMicros,
                archivedAtMicros: archivedAtMicros,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int schemaVersion,
                Value<String?> sourceId = const Value.absent(),
                required String title,
                Value<String?> summary = const Value.absent(),
                required String status,
                required String urgency,
                required String category,
                Value<String?> dueAtWall = const Value.absent(),
                Value<int?> amountMinorUnits = const Value.absent(),
                Value<String?> currency = const Value.absent(),
                Value<String?> recommendedNextStep = const Value.absent(),
                Value<String?> whyThisMatters = const Value.absent(),
                required String origin,
                Value<int?> reviewedAtMicros = const Value.absent(),
                required int createdAtMicros,
                required int updatedAtMicros,
                Value<int?> completedAtMicros = const Value.absent(),
                Value<int?> archivedAtMicros = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActionsTableCompanion.insert(
                id: id,
                schemaVersion: schemaVersion,
                sourceId: sourceId,
                title: title,
                summary: summary,
                status: status,
                urgency: urgency,
                category: category,
                dueAtWall: dueAtWall,
                amountMinorUnits: amountMinorUnits,
                currency: currency,
                recommendedNextStep: recommendedNextStep,
                whyThisMatters: whyThisMatters,
                origin: origin,
                reviewedAtMicros: reviewedAtMicros,
                createdAtMicros: createdAtMicros,
                updatedAtMicros: updatedAtMicros,
                completedAtMicros: completedAtMicros,
                archivedAtMicros: archivedAtMicros,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ActionsDatabase,
      $ActionsTableTable,
      ActionRow,
      $$ActionsTableTableFilterComposer,
      $$ActionsTableTableOrderingComposer,
      $$ActionsTableTableAnnotationComposer,
      $$ActionsTableTableCreateCompanionBuilder,
      $$ActionsTableTableUpdateCompanionBuilder,
      (
        ActionRow,
        BaseReferences<_$ActionsDatabase, $ActionsTableTable, ActionRow>,
      ),
      ActionRow,
      PrefetchHooks Function()
    >;
typedef $$ActionStepsTableTableCreateCompanionBuilder =
    ActionStepsTableCompanion Function({
      required String actionId,
      required int orderIndex,
      required String title,
      Value<String?> description,
      Value<String?> dueAtWall,
      Value<int> rowid,
    });
typedef $$ActionStepsTableTableUpdateCompanionBuilder =
    ActionStepsTableCompanion Function({
      Value<String> actionId,
      Value<int> orderIndex,
      Value<String> title,
      Value<String?> description,
      Value<String?> dueAtWall,
      Value<int> rowid,
    });

class $$ActionStepsTableTableFilterComposer
    extends Composer<_$ActionsDatabase, $ActionStepsTableTable> {
  $$ActionStepsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get actionId => $composableBuilder(
    column: $table.actionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dueAtWall => $composableBuilder(
    column: $table.dueAtWall,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActionStepsTableTableOrderingComposer
    extends Composer<_$ActionsDatabase, $ActionStepsTableTable> {
  $$ActionStepsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get actionId => $composableBuilder(
    column: $table.actionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dueAtWall => $composableBuilder(
    column: $table.dueAtWall,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActionStepsTableTableAnnotationComposer
    extends Composer<_$ActionsDatabase, $ActionStepsTableTable> {
  $$ActionStepsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get actionId =>
      $composableBuilder(column: $table.actionId, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dueAtWall =>
      $composableBuilder(column: $table.dueAtWall, builder: (column) => column);
}

class $$ActionStepsTableTableTableManager
    extends
        RootTableManager<
          _$ActionsDatabase,
          $ActionStepsTableTable,
          ActionStepRow,
          $$ActionStepsTableTableFilterComposer,
          $$ActionStepsTableTableOrderingComposer,
          $$ActionStepsTableTableAnnotationComposer,
          $$ActionStepsTableTableCreateCompanionBuilder,
          $$ActionStepsTableTableUpdateCompanionBuilder,
          (
            ActionStepRow,
            BaseReferences<
              _$ActionsDatabase,
              $ActionStepsTableTable,
              ActionStepRow
            >,
          ),
          ActionStepRow,
          PrefetchHooks Function()
        > {
  $$ActionStepsTableTableTableManager(
    _$ActionsDatabase db,
    $ActionStepsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActionStepsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActionStepsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActionStepsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> actionId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> dueAtWall = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActionStepsTableCompanion(
                actionId: actionId,
                orderIndex: orderIndex,
                title: title,
                description: description,
                dueAtWall: dueAtWall,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String actionId,
                required int orderIndex,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> dueAtWall = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActionStepsTableCompanion.insert(
                actionId: actionId,
                orderIndex: orderIndex,
                title: title,
                description: description,
                dueAtWall: dueAtWall,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActionStepsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ActionsDatabase,
      $ActionStepsTableTable,
      ActionStepRow,
      $$ActionStepsTableTableFilterComposer,
      $$ActionStepsTableTableOrderingComposer,
      $$ActionStepsTableTableAnnotationComposer,
      $$ActionStepsTableTableCreateCompanionBuilder,
      $$ActionStepsTableTableUpdateCompanionBuilder,
      (
        ActionStepRow,
        BaseReferences<
          _$ActionsDatabase,
          $ActionStepsTableTable,
          ActionStepRow
        >,
      ),
      ActionStepRow,
      PrefetchHooks Function()
    >;
typedef $$ActionFactsTableTableCreateCompanionBuilder =
    ActionFactsTableCompanion Function({
      required String actionId,
      required String factKey,
      required String label,
      required String value,
      required bool editedByUser,
      Value<int> rowid,
    });
typedef $$ActionFactsTableTableUpdateCompanionBuilder =
    ActionFactsTableCompanion Function({
      Value<String> actionId,
      Value<String> factKey,
      Value<String> label,
      Value<String> value,
      Value<bool> editedByUser,
      Value<int> rowid,
    });

class $$ActionFactsTableTableFilterComposer
    extends Composer<_$ActionsDatabase, $ActionFactsTableTable> {
  $$ActionFactsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get actionId => $composableBuilder(
    column: $table.actionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get factKey => $composableBuilder(
    column: $table.factKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get editedByUser => $composableBuilder(
    column: $table.editedByUser,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActionFactsTableTableOrderingComposer
    extends Composer<_$ActionsDatabase, $ActionFactsTableTable> {
  $$ActionFactsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get actionId => $composableBuilder(
    column: $table.actionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get factKey => $composableBuilder(
    column: $table.factKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get editedByUser => $composableBuilder(
    column: $table.editedByUser,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActionFactsTableTableAnnotationComposer
    extends Composer<_$ActionsDatabase, $ActionFactsTableTable> {
  $$ActionFactsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get actionId =>
      $composableBuilder(column: $table.actionId, builder: (column) => column);

  GeneratedColumn<String> get factKey =>
      $composableBuilder(column: $table.factKey, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<bool> get editedByUser => $composableBuilder(
    column: $table.editedByUser,
    builder: (column) => column,
  );
}

class $$ActionFactsTableTableTableManager
    extends
        RootTableManager<
          _$ActionsDatabase,
          $ActionFactsTableTable,
          ActionFactRow,
          $$ActionFactsTableTableFilterComposer,
          $$ActionFactsTableTableOrderingComposer,
          $$ActionFactsTableTableAnnotationComposer,
          $$ActionFactsTableTableCreateCompanionBuilder,
          $$ActionFactsTableTableUpdateCompanionBuilder,
          (
            ActionFactRow,
            BaseReferences<
              _$ActionsDatabase,
              $ActionFactsTableTable,
              ActionFactRow
            >,
          ),
          ActionFactRow,
          PrefetchHooks Function()
        > {
  $$ActionFactsTableTableTableManager(
    _$ActionsDatabase db,
    $ActionFactsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActionFactsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActionFactsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActionFactsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> actionId = const Value.absent(),
                Value<String> factKey = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<bool> editedByUser = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActionFactsTableCompanion(
                actionId: actionId,
                factKey: factKey,
                label: label,
                value: value,
                editedByUser: editedByUser,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String actionId,
                required String factKey,
                required String label,
                required String value,
                required bool editedByUser,
                Value<int> rowid = const Value.absent(),
              }) => ActionFactsTableCompanion.insert(
                actionId: actionId,
                factKey: factKey,
                label: label,
                value: value,
                editedByUser: editedByUser,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActionFactsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ActionsDatabase,
      $ActionFactsTableTable,
      ActionFactRow,
      $$ActionFactsTableTableFilterComposer,
      $$ActionFactsTableTableOrderingComposer,
      $$ActionFactsTableTableAnnotationComposer,
      $$ActionFactsTableTableCreateCompanionBuilder,
      $$ActionFactsTableTableUpdateCompanionBuilder,
      (
        ActionFactRow,
        BaseReferences<
          _$ActionsDatabase,
          $ActionFactsTableTable,
          ActionFactRow
        >,
      ),
      ActionFactRow,
      PrefetchHooks Function()
    >;
typedef $$SyncOutboxTableTableCreateCompanionBuilder =
    SyncOutboxTableCompanion Function({
      required String actionId,
      required String operation,
      Value<int> attempts,
      required int createdAtMicros,
      required int nextAttemptAtMicros,
      Value<String?> lastFailureClass,
      Value<int> rowid,
    });
typedef $$SyncOutboxTableTableUpdateCompanionBuilder =
    SyncOutboxTableCompanion Function({
      Value<String> actionId,
      Value<String> operation,
      Value<int> attempts,
      Value<int> createdAtMicros,
      Value<int> nextAttemptAtMicros,
      Value<String?> lastFailureClass,
      Value<int> rowid,
    });

class $$SyncOutboxTableTableFilterComposer
    extends Composer<_$ActionsDatabase, $SyncOutboxTableTable> {
  $$SyncOutboxTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get actionId => $composableBuilder(
    column: $table.actionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextAttemptAtMicros => $composableBuilder(
    column: $table.nextAttemptAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastFailureClass => $composableBuilder(
    column: $table.lastFailureClass,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncOutboxTableTableOrderingComposer
    extends Composer<_$ActionsDatabase, $SyncOutboxTableTable> {
  $$SyncOutboxTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get actionId => $composableBuilder(
    column: $table.actionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextAttemptAtMicros => $composableBuilder(
    column: $table.nextAttemptAtMicros,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastFailureClass => $composableBuilder(
    column: $table.lastFailureClass,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncOutboxTableTableAnnotationComposer
    extends Composer<_$ActionsDatabase, $SyncOutboxTableTable> {
  $$SyncOutboxTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get actionId =>
      $composableBuilder(column: $table.actionId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nextAttemptAtMicros => $composableBuilder(
    column: $table.nextAttemptAtMicros,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastFailureClass => $composableBuilder(
    column: $table.lastFailureClass,
    builder: (column) => column,
  );
}

class $$SyncOutboxTableTableTableManager
    extends
        RootTableManager<
          _$ActionsDatabase,
          $SyncOutboxTableTable,
          SyncOutboxRow,
          $$SyncOutboxTableTableFilterComposer,
          $$SyncOutboxTableTableOrderingComposer,
          $$SyncOutboxTableTableAnnotationComposer,
          $$SyncOutboxTableTableCreateCompanionBuilder,
          $$SyncOutboxTableTableUpdateCompanionBuilder,
          (
            SyncOutboxRow,
            BaseReferences<
              _$ActionsDatabase,
              $SyncOutboxTableTable,
              SyncOutboxRow
            >,
          ),
          SyncOutboxRow,
          PrefetchHooks Function()
        > {
  $$SyncOutboxTableTableTableManager(
    _$ActionsDatabase db,
    $SyncOutboxTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncOutboxTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncOutboxTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncOutboxTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> actionId = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<int> createdAtMicros = const Value.absent(),
                Value<int> nextAttemptAtMicros = const Value.absent(),
                Value<String?> lastFailureClass = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncOutboxTableCompanion(
                actionId: actionId,
                operation: operation,
                attempts: attempts,
                createdAtMicros: createdAtMicros,
                nextAttemptAtMicros: nextAttemptAtMicros,
                lastFailureClass: lastFailureClass,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String actionId,
                required String operation,
                Value<int> attempts = const Value.absent(),
                required int createdAtMicros,
                required int nextAttemptAtMicros,
                Value<String?> lastFailureClass = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncOutboxTableCompanion.insert(
                actionId: actionId,
                operation: operation,
                attempts: attempts,
                createdAtMicros: createdAtMicros,
                nextAttemptAtMicros: nextAttemptAtMicros,
                lastFailureClass: lastFailureClass,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncOutboxTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ActionsDatabase,
      $SyncOutboxTableTable,
      SyncOutboxRow,
      $$SyncOutboxTableTableFilterComposer,
      $$SyncOutboxTableTableOrderingComposer,
      $$SyncOutboxTableTableAnnotationComposer,
      $$SyncOutboxTableTableCreateCompanionBuilder,
      $$SyncOutboxTableTableUpdateCompanionBuilder,
      (
        SyncOutboxRow,
        BaseReferences<_$ActionsDatabase, $SyncOutboxTableTable, SyncOutboxRow>,
      ),
      SyncOutboxRow,
      PrefetchHooks Function()
    >;

class $ActionsDatabaseManager {
  final _$ActionsDatabase _db;
  $ActionsDatabaseManager(this._db);
  $$ActionsTableTableTableManager get actionsTable =>
      $$ActionsTableTableTableManager(_db, _db.actionsTable);
  $$ActionStepsTableTableTableManager get actionStepsTable =>
      $$ActionStepsTableTableTableManager(_db, _db.actionStepsTable);
  $$ActionFactsTableTableTableManager get actionFactsTable =>
      $$ActionFactsTableTableTableManager(_db, _db.actionFactsTable);
  $$SyncOutboxTableTableTableManager get syncOutboxTable =>
      $$SyncOutboxTableTableTableManager(_db, _db.syncOutboxTable);
}
