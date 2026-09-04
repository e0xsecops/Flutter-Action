// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppL10nTh extends AppL10n {
  AppL10nTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'ยกเลิก';

  @override
  String get commonDone => 'เสร็จ';

  @override
  String get commonSave => 'บันทึก';

  @override
  String get commonClose => 'ปิด';

  @override
  String get commonBack => 'ย้อนกลับ';

  @override
  String get commonRetry => 'ลองอีกครั้ง';

  @override
  String get commonDelete => 'ลบ';

  @override
  String get commonRemove => 'นำออก';

  @override
  String get commonContinue => 'ต่อไป';

  @override
  String get commonOpen => 'เปิด';

  @override
  String get commonCopy => 'คัดลอก';

  @override
  String get commonCopied => 'คัดลอกแล้ว';

  @override
  String get commonEdit => 'แก้ไข';

  @override
  String get commonAdd => 'เพิ่ม';

  @override
  String get commonOn => 'เปิด';

  @override
  String get commonOff => 'ปิด';

  @override
  String get commonUnknown => 'ไม่ทราบ';

  @override
  String get commonChecking => 'กำลังตรวจสอบ…';

  @override
  String get commonSettings => 'การตั้งค่า';

  @override
  String get commonDismiss => 'ปัดออก';

  @override
  String get commonUndo => 'เลิกทำ';

  @override
  String get commonSkip => 'ข้าม';

  @override
  String get commonNotNow => 'ไว้ก่อน';

  @override
  String get commonSomethingWentWrong => 'มีบางอย่างผิดพลาด';

  @override
  String get navToday => 'วันนี้';

  @override
  String get navLibrary => 'คลัง';

  @override
  String get navIntelligence => 'อินเทลลิเจนซ์';

  @override
  String get navSearch => 'ค้นหา';

  @override
  String get navCapture => 'บันทึกบางอย่างเข้ามา';

  @override
  String get todayGreetingMorning => 'อรุณสวัสดิ์';

  @override
  String get todayGreetingAfternoon => 'สวัสดีตอนบ่าย';

  @override
  String get todayGreetingEvening => 'สวัสดีตอนเย็น';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'โหลดงานของคุณไม่สำเร็จ ข้อมูลยังอยู่ในเครื่องนี้';

  @override
  String get todaySectionNeedsAttention => 'ต้องการความสนใจ';

  @override
  String get todaySectionAlsoNeedsAttention => 'สิ่งนี้ก็ต้องการความสนใจ';

  @override
  String get todaySectionWaitingForReview => 'รอการตรวจสอบ';

  @override
  String get todaySectionComingUp => 'กำลังจะถึง';

  @override
  String todaySeeAllCaptures(int count) {
    return 'ดูทั้งหมด $count รายการที่บันทึกไว้';
  }

  @override
  String get todaySeeAllInLibrary => 'ดูทั้งหมดในคลัง';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เสร็จแล้ว $count',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ทำงานเสร็จแล้ว $count รายการ เปิดคลัง',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'เริ่มจาก';

  @override
  String get todayQuickPhoto => 'รูปถ่าย';

  @override
  String get todayQuickScreenshot => 'ภาพหน้าจอ';

  @override
  String get todayQuickText => 'ข้อความ';

  @override
  String get todayQuickTools => 'ตรวจสอบลิงก์ หรือค้นหาคีย์ในข้อความ';

  @override
  String get briefBadgeNeedsYou => 'ต้องการคุณ';

  @override
  String get briefBadgeToReview => 'รอตรวจสอบ';

  @override
  String get briefBadgeAhead => 'ข้างหน้า';

  @override
  String get briefBadgeStartHere => 'เริ่มที่นี่';

  @override
  String get briefBadgeClear => 'ว่าง';

  @override
  String get briefNext => 'ถัดไป';

  @override
  String briefOpenAction(String title) {
    return 'เปิด $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'ทำเครื่องหมาย \"$title\" ว่าเสร็จแล้ว';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'มี $count งานที่ต้องการความสนใจจากคุณ',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'มีอีก $count รายการที่บันทึกไว้รอการตรวจสอบ',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'มี $count รายการที่บันทึกไว้รอคุณอยู่',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'ไม่มีอะไรเลยกำหนด';

  @override
  String get briefHeadlineNothingToday => 'วันนี้ไม่มีอะไรต้องการคุณ';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'มี $count งานกำลังจะถึง',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'คุณเคลียร์หมดแล้ว';

  @override
  String get briefDetailClear => 'ไม่มีอะไรถึงกำหนด และไม่มีอะไรรออยู่';

  @override
  String get briefHeadlineFirstRun => 'เริ่มจากอะไรก็ได้';

  @override
  String get briefDetailFirstRun =>
      'จดหมาย ภาพหน้าจอ หรือโน้ต — Action จะดูออกเองว่ามันคืออะไร';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get settingsSectionPersonalise => 'ปรับให้เป็นของคุณ';

  @override
  String get settingsAppearance => 'ลักษณะหน้าจอ';

  @override
  String get settingsAppearanceDescription =>
      'สว่าง มืด หรือตามที่เครื่องตั้งไว้';

  @override
  String get settingsLanguageDescription => 'ภาษาที่ Action ใช้พูดกับคุณ';

  @override
  String get appearanceSystem => 'ตามระบบ';

  @override
  String get appearanceLight => 'สว่าง';

  @override
  String get appearanceDark => 'มืด';

  @override
  String get appearanceSystemDescription => 'ตามการตั้งค่าของเครื่อง';

  @override
  String get appearanceLightDescription => 'สว่างเสมอ';

  @override
  String get appearanceDarkDescription => 'มืดเสมอ';

  @override
  String get languageTitle => 'ภาษา';

  @override
  String get languageSubtitle =>
      'การเปลี่ยนแปลงมีผลทันที ไม่มีการส่งข้อมูลไปที่ใด ตัวเลือกถูกเก็บไว้ในเครื่องนี้';

  @override
  String get languageSectionChoose => 'เลือกภาษา';

  @override
  String get languageSystem => 'ตามระบบ';

  @override
  String get languageSystemDescription => 'ตามภาษาของเครื่อง';

  @override
  String get languageDraftNote =>
      'ข้อความของ Action เขียนขึ้นเป็นภาษาอังกฤษ ส่วนคำแปลภาษาอื่นจัดทำขึ้นตามอภิธานศัพท์ที่กำหนดไว้และตรวจสอบด้วยระบบอัตโนมัติ แต่ยังไม่มีเจ้าของภาษาอ่านทบทวน ในจุดที่ถ้อยคำต้องแม่นยำ — ความเป็นส่วนตัว ความปลอดภัย และสิ่งที่ Action อ้างหรือไม่อ้าง — ภาษาอังกฤษยังคงเป็นฉบับอ้างอิง';

  @override
  String get ocrScriptTitle => 'การอ่านตัวอักษร';

  @override
  String get ocrScriptSubtitle =>
      'ระบบการเขียนที่ Action อ่านเมื่อมองภาพถ่าย การอ่านเกิดขึ้นบนเครื่องนี้ ไม่มีรายการที่บันทึกไว้ถูกส่งไปที่ใดเพื่ออ่าน';

  @override
  String get ocrScriptSectionChoose => 'ระบบการเขียน';

  @override
  String get ocrScriptFollowLanguage => 'ตามภาษาของแอป';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'ตอนนี้คือ $script';
  }

  @override
  String get ocrScriptLatin => 'ละติน';

  @override
  String get ocrScriptChinese => 'จีน';

  @override
  String get ocrScriptDevanagari => 'เทวนาครี';

  @override
  String get ocrScriptJapanese => 'ญี่ปุ่น';

  @override
  String get ocrScriptKorean => 'เกาหลี';

  @override
  String get ocrScriptLatinDescription =>
      'อังกฤษ สเปน ฝรั่งเศส เยอรมัน และภาษาอื่นที่เขียนด้วยตัวอักษรละติน';

  @override
  String get ocrScriptChineseDescription => 'จีนตัวย่อและตัวเต็ม';

  @override
  String get ocrScriptDevanagariDescription =>
      'ฮินดี มราฐี และเนปาล ไม่ใช่เบงกอล ทมิฬ หรือเตลูกู — แต่ละภาษาเหล่านั้นใช้ระบบการเขียนคนละแบบ';

  @override
  String get ocrScriptJapaneseDescription => 'ญี่ปุ่น';

  @override
  String get ocrScriptKoreanDescription => 'เกาหลี';

  @override
  String get ocrScriptFootnote =>
      'ทุกตัวเลือกนอกจากละตินอ่านตัวอักษรละตินได้ด้วย การเลือกจึงเป็นการเพิ่มระบบการเขียน ไม่ใช่การสลับ การเปลี่ยนนี้มีผลกับภาพที่ถ่ายตั้งแต่นี้ไป ไม่ใช่ภาพที่อ่านไปแล้ว';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action อ่านอักษร$languageไม่ได้';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'บนเครื่องไม่มีตัวอ่านสำหรับอักษรนี้ ภาพจะยังถูกอ่านในส่วนที่เขียนด้วยตัวอักษรละติน ส่วนที่เหลือจะกลับมาว่าง คุณพิมพ์หรือวางข้อความนั้นแทนได้';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action ตั้งไว้ให้อ่าน $script หากภาพนี้เป็นระบบการเขียนอื่น ให้เปลี่ยนในการตั้งค่าแล้วอ่านใหม่';
  }

  @override
  String get settingsTextRecognition => 'การอ่านตัวอักษร';

  @override
  String get settingsTextRecognitionDescription =>
      'ระบบการเขียนที่ Action อ่านจากภาพถ่าย';

  @override
  String get settingsIntelligenceFootnote =>
      'Action ใช้งานได้โดยไม่ต้องมี AI การเชื่อมต่อผู้ให้บริการของคุณเองจะเพิ่มเครื่องมือวิเคราะห์เอกสาร วางแผน และร่างข้อความ';

  @override
  String get settingsAiProvider => 'ผู้ให้บริการ AI';

  @override
  String get settingsAiNotConnected =>
      'ยังไม่เชื่อมต่อ ใช้บัญชีและคีย์ API ของคุณเอง';

  @override
  String settingsAiConnected(String provider) {
    return 'เชื่อมต่อกับ $provider แล้ว';
  }

  @override
  String get settingsSectionPrivacySecurity => 'ความเป็นส่วนตัวและความปลอดภัย';

  @override
  String get settingsSecurity => 'ความปลอดภัย';

  @override
  String get settingsWhereInfoLives => 'ข้อมูลของคุณอยู่ที่ไหน';

  @override
  String get settingsWhereInfoLivesDescription =>
      'อะไรอยู่ในเครื่องนี้ และอะไรไม่ได้อยู่';

  @override
  String get protectionAppLock => 'ล็อกแอป';

  @override
  String get protectionScreenPrivacy => 'ความเป็นส่วนตัวของหน้าจอ';

  @override
  String get protectionPrivateReminders => 'การเตือนแบบไม่แสดงเนื้อหา';

  @override
  String get protectionSummaryNone =>
      'ล็อกแอป ความเป็นส่วนตัวของหน้าจอ และอะไรบ้างที่ออกจากเครื่องนี้';

  @override
  String protectionSummaryOne(String first) {
    return '$first เปิดอยู่';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first และ $second เปิดอยู่';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first $second และ $third เปิดอยู่';
  }

  @override
  String get settingsSectionReminders => 'การเตือน';

  @override
  String get settingsRemindersFootnote =>
      'Android อาจแสดงการเตือนช้ากว่าเวลาที่คุณตั้งไว้เล็กน้อย ขึ้นอยู่กับการตั้งค่าแบตเตอรี่และการใช้งานเครื่อง';

  @override
  String get settingsNotifications => 'การแจ้งเตือน';

  @override
  String get settingsNotificationsOnDescription =>
      'การเตือนที่คุณตั้งไว้สามารถแสดงได้';

  @override
  String get settingsNotificationsOffDescription =>
      'ปิดอยู่สำหรับ Action การเตือนจึงจะไม่ปรากฏ';

  @override
  String get settingsNotificationsUnknown => 'ตรวจสอบไม่ได้';

  @override
  String get settingsNotificationsAllowed => 'อนุญาตแล้ว';

  @override
  String get settingsOpenSystemSettings => 'เปิดการตั้งค่า';

  @override
  String get settingsActionFootnote =>
      'Action เปลี่ยนข้อมูลที่กระจัดกระจายให้เป็นขั้นตอนถัดไปที่ชัดเจน คุณเป็นผู้ยืนยันทุกอย่างก่อนที่จะถูกบันทึก';

  @override
  String get settingsHelp => 'ความช่วยเหลือ';

  @override
  String get settingsHelpDescription =>
      'Action ทำงานอย่างไร และจะไม่ทำอะไรบ้าง';

  @override
  String get settingsVersion => 'เวอร์ชัน';

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'เมื่อสักครู่';

  @override
  String relativeMinutes(int count) {
    return '$count นาทีที่แล้ว';
  }

  @override
  String relativeHours(int count) {
    return '$count ชั่วโมงที่แล้ว';
  }

  @override
  String get relativeYesterday => 'เมื่อวาน';

  @override
  String relativeDays(int count) {
    return '$count วันที่แล้ว';
  }

  @override
  String get libraryTitle => 'คลัง';

  @override
  String get librarySubtitle =>
      'ทุกอย่างที่ Action เก็บไว้ให้คุณ และทั้งหมดนั้นอยู่ในเครื่องนี้';

  @override
  String get librarySegmentActions => 'งาน';

  @override
  String get librarySegmentCaptures => 'ที่บันทึกไว้';

  @override
  String get librarySegmentGoals => 'เป้าหมาย';

  @override
  String get librarySegmentDone => 'เสร็จแล้ว';

  @override
  String get libraryNewGoal => 'เป้าหมายใหม่';

  @override
  String get libraryNoGoalsTitle => 'ยังไม่มีเป้าหมาย';

  @override
  String get libraryNoGoalsMessage =>
      'เป้าหมายคือสิ่งที่คุณอยากให้เกิดขึ้น Action หาได้ว่าอะไรยังขาด อะไรติดขัด และควรเริ่มจากอะไร';

  @override
  String get libraryNoDoneTitle => 'ยังไม่มีอะไรเสร็จ';

  @override
  String get libraryNoDoneMessage => 'งานที่คุณทำเสร็จจะถูกเก็บไว้ที่นี่';

  @override
  String get libraryNoOpenTitle => 'ไม่มีงานค้างอยู่';

  @override
  String get libraryNoOpenMessage =>
      'บันทึกอะไรสักอย่างเข้ามา แล้ว Action จะดูออกว่าต้องทำอะไร';

  @override
  String get libraryNoCapturesTitle => 'ยังไม่ได้บันทึกอะไรเข้ามา';

  @override
  String get libraryNoCapturesMessage =>
      'รูปถ่าย ภาพหน้าจอ และข้อความที่คุณเพิ่มเข้ามาจะมาถึงที่นี่ก่อน จะไม่มีการวิเคราะห์ใด ๆ จนกว่าคุณจะสั่ง';

  @override
  String get libraryGoalNoActions => 'ยังไม่มีอะไรเกิดขึ้นจากมัน';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count งานจากเป้าหมายนี้',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'ค้นหางานและสิ่งที่บันทึกไว้';

  @override
  String get searchClear => 'ล้าง';

  @override
  String get searchPrivacyNote =>
      'ค้นหาภายในเครื่องนี้ สิ่งที่คุณพิมพ์ที่นี่ไม่ออกไปไหน';

  @override
  String get searchYouCanSearch => 'ค้นหาได้จาก';

  @override
  String get searchFieldTitles => 'ชื่อเรื่อง';

  @override
  String get searchFieldTitlesExample => 'ต่อประกันรถ';

  @override
  String get searchFieldReferences => 'เลขอ้างอิง';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'หน่วยงาน';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'ขั้นตอนภายในงาน';

  @override
  String get searchFieldStepsExample => 'อัปโหลดแบบฟอร์ม';

  @override
  String get searchFieldCaptureText => 'ข้อความที่อ่านได้จากสิ่งที่บันทึกไว้';

  @override
  String get searchFieldCaptureTextExample => 'หนังสือแจ้งต่ออายุ';

  @override
  String searchNoMatchesTitle(String query) {
    return 'ไม่พบสิ่งที่ตรงกับ \"$query\"';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'ลองใช้คำน้อยลง หรือใส่เลขอ้างอิงให้ตรงตามที่ปรากฏ';

  @override
  String get searchNoMatchesClearFilters => 'ลองใช้คำน้อยลง หรือล้างตัวกรอง';

  @override
  String get searchFilterActive => 'กำลังทำ';

  @override
  String get searchFilterCompleted => 'เสร็จแล้ว';

  @override
  String get searchFilterOverdue => 'เลยกำหนด';

  @override
  String get searchFilterThisWeek => 'สัปดาห์นี้';

  @override
  String get searchFilterCritical => 'สำคัญมาก';

  @override
  String get searchFilterCreatedByYou => 'คุณสร้างเอง';

  @override
  String get searchFilterArchived => 'เก็บเข้าคลัง';

  @override
  String get searchFilterClear => 'ล้างตัวกรอง';

  @override
  String get searchIncompleteActions =>
      'ค้นหางานของคุณไม่ได้ ผลลัพธ์นี้จึงอาจไม่ครบ';

  @override
  String get searchIncompleteCaptures =>
      'ค้นหาสิ่งที่คุณบันทึกไว้ไม่ได้ ผลลัพธ์นี้จึงอาจไม่ครบ';

  @override
  String get searchIncompleteBoth =>
      'ค้นหาทั้งงานและสิ่งที่คุณบันทึกไว้ไม่ได้ ผลลัพธ์นี้จึงอาจไม่ครบ';

  @override
  String get searchMatchTitle => 'ชื่อเรื่อง';

  @override
  String get searchMatchNextStep => 'ขั้นตอนถัดไป';

  @override
  String get searchMatchStep => 'ขั้นตอน';

  @override
  String get searchMatchSummary => 'สรุป';

  @override
  String get searchMatchFromCapture => 'จากสิ่งที่บันทึกไว้';

  @override
  String get studioSuggested => 'แนะนำสำหรับสิ่งที่คุณบันทึกล่าสุด';

  @override
  String get studioRecentlyUsed => 'ใช้ล่าสุด';

  @override
  String get studioReady => 'พร้อม';

  @override
  String get studioNotConnected => 'ยังไม่เชื่อมต่อ';

  @override
  String get studioHeroTitle => 'Action อินเทลลิเจนซ์';

  @override
  String get studioConnectedBlurb =>
      'ทำความเข้าใจเอกสาร ปรับเป้าหมายให้คมขึ้น วางแผน ร่างคำตอบ หรือตรวจสิ่งที่อยู่ตรงหน้า';

  @override
  String studioDisconnectedBlurb(int count) {
    return 'เครื่องมือ $count อย่างสำหรับทำความเข้าใจเอกสาร วางแผน และเขียน เชื่อมต่อบัญชี AI ของคุณเองเพื่อใช้งาน — ผู้เรียกเก็บเงินคือผู้ให้บริการของคุณ ไม่ใช่ Action';
  }

  @override
  String get studioConnectAi => 'เชื่อมต่อ AI';

  @override
  String get studioHowItWorks => 'ทำงานอย่างไร';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count อย่างในนั้นใช้ได้แล้วโดยไม่ต้องมีสิ่งเหล่านั้น ทำงานอยู่ในเครื่องนี้ทั้งหมด',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'ทำงานในเครื่องนี้';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title $description ทำงานในเครื่องนี้';
  }

  @override
  String get categoryUnderstand => 'ทำความเข้าใจ';

  @override
  String get categoryUnderstandBlurb => 'เข้าใจสิ่งที่คุณมีอยู่';

  @override
  String get categoryPlan => 'วางแผน';

  @override
  String get categoryPlanBlurb => 'เปลี่ยนให้เป็นสิ่งที่ลงมือทำได้';

  @override
  String get categoryCreate => 'เขียน';

  @override
  String get categoryCreateBlurb => 'เขียน ปรับ แปล';

  @override
  String get categoryExtract => 'ดึงข้อมูล';

  @override
  String get categoryExtractBlurb => 'ดึงรายละเอียดที่สำคัญออกมา';

  @override
  String get categoryVerify => 'ตรวจสอบ';

  @override
  String get categoryVerifyBlurb => 'ตรวจสิ่งที่อยู่ตรงหน้า';

  @override
  String get captureSheetTitle => 'บันทึกบางอย่างเข้ามา';

  @override
  String get captureSheetSubtitle =>
      'อะไรที่คุณไม่อยากอ่านจนจบ ส่งให้ Action ได้เลย';

  @override
  String get captureTakePhoto => 'ถ่ายรูป';

  @override
  String get captureTakePhotoSubtitle =>
      'จดหมาย ใบแจ้งหนี้ หรือหนังสือแจ้งที่อยู่ตรงหน้า';

  @override
  String get captureChooseImage => 'เลือกรูปภาพ';

  @override
  String get captureChooseImageSubtitle =>
      'ภาพหน้าจอหรือรูปที่มีอยู่แล้วในเครื่องนี้';

  @override
  String get capturePasteText => 'วางข้อความ';

  @override
  String get capturePasteTextSubtitle => 'อีเมล ข้อความ หรือหนังสือแจ้ง';

  @override
  String get captureChoosePdf => 'เลือกไฟล์ PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'ใบแจ้งยอด จดหมาย หรือแบบฟอร์มที่คุณมีอยู่แล้ว';

  @override
  String get captureFootnote =>
      'สิ่งที่บันทึกไว้อยู่ในเครื่องนี้ จะไม่มีการวิเคราะห์ออนไลน์จนกว่าคุณจะสั่ง';

  @override
  String get captureCouldNotOpen => 'เปิดสิ่งนั้นไม่ได้ ลองวิธีอื่นดู';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title $subtitle';
  }

  @override
  String get stageReading => 'กำลังอ่าน';

  @override
  String get stageNeedsReview => 'ต้องตรวจสอบ';

  @override
  String get stageActionCreated => 'สร้างงานแล้ว';

  @override
  String get stageNoText => 'ไม่พบข้อความ';

  @override
  String get stageCouldNotBeRead => 'อ่านไม่ได้';

  @override
  String get stageReadingPreview => 'กำลังอ่านข้อความ…';

  @override
  String get stageFailedPreview => 'อ่านสิ่งนี้ในเครื่องนี้ไม่ได้';

  @override
  String get provenancePhoto => 'บันทึกจากรูปถ่าย';

  @override
  String get provenanceImage => 'บันทึกจากรูปภาพ';

  @override
  String get provenancePastedText => 'บันทึกจากข้อความที่วาง';

  @override
  String get provenanceDocument => 'เพิ่มเป็นเอกสาร';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'เสร็จ $when';
  }

  @override
  String metaOverdue(String date) {
    return 'เลยกำหนด · กำหนดคือ $date';
  }

  @override
  String get metaDueToday => 'กำหนดวันนี้';

  @override
  String metaDueOn(String date) {
    return 'กำหนด $date';
  }

  @override
  String get metaCreatedByYou => 'คุณสร้างเอง';

  @override
  String get categoryPayment => 'การชำระเงิน';

  @override
  String get categoryRenewal => 'การต่ออายุ';

  @override
  String get categoryAppointment => 'นัดหมาย';

  @override
  String get categoryBooking => 'การจอง';

  @override
  String get categoryTravel => 'การเดินทาง';

  @override
  String get categoryDeadline => 'กำหนดส่ง';

  @override
  String get categoryResponse => 'ต้องตอบกลับ';

  @override
  String get categoryDelivery => 'การจัดส่ง';

  @override
  String get categoryDocument => 'เอกสาร';

  @override
  String get categoryNoActionRequired => 'ไม่ต้องทำอะไร';

  @override
  String get categoryUnsure => 'ยังไม่แน่ชัด';

  @override
  String get errorEnterManually => 'กรอกเอง';

  @override
  String get sourceWhatWeRead => 'สิ่งที่เราอ่านได้';

  @override
  String get sourceDelete => 'ลบรายการที่บันทึกไว้';

  @override
  String get sourceGone => 'รายการที่บันทึกไว้นั้นไม่มีอยู่แล้ว';

  @override
  String get sourceDeleteTitle => 'ลบรายการที่บันทึกไว้นี้ไหม';

  @override
  String get sourceDeleteBody =>
      'ภาพและข้อความที่อ่านได้จากภาพจะถูกนำออกจากเครื่องนี้';

  @override
  String get sourceDeleteKeep => 'เก็บไว้';

  @override
  String get sourceOpenAction => 'เปิดงาน';

  @override
  String sourceOpenActions(int count) {
    return 'เปิด $count งาน';
  }

  @override
  String get sourceCreateAnother => 'สร้างอีกอย่างจากสิ่งนี้';

  @override
  String get sourceCreateAction => 'สร้างงานจากสิ่งนี้';

  @override
  String get sourceDoMore => 'ทำอย่างอื่นกับสิ่งนี้';

  @override
  String sourceMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String sourceDimensions(int width, int height) {
    return '$width×$height';
  }

  @override
  String sourceKilobytes(int size) {
    return '$size KB';
  }

  @override
  String sourceConvertedFrom(String format, String size) {
    return 'จาก $format $size KB';
  }

  @override
  String get sourceTextFound => 'พบข้อความ';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines บรรทัด · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'นี่คือข้อความที่ Action อ่านได้ สิ่งที่สร้างจากข้อความนี้อยู่ด้านล่าง';

  @override
  String get sourceNotInterpreted =>
      'ยังไม่มีการตีความอะไร Action จะเสนอว่าควรทำอะไรกับสิ่งนี้ และคุณเป็นผู้ยืนยันก่อนที่จะมีอะไรถูกสร้าง';

  @override
  String get sourceNoTextExplainer =>
      'เกิดขึ้นได้กับลายมือ แสงน้อยมาก หรืออักษรที่เครื่องนี้ยังอ่านไม่ได้';

  @override
  String get sourceReadFailed => 'อ่านสิ่งนี้ไม่ได้';

  @override
  String get sourceReadFailedReason => 'การอ่านตัวอักษรไม่เสร็จสมบูรณ์';

  @override
  String get sourceTryReadingAgain => 'ลองอ่านอีกครั้ง';

  @override
  String get sourceTypeInstead => 'พิมพ์รายละเอียดแทน';

  @override
  String get sourceTypeWhatItSays => 'พิมพ์ตามที่เขียนไว้';

  @override
  String get sourceTypeHint => 'วันที่ จำนวนเงิน และสิ่งที่กำลังถูกขอ';

  @override
  String get sourceMadeFromThis => 'สร้างจากรายการที่บันทึกไว้นี้';

  @override
  String sourceMadeFromThisCount(int count) {
    return 'สร้างจากรายการที่บันทึกไว้นี้ $count รายการ';
  }

  @override
  String get sourceTheDocument => 'เอกสาร';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count หน้า',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'ไม่ทราบจำนวนหน้า';

  @override
  String get sourceDocumentNotRead =>
      'Action ยังไม่ได้อ่านสิ่งที่อยู่ในเอกสารนี้ เมื่อคุณใช้เครื่องมือที่ต้องอ่าน ไฟล์จะถูกส่งไปยังผู้ให้บริการ AI ที่คุณเชื่อมต่อไว้ และคุณจะได้รับแจ้งก่อนที่จะเกิดขึ้น';

  @override
  String get previewSaveFailed => 'บันทึกไม่ได้ ลองอีกครั้ง';

  @override
  String get previewTitle => 'ตรวจดูสิ่งที่บันทึกไว้';

  @override
  String get previewImageFailed => 'เปิดภาพนั้นไม่ได้';

  @override
  String get previewHint =>
      'ดูให้แน่ใจว่าข้อความอ่านออกและไม่มีส่วนสำคัญถูกตัดขาด';

  @override
  String get previewRetake => 'ถ่ายใหม่';

  @override
  String get pasteTitle => 'วางข้อความ';

  @override
  String get pasteHint =>
      'วางอีเมล ข้อความ หรือหนังสือแจ้งที่คุณไม่อยากอ่านจนจบ';

  @override
  String get pasteFootnote => 'อะไรที่มีวันที่ จำนวนเงิน หรือคำขอ ใช้ได้ผลดี';

  @override
  String get pasteEnough => 'ดูเหมือนพอสำหรับทำงานแล้ว';

  @override
  String get pasteMore => 'ข้อความอีกสักหน่อยจะให้ผลดีกว่านี้';

  @override
  String get reviewLoadFailed => 'โหลดรายการที่บันทึกไว้นี้ไม่ได้';

  @override
  String get reviewConfirmed => 'ยืนยันแล้ว';

  @override
  String get reviewNeedsReview => 'ต้องตรวจสอบ';

  @override
  String get reviewReview => 'ตรวจสอบ';

  @override
  String get reviewHighConfidence => 'ความมั่นใจสูง';

  @override
  String get reviewConfirmedByYou => 'คุณยืนยันแล้ว';

  @override
  String get reviewMissing => 'ขาดไป';

  @override
  String get reviewNotUnderstood =>
      'Action เข้าใจแหล่งที่มานี้ได้ไม่มากพออย่างที่เชื่อถือได้';

  @override
  String get reviewNotUnderstoodBody =>
      'สิ่งที่บันทึกไว้ยังอยู่ครบและไม่มีอะไรหาย คุณกรอกรายละเอียดเองได้ และแหล่งที่มายังแนบอยู่ให้เทียบเคียง';

  @override
  String get reviewEnterDetails => 'กรอกรายละเอียด';

  @override
  String get reviewKeepSource => 'เก็บแหล่งที่มาไว้ดูภายหลัง';

  @override
  String reviewEngine(String engine) {
    return 'เอนจิน: $engine';
  }

  @override
  String get reviewManualNotice =>
      'คุณกำลังสร้างงานนี้ด้วยตัวเอง จะใช้เฉพาะสิ่งที่คุณกรอกที่นี่เท่านั้น';

  @override
  String get reviewUntitled => 'งานที่ยังไม่มีชื่อ';

  @override
  String get reviewEditTitle => 'แก้ชื่อ';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'มี $count ค่าที่ต้องให้คุณตรวจสอบก่อนจึงจะยืนยันได้',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'ข้อมูลสำคัญ';

  @override
  String get reviewNotFound => 'ไม่พบ';

  @override
  String get reviewSuggestedNextStep => 'ขั้นตอนถัดไปที่แนะนำ';

  @override
  String get reviewWhyThisMatters => 'ทำไมเรื่องนี้จึงสำคัญ';

  @override
  String get reviewSteps => 'ขั้นตอน';

  @override
  String get reviewAddStep => 'เพิ่มขั้นตอน';

  @override
  String get reviewInjectionNotice =>
      'ข้อความบางส่วนในแหล่งที่มานี้ดูเหมือนคำสั่งมากกว่าข้อมูลของเอกสาร Action จึงไม่นำมาใช้';

  @override
  String get reviewLayoutNotice =>
      'การจัดวางของเอกสารนี้อาจมีความเชื่อมโยงที่การดึงข้อความรักษาไว้ได้ไม่ครบ ให้เทียบค่าด้านล่างกับแหล่งที่มาก่อนยืนยัน';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason ให้เทียบค่าด้านล่างกับแหล่งที่มา';
  }

  @override
  String get reviewDeadline => 'กำหนดส่ง';

  @override
  String get reviewAmount => 'จำนวนเงิน';

  @override
  String get reviewLeftUnset => 'ไม่มี — คุณเลือกที่จะเว้นไว้';

  @override
  String get reviewUnclear => 'ไม่ชัดเจน';

  @override
  String get reviewNotSet => 'ยังไม่ได้กำหนด';

  @override
  String get reviewNoDeadlineFound => 'ไม่พบในเอกสารนี้';

  @override
  String get reviewNoAmountFound => 'ไม่พบจำนวนเงินในเอกสารนี้';

  @override
  String get reviewMultipleDates => 'Action พบวันที่ที่เป็นไปได้หลายวัน';

  @override
  String reviewMultipleDatesBody(int count) {
    return 'มี $count วันที่ที่อาจเป็นกำหนดส่ง เลือกวันที่ถูกต้อง กรอกวันอื่น หรือเว้นไว้';
  }

  @override
  String get reviewChooseDate => 'เลือกวันที่';

  @override
  String get reviewMultipleAmounts =>
      'Action พบจำนวนเงินที่เป็นไปได้มากกว่าหนึ่งจำนวน';

  @override
  String reviewMultipleAmountsBody(int count) {
    return 'มี $count จำนวนที่อาจเป็นจำนวนของงานนี้ เลือกหนึ่งจำนวน กรอกจำนวนอื่น หรือเว้นไว้';
  }

  @override
  String get reviewChooseAmount => 'เลือกจำนวนเงิน';

  @override
  String get reviewSkipStep => 'ข้ามขั้นตอนนี้';

  @override
  String get reviewKeepStep => 'เก็บขั้นตอนนี้ไว้';

  @override
  String get reviewEditStep => 'แก้ขั้นตอน';

  @override
  String get reviewCreateManually => 'สร้างเอง';

  @override
  String get reviewConfirmAndCreate => 'ยืนยันและสร้างงาน';

  @override
  String get reviewFixHighlighted => 'ตรวจช่องที่ทำเครื่องหมายไว้';

  @override
  String get reviewSaving => 'กำลังบันทึก…';

  @override
  String get reviewSaveFailed =>
      'บันทึกงานนี้ไม่ได้ ไม่มีอะไรหาย — ลองอีกครั้ง';

  @override
  String get reviewFieldTitle => 'ชื่อ';

  @override
  String get reviewTitleHint => 'ต้องให้เกิดอะไรขึ้น';

  @override
  String get reviewNewStep => 'ขั้นตอนใหม่';

  @override
  String get reviewStepHint => 'สิ่งที่ต้องทำ';

  @override
  String get reviewDatesConflict => 'เอกสารกล่าวถึงวันที่มากกว่าหนึ่งวัน';

  @override
  String get reviewAmountsConflict =>
      'เอกสารกล่าวถึงจำนวนเงินมากกว่าหนึ่งจำนวน';

  @override
  String get reviewAnotherDate => 'วันที่อื่น — 2026-08-30';

  @override
  String get reviewBadDate => 'ไม่ใช่วันที่จริง ใช้รูปแบบ 2026-08-30';

  @override
  String get reviewTypeDate => 'พิมพ์วันที่ หรือเว้นไว้ด้านล่าง';

  @override
  String get reviewUseThisDate => 'ใช้วันที่นี้';

  @override
  String get reviewLeaveNoDeadline => 'ไปต่อโดยไม่มีกำหนดส่ง';

  @override
  String get reviewAnotherAmount => 'จำนวนอื่น — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'ใช้จำนวนนี้ไม่ได้: $reason';
  }

  @override
  String get reviewUseThisAmount => 'ใช้จำนวนนี้';

  @override
  String get reviewLeaveNoAmount => 'ไปต่อโดยไม่มีจำนวนเงิน';

  @override
  String get reviewThisValue => 'ค่านี้';

  @override
  String reviewQuote(String quote) {
    return '“$quote”';
  }

  @override
  String get reviewSeeOnCapture => 'ดูบนภาพที่บันทึกไว้';

  @override
  String get reviewViewSource => 'ดูแหล่งที่มา';

  @override
  String get reviewFromSource => 'จากแหล่งที่มา';

  @override
  String get reviewNotVerified => 'ยังไม่ได้เทียบ';

  @override
  String get reviewCouldNotVerify => 'เทียบสิ่งนี้กับแหล่งที่มาไม่ได้';

  @override
  String get reviewLooksRight => 'ดูถูกต้อง';

  @override
  String get reviewStageReading => 'กำลังอ่านแหล่งที่มา';

  @override
  String get reviewStageUnderstanding => 'กำลังทำความเข้าใจรายละเอียดสำคัญ';

  @override
  String get reviewStageChecking => 'กำลังดูว่าสิ่งใดต้องตรวจสอบ';

  @override
  String get reviewNothingToDo => 'ตอนนี้ยังไม่มีอะไรที่คุณต้องทำ';

  @override
  String get reviewInformationOnly =>
      'นี่ดูเหมือนเป็นข้อมูลอย่างเดียว — ไม่พบกำหนดส่ง การชำระเงิน หรือคำขอให้ตอบกลับ';

  @override
  String get reviewInformationOnlyWithSource =>
      'นี่ดูเหมือนเป็นข้อมูลอย่างเดียว — ในรายการที่บันทึกไว้นี้ไม่พบกำหนดส่ง การชำระเงิน หรือคำขอให้ตอบกลับ';

  @override
  String get reviewSourceKept => 'แหล่งที่มาถูกเก็บไว้ไม่ว่าทางใด';

  @override
  String get reviewAddAnyway => 'เพิ่มงานอยู่ดี';

  @override
  String get reviewActionConfirmed => 'ยืนยันงานแล้ว';

  @override
  String get reviewCreatedByYou => 'คุณสร้างเอง';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'คุณยืนยันจากข้อมูลที่ตรวจสอบแล้ว $count รายการ',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'คุณยืนยันจากข้อมูลที่ตรวจสอบแล้ว $count รายการ คุณแก้ไป $edited รายการ',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'บันทึกไว้บนเครื่องนี้';

  @override
  String get detailLoadFailed =>
      'โหลดงานนี้ไม่ได้ งานยังถูกเก็บไว้บนเครื่องนี้';

  @override
  String get detailNotFoundTitle => 'งานนั้นไม่อยู่ที่นี่แล้ว';

  @override
  String get detailNotFoundMessage => 'อาจถูกลบไปแล้วบนเครื่องนี้';

  @override
  String get detailGoBack => 'ย้อนกลับ';

  @override
  String get detailMore => 'เพิ่มเติม';

  @override
  String get detailChangeUrgency => 'เปลี่ยนความเร่งด่วน';

  @override
  String get detailAddRecommendedStep => 'เพิ่มขั้นตอนที่แนะนำ';

  @override
  String get detailEditRecommendedStep => 'แก้ขั้นตอนที่แนะนำ';

  @override
  String get detailArchiveTitle => 'เก็บงานนี้เข้าคลังไหม';

  @override
  String get detailArchiveBody =>
      'งานจะออกจากรายการของคุณแต่ไม่ถูกลบ และสิ่งที่บันทึกไว้ซึ่งเป็นที่มาของงานก็ยังถูกเก็บไว้';

  @override
  String get detailArchiveConfirm => 'เก็บเข้าคลัง';

  @override
  String get detailArchived => 'เก็บเข้าคลังแล้ว';

  @override
  String detailCompletedOn(String date) {
    return 'เสร็จเมื่อ $date';
  }

  @override
  String get detailSectionDetails => 'รายละเอียด';

  @override
  String get detailSectionReminders => 'การเตือน';

  @override
  String get detailAllStepsDone => 'ครบทุกขั้นตอนแล้ว';

  @override
  String get detailNextEyebrow => 'ถัดไป';

  @override
  String get detailCompleteQuestion => 'ทำงานนี้ให้เสร็จไหม';

  @override
  String get detailMarkStepDone => 'ทำเครื่องหมายว่าขั้นตอนเสร็จ';

  @override
  String get detailCompleteAction => 'ทำงานนี้ให้เสร็จ';

  @override
  String get detailAddDeadline => 'เพิ่มกำหนดส่ง';

  @override
  String get detailAddAmount => 'เพิ่มจำนวนเงิน';

  @override
  String detailStepsProgress(int completed, int total) {
    return 'เสร็จ $completed จาก $total';
  }

  @override
  String get detailNoStepsTitle => 'ยังไม่มีขั้นตอน';

  @override
  String get detailNoStepsMessage =>
      'แบ่งสิ่งนี้ออกเป็นสิ่งที่คุณต้องลงมือทำจริง ๆ';

  @override
  String get detailAddFirstStep => 'เพิ่มขั้นตอนแรก';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'ขั้นตอนที่เสร็จแล้ว: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'ขั้นตอนถัดไป: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'ขั้นตอน: $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'ทำเครื่องหมายว่า “$title” เสร็จแล้ว';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'ทำเครื่องหมายว่า “$title” ยังไม่เสร็จ';
  }

  @override
  String get detailStepOptions => 'ตัวเลือกของขั้นตอน';

  @override
  String get detailMoveUp => 'เลื่อนขึ้น';

  @override
  String get detailMoveDown => 'เลื่อนลง';

  @override
  String get detailDeleteStep => 'ลบขั้นตอน';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'ลบขั้นตอนนี้ไหม';

  @override
  String get stepDeleteKeep => 'เก็บไว้';

  @override
  String get detailNoRemindersYet => 'ยังไม่มีการเตือน';

  @override
  String get detailReminderLimit =>
      'นี่คือจำนวนการเตือนมากที่สุดที่งานหนึ่งมีได้ นำออกหนึ่งรายการเพื่อเพิ่มรายการใหม่';

  @override
  String get detailAddReminder => 'เพิ่มการเตือน';

  @override
  String get detailChangeReminder => 'เปลี่ยนการเตือน';

  @override
  String get detailRemoveReminder => 'นำการเตือนออก';

  @override
  String get detailReminderFormat => 'EEE d MMM HH:mm';

  @override
  String get reminderStatePending => 'ยังไม่ได้ตั้ง';

  @override
  String get reminderStateNotificationsOff =>
      'บันทึกแล้ว แต่การแจ้งเตือนปิดอยู่';

  @override
  String get reminderStateFailed => 'ตั้งเวลาไม่ได้';

  @override
  String get reminderStateRemoving => 'กำลังนำออก…';

  @override
  String get reminderSetConfirmation => 'ตั้งการเตือนแล้ว เราจะสะกิดคุณ';

  @override
  String get reminderUpdatedConfirmation => 'อัปเดตการเตือนแล้ว';

  @override
  String get reminderNeedsPermission =>
      'การแจ้งเตือนปิดอยู่ การเตือนนี้จึงถูกบันทึกไว้แต่ยังเตือนคุณไม่ได้';

  @override
  String get reminderScheduleFailed =>
      'การเตือนนี้ถูกบันทึกไว้แล้ว แต่ Android ไม่ยอมตั้งเวลาให้';

  @override
  String get reminderLimitReached => 'งานนั้นมีการเตือนครบจำนวนสูงสุดแล้ว';

  @override
  String get reminderTimeInPast => 'เวลานั้นผ่านไปแล้ว';

  @override
  String get reminderAddTitle => 'เพิ่มการเตือน';

  @override
  String get reminderChangeTitle => 'เปลี่ยนการเตือนนี้';

  @override
  String get reminderDateLabel => 'วันที่';

  @override
  String get reminderTimeLabel => 'เวลา';

  @override
  String get reminderFieldDateFormat => 'EEE d MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'EEEE d MMMM';

  @override
  String get reminderPresetFormat => 'd MMM HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return 'จะเตือนคุณวันที่ $date เวลา $time';
  }

  @override
  String get reminderTimePastError =>
      'เวลานั้นผ่านไปแล้ว เลือกเวลาที่หลังกว่านี้';

  @override
  String get reminderSet => 'ตั้งการเตือน';

  @override
  String get reminderPresetInHour => 'อีก 1 ชั่วโมง';

  @override
  String get reminderPresetTomorrowMorning => 'พรุ่งนี้เช้า';

  @override
  String get reminderPresetNextWeek => 'สัปดาห์หน้า';

  @override
  String get reminderPresetOnTheDay => 'ในวันนั้น';

  @override
  String get reminderPresetDayBefore => 'ก่อน 1 วัน';

  @override
  String get reminderPresetWeekBefore => 'ก่อน 1 สัปดาห์';

  @override
  String get reminderPresetAtDeadline => 'ตอนถึงกำหนดส่ง';

  @override
  String get reminderPresetHourBefore => 'ก่อน 1 ชั่วโมง';

  @override
  String get editNextStepTitle => 'ขั้นตอนถัดไปที่แนะนำ';

  @override
  String get editNextStepSubtitle => 'ประโยคสั้น ๆ เกี่ยวกับสิ่งที่ควรทำต่อไป';

  @override
  String get editNextStepHint => 'สิ่งที่ควรทำต่อไปคืออะไร';

  @override
  String get editRemoveSuggestion => 'นำคำแนะนำออก';

  @override
  String get editUrgencyTitle => 'เรื่องนี้เร่งด่วนแค่ไหน';

  @override
  String get editStepHint => 'สิ่งที่ต้องทำอย่างเป็นรูปธรรมหนึ่งอย่าง';

  @override
  String get editAddStep => 'เพิ่มขั้นตอน';

  @override
  String get editDateHint => 'ปปปป-ดด-วว';

  @override
  String get editRemoveDeadline => 'นำกำหนดส่งออก';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => 'บันทึกจำนวนเงิน';

  @override
  String get editRemoveAmount => 'นำจำนวนเงินออก';

  @override
  String get evidenceTitle => 'สิ่งนี้มาจากไหน';

  @override
  String get evidenceUnverified =>
      'Action ไม่พบคำเหล่านี้ในข้อความที่อ่านได้ ค่านี้จึงยังไม่ได้เทียบ ให้เทียบกับต้นฉบับก่อนที่คุณจะใช้เป็นหลัก';

  @override
  String get evidenceHighlighted =>
      'คำเหล่านี้อยู่ในข้อความที่ Action อ่านได้จากภาพที่บันทึกไว้นี้ และแถบเน้นแสดงว่าอยู่ตรงไหน';

  @override
  String get evidenceNoRegion =>
      'คำเหล่านี้อยู่ในข้อความที่ Action อ่านได้จากภาพที่บันทึกไว้นี้ แต่ไม่สามารถระบุได้ว่าอยู่ตรงจุดใดของภาพ และจะไม่เดา';

  @override
  String get evidenceInText =>
      'คำเหล่านี้อยู่ในข้อความที่รายการที่บันทึกไว้นี้มีอยู่';

  @override
  String get sourceCapturedAtFormat => 'd MMM HH:mm';

  @override
  String get urgencyCritical => 'วิกฤต';

  @override
  String get urgencyImportant => 'สำคัญ';

  @override
  String get urgencyNormal => 'ปกติ';

  @override
  String get urgencyLow => 'ต่ำ';

  @override
  String get urgencyUnsure => 'ไม่แน่ใจ';
}
