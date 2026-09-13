# Localization glossary

Nineteen translations of the same product concept, translated nineteen
different ways, is not nineteen translations — it is nineteen products. This
file fixes the vocabulary so that the word for *Capture* on the navigation bar
is the word for *Capture* in the Library heading, in the tool description, and
in the notification.

It is the reference for anyone drafting or reviewing a locale. Where a
translation departs from this table, either the table changes or the
translation does.

---

## Rules that come before the table

**1. "Action" the product name is never translated.** It is the launcher label,
the notification channel name, the About screen. It stays `Action` in Latin
script in every locale, including the ones that do not use Latin script, for
the same reason `Gmail` is not translated.

**2. "action" the domain noun *is* translated.** "3 actions need your
attention" counts things the user made; it is a common noun and it reads as one.
Locales that would find the collision confusing (Arabic, Urdu, Japanese) use the
translated common noun throughout and reserve the Latin `Action` for the brand.

**3. A term that carries a safety meaning is not a style choice.** *Confirmed*,
*Needs review*, *Inconclusive*, *No obvious caution signals* and their
neighbours are states in an enum before they are words. If a language has a
warmer, more natural phrasing that also sounds more certain, the less certain
phrasing wins. See `docs/v2/LOCALIZATION_REVIEW_STATUS.md` and
`test/l10n/critical_copy_test.dart`.

**4. Placeholders keep their names and their count.** `{count}`, `{title}`,
`{provider}` are identifiers, not words. They may move within the sentence.
They may not be renamed, dropped, or duplicated.

**5. Do not translate: `PDF`, `OCR`, `API`, `SHA-256`, `EXIF`, `HTTPS`, `JWT`,
`C2PA`, `URL`,** provider names (`OpenAI`, `Anthropic`, `Gemini`), or model
identifiers. These are proper nouns or standards; a reader searching for help
will search for the untranslated form.

---

## The core terms

| # | English | Meaning in this product |
|---|---|---|
| 1 | **Action** | One thing the user has to do, with an optional deadline and steps. The central object. |
| 2 | **Capture** | The act of bringing something in — photo, screenshot, text, PDF — *and* the thing brought in before it becomes a Source. |
| 3 | **Source** | A captured item that has been stored and read: the document, the letter, the screenshot. What evidence points at. |
| 4 | **Goal** | A larger outcome that several Actions serve. |
| 5 | **Collection** | *Not shipped — see `ACTION_V2_DECISIONS.md`.* Retained here so a future implementation does not invent a second word. |
| 6 | **Review** | The user checking what Action extracted, before anything is saved. Never "approve": the user may change it, not merely accept it. |
| 7 | **Next step** | The single next thing to do on an Action. |
| 8 | **Reminder** | A local notification at a time the user set. |
| 9 | **Today** | The daily surface. A place, not a date. |
| 10 | **Library** | Everything captured and created. A place. |
| 11 | **Intelligence** | The AI workspace. Deliberately not "AI": the user is getting help understanding something. |
| 12 | **Security** | Protections against someone else holding the device. |
| 13 | **Privacy** | What stays local and what leaves. |
| 14 | **Evidence** | The exact quoted text a fact was taken from. Never a paraphrase. |
| 15 | **Confirmed** | Grounded in the source text and checked. A state, not praise. |
| 16 | **Needs review** | Extracted but not verifiable against the source. A state, not a warning. |
| 17 | **Private** | Reduced disclosure — the private notification mode, the private preview. Never "secure" or "encrypted". |
| 18 | **Provider** | The AI service the user connected with their own key. |
| 19 | **Deadline** | The date something is due. Date-only unless a time was given. |

---

## Per-language table

Columns are the nineteen concepts above, in the same order, one language per
block. A blank means the English term is used verbatim.

### العربية — Arabic (`ar`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | إجراء |
| Capture | التقاط |
| Source | مصدر |
| Goal | هدف |
| Review | مراجعة |
| Next step | الخطوة التالية |
| Reminder | تذكير |
| Today | اليوم |
| Library | المكتبة |
| Intelligence | الذكاء |
| Security | الأمان |
| Privacy | الخصوصية |
| Evidence | الدليل |
| Confirmed | مؤكَّد |
| Needs review | يحتاج مراجعة |
| Private | خاص |
| Provider | المزوّد |
| Deadline | الموعد النهائي |

### বাংলা — Bengali (`bn`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | কাজ |
| Capture | ক্যাপচার |
| Source | উৎস |
| Goal | লক্ষ্য |
| Review | পর্যালোচনা |
| Next step | পরবর্তী ধাপ |
| Reminder | রিমাইন্ডার |
| Today | আজ |
| Library | লাইব্রেরি |
| Intelligence | ইন্টেলিজেন্স |
| Security | নিরাপত্তা |
| Privacy | গোপনীয়তা |
| Evidence | প্রমাণ |
| Confirmed | নিশ্চিত |
| Needs review | পর্যালোচনা দরকার |
| Private | ব্যক্তিগত |
| Provider | প্রোভাইডার |
| Deadline | সময়সীমা |

### Deutsch — German (`de`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | Aufgabe |
| Capture | Erfassen |
| Source | Quelle |
| Goal | Ziel |
| Review | Prüfen / Prüfung |
| Next step | Nächster Schritt |
| Reminder | Erinnerung |
| Today | Heute |
| Library | Bibliothek |
| Intelligence | Intelligenz |
| Security | Sicherheit |
| Privacy | Datenschutz |
| Evidence | Beleg |
| Confirmed | Bestätigt |
| Needs review | Prüfen |
| Private | Privat |
| Provider | Anbieter |
| Deadline | Frist |

### Español — Spanish (`es`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | tarea |
| Capture | Capturar / Captura |
| Source | Fuente |
| Goal | Objetivo |
| Review | Revisar / Revisión |
| Next step | Siguiente paso |
| Reminder | Recordatorio |
| Today | Hoy |
| Library | Biblioteca |
| Intelligence | Inteligencia |
| Security | Seguridad |
| Privacy | Privacidad |
| Evidence | Evidencia |
| Confirmed | Confirmado |
| Needs review | Requiere revisión |
| Private | Privado |
| Provider | Proveedor |
| Deadline | Fecha límite |

### Français — French (`fr`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | tâche |
| Capture | Capturer / Capture |
| Source | Source |
| Goal | Objectif |
| Review | Vérifier / Vérification |
| Next step | Étape suivante |
| Reminder | Rappel |
| Today | Aujourd'hui |
| Library | Bibliothèque |
| Intelligence | Intelligence |
| Security | Sécurité |
| Privacy | Confidentialité |
| Evidence | Preuve |
| Confirmed | Confirmé |
| Needs review | À vérifier |
| Private | Privé |
| Provider | Fournisseur |
| Deadline | Échéance |

### हिन्दी — Hindi (`hi`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | काम |
| Capture | कैप्चर |
| Source | स्रोत |
| Goal | लक्ष्य |
| Review | समीक्षा |
| Next step | अगला कदम |
| Reminder | रिमाइंडर |
| Today | आज |
| Library | लाइब्रेरी |
| Intelligence | इंटेलिजेंस |
| Security | सुरक्षा |
| Privacy | निजता |
| Evidence | प्रमाण |
| Confirmed | पुष्ट |
| Needs review | समीक्षा चाहिए |
| Private | निजी |
| Provider | प्रोवाइडर |
| Deadline | समय-सीमा |

### Bahasa Indonesia — Indonesian (`id`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | tugas |
| Capture | Tangkap / Tangkapan |
| Source | Sumber |
| Goal | Sasaran |
| Review | Tinjau / Tinjauan |
| Next step | Langkah berikutnya |
| Reminder | Pengingat |
| Today | Hari ini |
| Library | Pustaka |
| Intelligence | Kecerdasan |
| Security | Keamanan |
| Privacy | Privasi |
| Evidence | Bukti |
| Confirmed | Terkonfirmasi |
| Needs review | Perlu ditinjau |
| Private | Pribadi |
| Provider | Penyedia |
| Deadline | Tenggat |

### Italiano — Italian (`it`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | attività |
| Capture | Acquisire / Acquisizione |
| Source | Origine |
| Goal | Obiettivo |
| Review | Verificare / Verifica |
| Next step | Passo successivo |
| Reminder | Promemoria |
| Today | Oggi |
| Library | Raccolta |
| Intelligence | Intelligenza |
| Security | Sicurezza |
| Privacy | Privacy |
| Evidence | Prova |
| Confirmed | Confermato |
| Needs review | Da verificare |
| Private | Privato |
| Provider | Fornitore |
| Deadline | Scadenza |

### 日本語 — Japanese (`ja`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | タスク |
| Capture | 取り込み |
| Source | 元の資料 |
| Goal | 目標 |
| Review | 確認 |
| Next step | 次の一手 |
| Reminder | リマインダー |
| Today | 今日 |
| Library | ライブラリ |
| Intelligence | インテリジェンス |
| Security | セキュリティ |
| Privacy | プライバシー |
| Evidence | 根拠 |
| Confirmed | 確認済み |
| Needs review | 要確認 |
| Private | 非表示 / プライベート |
| Provider | プロバイダー |
| Deadline | 期限 |

### 한국어 — Korean (`ko`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | 할 일 |
| Capture | 캡처 |
| Source | 원본 |
| Goal | 목표 |
| Review | 검토 |
| Next step | 다음 단계 |
| Reminder | 알림 |
| Today | 오늘 |
| Library | 보관함 |
| Intelligence | 인텔리전스 |
| Security | 보안 |
| Privacy | 개인정보 |
| Evidence | 근거 |
| Confirmed | 확인됨 |
| Needs review | 검토 필요 |
| Private | 비공개 |
| Provider | 제공업체 |
| Deadline | 기한 |

### Polski — Polish (`pl`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | zadanie |
| Capture | Przechwyć / Przechwycenie |
| Source | Źródło |
| Goal | Cel |
| Review | Sprawdź / Sprawdzenie |
| Next step | Następny krok |
| Reminder | Przypomnienie |
| Today | Dzisiaj |
| Library | Biblioteka |
| Intelligence | Inteligencja |
| Security | Bezpieczeństwo |
| Privacy | Prywatność |
| Evidence | Dowód |
| Confirmed | Potwierdzone |
| Needs review | Do sprawdzenia |
| Private | Prywatne |
| Provider | Dostawca |
| Deadline | Termin |

### Português — Portuguese (`pt`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | tarefa |
| Capture | Capturar / Captura |
| Source | Origem |
| Goal | Objetivo |
| Review | Revisar / Revisão |
| Next step | Próximo passo |
| Reminder | Lembrete |
| Today | Hoje |
| Library | Biblioteca |
| Intelligence | Inteligência |
| Security | Segurança |
| Privacy | Privacidade |
| Evidence | Evidência |
| Confirmed | Confirmado |
| Needs review | Precisa de revisão |
| Private | Privado |
| Provider | Fornecedor |
| Deadline | Prazo |

### Русский — Russian (`ru`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | задача |
| Capture | Добавить / Добавленное |
| Source | Источник |
| Goal | Цель |
| Review | Проверить / Проверка |
| Next step | Следующий шаг |
| Reminder | Напоминание |
| Today | Сегодня |
| Library | Библиотека |
| Intelligence | Интеллект |
| Security | Безопасность |
| Privacy | Конфиденциальность |
| Evidence | Основание |
| Confirmed | Подтверждено |
| Needs review | Нужна проверка |
| Private | Скрытый |
| Provider | Провайдер |
| Deadline | Срок |

### ไทย — Thai (`th`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | งาน |
| Capture | บันทึกเข้า |
| Source | ต้นฉบับ |
| Goal | เป้าหมาย |
| Review | ตรวจสอบ |
| Next step | ขั้นตอนถัดไป |
| Reminder | การเตือน |
| Today | วันนี้ |
| Library | คลัง |
| Intelligence | อินเทลลิเจนซ์ |
| Security | ความปลอดภัย |
| Privacy | ความเป็นส่วนตัว |
| Evidence | หลักฐาน |
| Confirmed | ยืนยันแล้ว |
| Needs review | ต้องตรวจสอบ |
| Private | ส่วนตัว |
| Provider | ผู้ให้บริการ |
| Deadline | กำหนดส่ง |

### Türkçe — Turkish (`tr`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | görev |
| Capture | Yakala / Yakalama |
| Source | Kaynak |
| Goal | Hedef |
| Review | İncele / İnceleme |
| Next step | Sonraki adım |
| Reminder | Hatırlatıcı |
| Today | Bugün |
| Library | Kitaplık |
| Intelligence | Zekâ |
| Security | Güvenlik |
| Privacy | Gizlilik |
| Evidence | Kanıt |
| Confirmed | Doğrulandı |
| Needs review | İnceleme gerekiyor |
| Private | Özel |
| Provider | Sağlayıcı |
| Deadline | Son tarih |

### اردو — Urdu (`ur`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | کام |
| Capture | کیپچر |
| Source | ماخذ |
| Goal | مقصد |
| Review | جائزہ |
| Next step | اگلا قدم |
| Reminder | یاد دہانی |
| Today | آج |
| Library | لائبریری |
| Intelligence | انٹیلیجنس |
| Security | سیکیورٹی |
| Privacy | پرائیویسی |
| Evidence | ثبوت |
| Confirmed | تصدیق شدہ |
| Needs review | جائزہ درکار |
| Private | نجی |
| Provider | فراہم کنندہ |
| Deadline | آخری تاریخ |

### Tiếng Việt — Vietnamese (`vi`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | việc |
| Capture | Thu nhận |
| Source | Nguồn |
| Goal | Mục tiêu |
| Review | Xem lại |
| Next step | Bước tiếp theo |
| Reminder | Nhắc nhở |
| Today | Hôm nay |
| Library | Thư viện |
| Intelligence | Trí tuệ |
| Security | Bảo mật |
| Privacy | Quyền riêng tư |
| Evidence | Bằng chứng |
| Confirmed | Đã xác nhận |
| Needs review | Cần xem lại |
| Private | Riêng tư |
| Provider | Nhà cung cấp |
| Deadline | Hạn chót |

### 简体中文 — Simplified Chinese (`zh_Hans`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | 待办 |
| Capture | 采集 |
| Source | 原件 |
| Goal | 目标 |
| Review | 核对 |
| Next step | 下一步 |
| Reminder | 提醒 |
| Today | 今天 |
| Library | 资料库 |
| Intelligence | 智能 |
| Security | 安全 |
| Privacy | 隐私 |
| Evidence | 依据 |
| Confirmed | 已确认 |
| Needs review | 需核对 |
| Private | 隐藏内容 |
| Provider | 服务商 |
| Deadline | 截止日期 |

### 繁體中文 — Traditional Chinese (`zh_Hant`)

| Term | Translation |
|---|---|
| Action (brand) | Action |
| action (noun) | 待辦 |
| Capture | 擷取 |
| Source | 原件 |
| Goal | 目標 |
| Review | 核對 |
| Next step | 下一步 |
| Reminder | 提醒 |
| Today | 今天 |
| Library | 資料庫 |
| Intelligence | 智慧 |
| Security | 安全 |
| Privacy | 隱私 |
| Evidence | 依據 |
| Confirmed | 已確認 |
| Needs review | 需核對 |
| Private | 隱藏內容 |
| Provider | 服務商 |
| Deadline | 截止日期 |

---

## Terms that are traps

**"Secure" / "safe".** Neither is available as a general-purpose reassuring
adjective. `Security` names a settings section. Nothing in Action is described
as *safe*, and the link inspector in particular may never call a link safe in
any language. Where English says "no obvious caution signals were found", the
translation says the same negative thing — not "looks fine".

**"Verify" vs "check".** English uses *verify* only where the app has actually
compared a claim against the source text. Everywhere else it says *check* or
*inspect*. Languages that have only one word for both should pick the weaker
one.

**"Delete" vs "remove".** *Delete* destroys. *Remove* takes something out of a
list. The privacy screen depends on the difference.

**"Redact".** Means the data is gone from a derived copy. Not "hide", not
"cover", not "black out". If a language has no word that means removal rather
than concealment, use a short phrase that does.

**"On-device" / "local".** Means: does not leave this phone. Not "offline",
which describes a network state rather than a data-flow guarantee.
