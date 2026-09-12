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
  String get securityTitle => 'ความปลอดภัยและความเป็นส่วนตัว';

  @override
  String get securitySectionProtection => 'การป้องกัน';

  @override
  String get securityAppLockUnavailable =>
      'การล็อกแอปต้องมีการล็อกหน้าจอบนเครื่องนี้ ตั้งค่า PIN รูปแบบ รหัสผ่าน หรือลายนิ้วมือในการตั้งค่าเครื่องก่อน';

  @override
  String get securityAppLockOn =>
      'Action ขอให้เครื่องของคุณยืนยันว่าเป็นคุณจริง';

  @override
  String get securityAppLockOff =>
      'ต้องใช้ลายนิ้วมือ ใบหน้า หรือ PIN ของเครื่องเพื่อเปิด Action';

  @override
  String get securityAskAgain => 'ถามอีกครั้ง';

  @override
  String get securityAskAgainDescription =>
      'Action อยู่เบื้องหลังได้นานแค่ไหนก่อนจะล็อก';

  @override
  String get securityScreenPrivacy => 'ความเป็นส่วนตัวของหน้าจอ';

  @override
  String get securityScreenPrivacyDescription =>
      'ขอให้ Android บล็อกการจับภาพและการบันทึกหน้าจอ และซ่อน Action ในตัวสลับแอป';

  @override
  String get securityPrivateReminders => 'การเตือนแบบส่วนตัว';

  @override
  String get securityPrivateRemindersOn =>
      'การเตือนบอกเพียงว่ามีบางอย่างรอคุณอยู่';

  @override
  String get securityPrivateRemindersOff =>
      'การเตือนแสดงชื่องาน เปิดสิ่งนี้เพื่อไม่ให้ชื่อไปอยู่บนหน้าจอล็อก';

  @override
  String get securityLockNow => 'ล็อกเดี๋ยวนี้';

  @override
  String get securityLockNowDescription => 'ปิดประตูโดยไม่ต้องรอ';

  @override
  String get securitySectionStorage => 'ข้อมูลของคุณถูกเก็บอย่างไร';

  @override
  String get securityStorageDataLabel =>
      'งาน สิ่งที่บันทึกไว้ และการตั้งค่าของคุณ';

  @override
  String get securityStorageDataDetail =>
      'ทั้งหมดอยู่ในที่เก็บส่วนตัวของแอปนี้เอง ซึ่งแอปอื่นอ่านไม่ได้ และ Android เข้ารหัสไว้เป็นส่วนหนึ่งของการเข้ารหัสเครื่อง Action ไม่ได้เพิ่มชั้นที่สองของตัวเองทับลงไป';

  @override
  String get securityStorageKeyLabel => 'กุญแจผู้ให้บริการ AI ของคุณ';

  @override
  String get securityStorageKeyDetail =>
      'เก็บไว้ใน Android Keystore แทนที่จะอยู่รวมกับส่วนอื่น และไม่แสดงอีกเลยหลังจากคุณบันทึก';

  @override
  String get securityStorageGapLabel => 'สิ่งที่ยังไม่ครอบคลุม';

  @override
  String get securityStorageGapDetail =>
      'ไม่มีข้อใดป้องกันคนที่ใช้เครื่องของคุณขณะปลดล็อกอยู่ และระบบที่ถูกดัดแปลงหรือรูทอ่านได้มากกว่าระบบปกติ การล็อกแอปคือการตั้งค่าที่ช่วยเรื่องแรก';

  @override
  String get securitySectionInformation => 'ข้อมูลของคุณ';

  @override
  String get securityWhereInfoDescription =>
      'ทุกเส้นทางที่ข้อมูลของคุณไปได้ และสองเส้นทางที่ออกจากเครื่องนี้';

  @override
  String get securityAppLockRefused => 'ยังไม่ได้ยืนยัน จึงไม่มีอะไรเปลี่ยน';

  @override
  String get securityAppLockUnavailableToast =>
      'เครื่องนี้ยังไม่ได้ตั้งการล็อกหน้าจอ เพิ่ม PIN รูปแบบ รหัสผ่าน หรือลายนิ้วมือในการตั้งค่าเครื่อง แล้วลองอีกครั้ง';

  @override
  String get securityScreenPrivacyRefused =>
      'เครื่องนี้ไม่ยอมใช้ความเป็นส่วนตัวของหน้าจอ จึงปล่อยให้ปิดไว้แทนที่จะแสดงว่าเปิดอยู่';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'การเตือนที่ตั้งไว้ $count รายการพูดน้อยลงแล้ว',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'อัปเดตการเตือนที่ตั้งไว้ $count รายการ',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'ทันที';

  @override
  String get appLockDelayOneMinute => 'หลัง 1 นาที';

  @override
  String get appLockDelayFiveMinutes => 'หลัง 5 นาที';

  @override
  String get securityDelayImmediatelyDescription =>
      'ทุกครั้งที่ Action ออกจากหน้าจอ';

  @override
  String get securityDelayOneMinuteDescription =>
      'นานพอจะตอบข้อความหนึ่งข้อความ';

  @override
  String get securityDelayFiveMinutesDescription => 'นานพอจะรับสายหนึ่งสาย';

  @override
  String get securityHeroProtected => 'มีการป้องกันอยู่';

  @override
  String get securityHeroNothingOn => 'ยังไม่ได้เปิดอะไรเลย';

  @override
  String get securityHeroFootnote =>
      'ทุกอย่างที่นี่ทำงานบนเครื่องนี้ ไม่มีการตั้งค่าใดถูกส่งไปที่ไหน และไม่มีข้อใดถูกเปลี่ยนจากระยะไกลได้';

  @override
  String get securityHeadlineNone => 'มีการป้องกันสามอย่างให้เลือกใช้';

  @override
  String securityHeadlineOne(String first) {
    return '$first เปิดอยู่';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first และ $second เปิดอยู่';
  }

  @override
  String get securityHeadlineAll => 'การป้องกันทั้งสามอย่างเปิดอยู่';

  @override
  String get securityTransfersTitle => 'สิ่งที่ออกจากเครื่องนี้ไป';

  @override
  String get securityTransfersNoProvider =>
      'ยังไม่ได้เชื่อมต่อผู้ให้บริการ AI จึงไม่มีอะไรถูกส่งไปวิเคราะห์เลย';

  @override
  String get securityTransfersDescription =>
      'บันทึกที่นี่ในวินาทีที่มีบางอย่างถูกส่งออกไป ไม่ว่าจะมีคำตอบกลับมาหรือไม่ มีเพียงเครื่องมือ ผู้ให้บริการ และขนาด — ไม่เคยมีเนื้อหาข้างใน เก็บไว้ 90 วันบนเครื่องนี้และไม่ส่งไปที่ใด';

  @override
  String get securityClear => 'ล้าง';

  @override
  String get securityNothingSent => 'ยังไม่มีอะไรถูกส่ง';

  @override
  String get securityNothingSentDescription =>
      'เมื่อคุณใช้เครื่องมือที่เรียกผู้ให้บริการ AI ของคุณ มันจะแสดงอยู่ที่นี่';

  @override
  String get securityClearHistoryTitle => 'ล้างประวัตินี้ไหม';

  @override
  String get securityClearHistoryBody =>
      'บันทึกว่ามีอะไรถูกส่งไปบ้างจะถูกลบจากเครื่องนี้ แต่ไม่ได้เรียกคืนสิ่งที่ส่งออกไปแล้ว';

  @override
  String get securityUnnamedTool => 'เครื่องมือ Intelligence หนึ่งรายการ';

  @override
  String get securityYourProvider => 'ผู้ให้บริการ AI ของคุณ';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count หน้า',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ไฟล์',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'ข้อความสั้น ๆ';

  @override
  String securityTransferCharacters(int count) {
    return '$count พันอักขระ';
  }

  @override
  String securitySentTo(String provider) {
    return 'ส่งไปยัง $provider';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'ส่งไปยัง $provider · $size';
  }

  @override
  String relativeWeeks(int count) {
    return '$count สัปดาห์ก่อน';
  }

  @override
  String get helpTitle => 'ความช่วยเหลือ';

  @override
  String get helpAddQuestion => 'ฉันเพิ่มอะไรได้บ้าง';

  @override
  String get helpAddAnswer =>
      'ภาพหน้าจอ รูปถ่ายจดหมายหรือใบเรียกเก็บเงิน หรือข้อความที่คุณวาง อะไรที่มีวันที่ จำนวนเงิน หรือคำขอ จะได้ผลดีที่สุด';

  @override
  String get helpReviewQuestion => 'ทำไม Action ถึงให้ฉันตรวจสอบ';

  @override
  String get helpReviewAnswer =>
      'เพราะเครื่องที่อ่านเอกสารอาจอ่านผิด และกำหนดส่งที่ผิดอย่างเงียบ ๆ แย่กว่าการไม่มีกำหนดส่งเลย Action แสดงสิ่งที่พบและคำที่มันมาจาก และจะไม่บันทึกอะไรจนกว่าคุณจะยืนยัน';

  @override
  String get helpVaryQuestion => 'ทำไมผลลัพธ์เปลี่ยนไปเมื่อลองอีกครั้ง';

  @override
  String get helpVaryAnswer =>
      'บริการที่อ่านเอกสารของคุณไม่ได้ให้ผลตายตัว สิ่งที่บันทึกไว้อันเดียวกันจึงอาจกลับมาต่างออกไปเล็กน้อย นั่นก็เป็นอีกเหตุผลที่มีขั้นตอนตรวจสอบ — คุณคือส่วนที่ไม่เปลี่ยน';

  @override
  String get helpLateQuestion => 'ทำไมการเตือนของฉันมาช้า';

  @override
  String get helpLateAnswer =>
      'การเตือนถูกตั้งเวลาผ่าน Android และ Android เป็นผู้ตัดสินว่าจะส่งเมื่อใดกันแน่ การประหยัดแบตเตอรี่ Doze และการตั้งค่าพลังงานของผู้ผลิตล้วนทำให้ช้าได้ Action ไม่เคยสัญญาว่าจะเตือนตรงนาที';

  @override
  String get helpDataQuestion => 'ข้อมูลของฉันอยู่ที่ไหน';

  @override
  String get helpDataAnswer =>
      'เกือบทั้งหมดอยู่บนเครื่องนี้ ทั้งสิ่งที่บันทึกไว้ งาน ขั้นตอน การเตือน และการค้นหาของคุณ มีสองข้อยกเว้น — เนื้อหาที่คุณให้ Action อ่านจะถูกส่งไปยังบริการ AI ที่อ่านมัน และบันทึกสั้น ๆ ของงานที่ยืนยันแล้วอาจถูกเก็บบนคลาวด์ภายใต้รหัสนิรนาม หัวข้อความเป็นส่วนตัวและข้อมูลในการตั้งค่าระบุไว้ชัดเจนว่าบันทึกนั้นมีอะไรบ้าง';

  @override
  String get helpBackupQuestion => 'นี่เป็นข้อมูลสำรองหรือเปล่า';

  @override
  String get helpBackupAnswer =>
      'ไม่ใช่ บันทึกบนคลาวด์กู้คืนไปยังเครื่องใหม่ไม่ได้ และไม่มีบัญชีให้เข้าสู่ระบบ ถ้าคุณถอนการติดตั้ง Action หรือทำเครื่องนี้หาย ข้อมูลบนเครื่องก็หายไป';

  @override
  String get helpCorrectQuestion => 'ฉันแก้ไขงานอย่างไร';

  @override
  String get helpCorrectAnswer =>
      'เปิดงานนั้นแล้วแก้ช่องไหนก็ได้ — ชื่อ กำหนดส่ง จำนวนเงิน หรือขั้นตอนถัดไปที่แนะนำ คุณเพิ่ม จัดลำดับใหม่ ทำให้เสร็จ และลบขั้นตอนได้ทุกเมื่อ การแก้ไขงานไม่เคยถามอะไรกับบริการ AI';

  @override
  String get privacyTitle => 'ความเป็นส่วนตัวและข้อมูล';

  @override
  String get privacyIntro =>
      'Action เก็บทุกอย่างเท่าที่ทำได้ไว้บนเครื่องนี้ มีสองสิ่งที่เป็นข้อยกเว้น และทั้งสองอยู่ในรายการด้านล่าง';

  @override
  String get privacyGroupOnDevice => 'บนเครื่องนี้';

  @override
  String get privacyOnDeviceCaptures =>
      'สิ่งที่บันทึกไว้ — ภาพหน้าจอ รูปภาพ และข้อความที่คุณเพิ่ม รวมถึงข้อความที่อ่านได้จากสิ่งเหล่านั้น';

  @override
  String get privacyOnDeviceActions =>
      'งาน พร้อมขั้นตอน ข้อมูล และการเตือนของมัน';

  @override
  String get privacyOnDeviceSearch =>
      'การค้นหา การค้นหาของคุณทำงานที่นี่ ไม่เคยถูกส่งไปที่ใด และไม่ถูกเก็บไว้หลังจากคุณปิดหน้าจอ';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'ภาพถ่ายถูกเก็บโดยไม่มีตำแหน่ง พิกัด เวลา และรายละเอียดกล้องที่โทรศัพท์เขียนไว้ในภาพจะถูกลบก่อนบันทึก จึงไม่ถูกเก็บไว้ที่นี่และไม่ติดไปด้วยเมื่อคุณส่งภาพไปยังผู้ให้บริการ AI ของคุณ';

  @override
  String get privacyGroupSentToRead => 'ส่งไปเพื่อให้อ่าน';

  @override
  String get privacySentToReadWhat =>
      'เมื่อคุณขอให้ Action ตีความสิ่งที่บันทึกไว้ เนื้อหานั้นจะถูกส่งไปยังบริการ AI ที่อ่านมัน นี่ไม่ใช่ AI ที่ทำงานบนเครื่อง';

  @override
  String get privacySentToReadWhen =>
      'ส่งเฉพาะสิ่งที่บันทึกไว้ซึ่งคุณเลือก และเฉพาะเมื่อคุณขอเท่านั้น';

  @override
  String get privacyGroupYourProvider => 'ส่งไปยังผู้ให้บริการ AI ของคุณเอง';

  @override
  String get privacyProviderWhat =>
      'ถ้าคุณเชื่อมต่อผู้ให้บริการ AI ในการตั้งค่า เครื่องมือ Intelligence จะส่งเนื้อหาที่คุณเลือกไปยังผู้ให้บริการนั้น — OpenAI, Anthropic, Google หรือ endpoint ที่คุณเลือก — โดยใช้กุญแจ API ของคุณเอง';

  @override
  String get privacyProviderDirect =>
      'มันไปหาพวกเขาโดยตรง ไม่ผ่านเซิร์ฟเวอร์ใดที่เป็นของ Action';

  @override
  String get privacyProviderScope =>
      'ส่งเฉพาะสิ่งที่คุณเลือกให้เครื่องมือ และเฉพาะตอนที่คุณสั่งให้ทำงาน งาน สิ่งที่บันทึกไว้ และแหล่งที่มาอื่นของคุณไม่เคยถูกรวมไปด้วย และไม่เคยมีอะไรถูกส่งอยู่เบื้องหลัง';

  @override
  String get privacyProviderKey =>
      'กุญแจ API ของคุณถูกเก็บไว้ในที่เก็บนิรภัยของเครื่องนี้ และส่งไปยังผู้ให้บริการเจ้าของกุญแจเท่านั้น ที่เก็บนิรภัยเป็นอุปสรรคจริงสำหรับคนที่ได้เครื่องของคุณตอนปลดล็อกอยู่ แต่ไม่ใช่สิ่งสัมบูรณ์ และ Action จะไม่อ้างเป็นอย่างอื่น';

  @override
  String get privacyProviderLocalTools =>
      'มีสองเครื่องมือที่ไม่เคยส่งอะไรออกไปเลย คือการซ่อนรายละเอียดอ่อนไหว และการตรวจว่าไฟล์มาจากไหน ทั้งสองทำงานบนเครื่องนี้ทั้งหมด';

  @override
  String get privacyProviderAgreement =>
      'ผู้ให้บริการของคุณจะทำอะไรกับสิ่งที่คุณส่งไปนั้นเป็นไปตามข้อตกลงระหว่างคุณกับเขา ไม่ใช่ตาม Action';

  @override
  String get privacyGroupCloud => 'เก็บไว้บนคลาวด์';

  @override
  String get privacyCloudWhat =>
      'เมื่อคุณยืนยันงานหนึ่ง บันทึกสั้น ๆ ของงานนั้นอาจถูกเก็บไว้ภายใต้รหัสนิรนามของการติดตั้งนี้ ได้แก่ ชื่อ สถานะ ความเร่งด่วน หมวดหมู่ กำหนดส่ง จำนวนเงิน ขั้นตอนถัดไปที่แนะนำ และเวลาที่บันทึก';

  @override
  String get privacyCloudNotSent =>
      'สิ่งที่บันทึกไว้ของคุณ ข้อความที่อ่านได้จากมัน ขั้นตอนและข้อมูลของงาน รวมถึงการเตือนของคุณ จะไม่ถูกส่ง';

  @override
  String get privacyCloudNotBackup =>
      'นี่ไม่ใช่ข้อมูลสำรอง ไม่มีทางกู้คืนไปยังเครื่องใหม่ และการสูญเสียการติดตั้งนี้ก็พารหัสนิรนามหายไปด้วย';

  @override
  String get privacyGroupDiagnostics => 'การวินิจฉัย';

  @override
  String get privacyDiagnosticsWhat =>
      'Action บันทึกจำนวนนับแบบนิรนามว่ามีอะไรเกิดขึ้นในแอป — ว่ามีการเริ่มบันทึกสิ่งหนึ่ง ว่าการดึงข้อมูลสำเร็จหรือไม่ ว่าการค้นหาไม่พบอะไร ว่างานหนึ่งเสร็จแล้ว';

  @override
  String get privacyDiagnosticsCounts =>
      'สิ่งเหล่านี้คือจำนวนนับ ไม่ใช่เนื้อหา ไม่เคยมีชื่อ จำนวนเงิน กำหนดส่ง เลขอ้างอิง ข้อความที่บันทึกไว้ หรือคำค้นใดถูกรวมไปด้วย และรหัสนิรนามหรือรหัสใด ๆ ของงานหรือสิ่งที่บันทึกไว้ก็เช่นกัน';

  @override
  String get privacyDiagnosticsCrash =>
      'ถ้าแอปหยุดทำงาน ข้อผิดพลาดและตำแหน่งที่เกิดจะถูกรายงานเพื่อให้แก้ไขได้ Action ไม่แนบข้อมูลของคุณไปกับรายงานเหล่านั้น';

  @override
  String get privacySectionYourData => 'ข้อมูลของคุณ';

  @override
  String get privacyYourDataFootnote =>
      'การล้างสิ่งที่บันทึกไว้ไม่กระทบงานของคุณ งานที่สิ่งบันทึกหายไปแล้วก็ยังใช้ได้ เพียงแต่ไม่แสดงอีกต่อไปว่ามันมาจากอะไร';

  @override
  String get privacyClearCaptures => 'ล้างสิ่งที่บันทึกไว้';

  @override
  String get privacyClearCapturesDescription =>
      'ลบทุกสิ่งที่บันทึกไว้พร้อมไฟล์ภาพของมัน';

  @override
  String get privacyDeleteAll => 'ลบข้อมูลทั้งหมดของฉัน';

  @override
  String get privacyDeleteAllDescription =>
      'งาน ขั้นตอน การเตือน สิ่งที่บันทึกไว้ และบันทึกบนคลาวด์ข้างต้น';

  @override
  String get privacyClearCapturesTitle => 'ล้างสิ่งที่บันทึกไว้ไหม';

  @override
  String get privacyClearCapturesBody =>
      'ทุกสิ่งที่บันทึกไว้และภาพของมันจะถูกลบจากเครื่องนี้ งานของคุณยังคงอยู่เหมือนเดิมทุกประการ';

  @override
  String get privacyCapturesDeleted => 'ลบสิ่งที่บันทึกไว้แล้ว';

  @override
  String get privacyCapturesPartlyDeleted =>
      'บางรายการที่บันทึกไว้ลบไม่ได้ ไม่มีอย่างอื่นถูกเปลี่ยน';

  @override
  String get privacyDeleteAllTitle => 'ลบข้อมูลทั้งหมดของคุณไหม';

  @override
  String get privacyDeleteAllBody =>
      'การทำเช่นนี้ลบทุกงาน ขั้นตอน การเตือน และสิ่งที่บันทึกไว้บนเครื่องนี้ รวมถึงบันทึกบนคลาวด์ที่ระบุไว้ข้างต้น ย้อนกลับไม่ได้ และไม่มีข้อมูลสำรองให้กู้คืน';

  @override
  String get privacyDeleteEverything => 'ลบทั้งหมด';

  @override
  String get privacyDeletedAll => 'ลบทุกอย่างแล้ว';

  @override
  String get privacyDeleteFailed => 'ลบข้อมูลของคุณไม่ได้';

  @override
  String get privacyDeletedUnverified =>
      'ทุกอย่างบนเครื่องนี้ถูกลบแล้ว Action ติดต่อคลาวด์ไม่ได้เพื่อยืนยันว่าไม่มีอะไรเหลืออยู่ที่นั่น และจะตรวจอีกครั้ง';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'ลบแล้ว ยกเว้น $leftovers';
  }

  @override
  String get privacyWillTryAgain => 'Action จะลองอีกครั้ง';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action ตรวจคลาวด์ไม่จบ และจะลองอีกครั้ง';

  @override
  String get privacyLeftoverCaptures => 'บางรายการที่บันทึกไว้';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'บันทึกบนคลาวด์ $count รายการ',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first และ$second';
  }

  @override
  String get privacyCloudDeleted => 'ลบบันทึกบนคลาวด์แล้ว';

  @override
  String get privacyCloudUnreachable => 'ยังติดต่อไม่ได้ Action จะลองอีกครั้ง';

  @override
  String get privacyPendingTitle => 'ยังต้องลบ';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'ครั้งที่แล้วติดต่อบันทึกบนคลาวด์ $count รายการไม่ได้ Action จะลองเองอีกครั้ง หรือคุณจะลองตอนนี้ก็ได้',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'ลองอีกครั้ง';

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

  @override
  String get detailSaveFailed => 'บันทึกไม่ได้ ไม่มีอะไรหาย — ลองอีกครั้ง';

  @override
  String get detailSectionCreatedFrom => 'สร้างจาก';

  @override
  String get detailSourceChecking => 'กำลังเรียกดูต้นฉบับที่บันทึกไว้…';

  @override
  String get detailSourceUnavailable => 'ต้นฉบับที่บันทึกไว้ไม่มีอยู่แล้ว';

  @override
  String get detailReopenAction => 'เปิดงานขึ้นมาใหม่';

  @override
  String get detailMarkActionComplete => 'ทำเครื่องหมายว่างานเสร็จแล้ว';

  @override
  String get detailGetHelp => 'ขอความช่วยเหลือกับเรื่องนี้';

  @override
  String get detailSectionHistory => 'ประวัติ';

  @override
  String get detailHistoryShowLess => 'แสดงน้อยลง';

  @override
  String detailHistoryShowAll(int count) {
    return 'แสดงทั้งหมด $count รายการ';
  }

  @override
  String get detailHistoryCreated => 'สร้างขึ้น';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'สร้างขึ้นพร้อม $count ขั้นตอน',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'คุณยืนยันรายละเอียดแล้ว';

  @override
  String detailHistoryStepFinished(String title) {
    return 'ทำ “$title” เสร็จแล้ว';
  }

  @override
  String get detailHistoryAStep => 'ขั้นตอนหนึ่ง';

  @override
  String get detailHistoryReminderSet => 'คุณตั้งการเตือนไว้';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'คุณตั้งการเตือนไว้สำหรับ $when';
  }

  @override
  String get detailHistoryCompleted => 'ทำเครื่องหมายว่าเสร็จแล้ว';

  @override
  String get detailHistoryChanged => 'เปลี่ยนแปลงล่าสุด';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy HH:mm';

  @override
  String get aiProviderCustom => 'กำหนดเอง (เข้ากันได้กับ OpenAI)';

  @override
  String get aiCapabilityText => 'ข้อความ';

  @override
  String get aiCapabilityImages => 'รูปภาพ';

  @override
  String get aiCapabilityDocuments => 'เอกสาร';

  @override
  String get aiCapabilityStructuredResults => 'ผลลัพธ์แบบมีโครงสร้าง';

  @override
  String get aiCapabilityStreaming => 'การทยอยส่งคำตอบ';

  @override
  String get aiCapabilitySystemInstructions => 'คำสั่งระบบ';

  @override
  String get aiCapabilityEvidenceCitations => 'การอ้างอิงหลักฐาน';

  @override
  String get aiCapabilityLongDocuments => 'เอกสารขนาดยาว';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a หรือ $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head หรือ $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'เชื่อมต่อผู้ให้บริการ AI เพื่อใช้เครื่องมือนี้';

  @override
  String get aiFailureInvalidKey => 'ผู้ให้บริการไม่รับกุญแจ API นั้น';

  @override
  String get aiFailureQuotaExceeded =>
      'บัญชีผู้ให้บริการของคุณเครดิตหมด หรือใช้ถึงโควตาแล้ว';

  @override
  String get aiFailureRateLimited =>
      'ผู้ให้บริการของคุณกำลังจำกัดอัตราคำขอ ลองอีกครั้งในอีกสักครู่';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action ติดต่อผู้ให้บริการ AI ของคุณไม่ได้ ตรวจสอบการเชื่อมต่อของคุณ';

  @override
  String get aiFailureUnsupportedModel =>
      'โมเดลนั้นไม่เปิดให้กุญแจของคุณใช้ เลือกโมเดลอื่นในการตั้งค่า';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'โมเดลที่คุณเลือกอ่าน$capabilitiesไม่ได้ เลือกโมเดลอื่นในการตั้งค่า';
  }

  @override
  String get aiFailureContextTooLarge =>
      'เนื้อหานั้นมากเกินกว่าที่โมเดลนี้จะอ่านได้ในครั้งเดียว';

  @override
  String get aiFailureInputTooLargeText =>
      'ข้อความนั้นมากเกินกว่าที่จะวิเคราะห์ได้ในครั้งเดียว';

  @override
  String get aiFailureProviderUnavailable =>
      'ผู้ให้บริการ AI ของคุณกำลังมีปัญหา ลองอีกครั้งในอีกสักครู่';

  @override
  String get aiFailureMalformedResponse =>
      'ผู้ให้บริการนั้นส่งกลับมาเป็นสิ่งที่ Action อ่านไม่ได้';

  @override
  String get aiFailureCancelled => 'หยุดแล้ว';

  @override
  String get aiFailureInsecureEndpoint =>
      'endpoint นั้นต้องเป็นที่อยู่แบบ https://';

  @override
  String get aiFailureUnknown =>
      'มีบางอย่างผิดพลาดระหว่างติดต่อผู้ให้บริการ AI ของคุณ';

  @override
  String get appLockTitle => 'Action ล็อกอยู่';

  @override
  String get appLockPrompt =>
      'ยืนยันว่าเป็นคุณเพื่อไปต่อ Action ขอให้เครื่องของคุณเป็นผู้ยืนยัน — ตัวมันเองไม่เคยเห็นลายนิ้วมือ ใบหน้า หรือ PIN ของคุณ';

  @override
  String get appLockUnlocking => 'กำลังปลดล็อก…';

  @override
  String get appLockNotConfirmed =>
      'การยืนยันไม่สำเร็จ ลองอีกครั้งเมื่อคุณพร้อม';

  @override
  String get appLockCannotConfirm =>
      'ตอนนี้เครื่องของคุณยืนยันว่าเป็นคุณไม่ได้ ตรวจดูว่ายังตั้งการล็อกหน้าจอไว้ในการตั้งค่าเครื่องอยู่';

  @override
  String get appLockWaiting => 'กำลังรอ…';

  @override
  String get appLockUnlock => 'ปลดล็อก';

  @override
  String get appLockReasonUnlock => 'ปลดล็อก Action';

  @override
  String get appLockReasonEnable => 'ยืนยันว่าเป็นคุณก่อนเปิดใช้ล็อกแอป';

  @override
  String get appLockReasonDisable => 'ยืนยันว่าเป็นคุณก่อนปิดล็อกแอป';

  @override
  String get todayCapabilityHeading => 'Action รับมือกับอะไรได้บ้าง';

  @override
  String get todayCapabilityDocumentTitle => 'จดหมายหรือใบแจ้งหนี้';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action อ่านมัน แล้วหากำหนดส่ง จำนวนเงิน และเลขอ้างอิง';

  @override
  String get todayCapabilityScreenshotTitle => 'ภาพหน้าจอสักภาพ';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'เปลี่ยนข้อความที่ไม่อย่างนั้นคุณก็คงลืม ให้เป็นสิ่งที่ลงมือทำได้';

  @override
  String get todayCapabilityTextTitle => 'ข้อความสักท่อน';

  @override
  String get todayCapabilityTextBlurb =>
      'วางอะไรก็ได้ Action จะดูออกเองว่ามันคืออะไรและมันขออะไรจากคุณ';

  @override
  String get todayCapabilityConfirmTitle => 'คุณเป็นผู้ยืนยันทุกอย่าง';

  @override
  String get todayCapabilityConfirmBlurb =>
      'ไม่มีอะไรกลายเป็นงานจนกว่าคุณจะได้เห็นหลักฐานและตอบตกลง';

  @override
  String get todayCapabilityExploreIntelligence => 'สำรวจอินเทลลิเจนซ์';

  @override
  String get documentRejectedEmpty => 'ไฟล์นั้นว่างเปล่า';

  @override
  String documentRejectedTooLarge(String size) {
    return 'เอกสารนั้นมีขนาด $size ซึ่งใหญ่เกินกว่าที่ Action จะทำงานด้วยได้';
  }

  @override
  String get documentRejectedNotAPdf =>
      'สิ่งนั้นไม่ใช่ PDF ไม่ว่าจะเรียกมันว่าอะไรก็ตาม Action อ่าน PDF และรูปภาพ';

  @override
  String get documentRejectedUnreadable => 'อ่านเอกสารนั้นไม่ได้';

  @override
  String get pdfRejectedNotAPdf =>
      'ไฟล์นั้นไม่ใช่ PDF ไม่ว่าจะเรียกมันว่าอะไรก็ตาม';

  @override
  String get pdfRejectedEncrypted =>
      'PDF นั้นมีรหัสผ่านป้องกันอยู่ Action จึงอ่านไม่ได้';

  @override
  String get pdfRejectedDamaged => 'อ่าน PDF นั้นไม่ได้ ไฟล์อาจไม่สมบูรณ์';

  @override
  String get shareRejectedEmpty => 'ในสิ่งที่แชร์มานั้นไม่มีอะไรให้อ่าน';

  @override
  String get shareRejectedUnsupportedType =>
      'Action รับข้อความ รูปภาพ และ PDF ได้ สิ่งนั้นเป็นอย่างอื่น';

  @override
  String get shareRejectedContentMismatch =>
      'ไฟล์นั้นไม่ใช่ชนิดไฟล์อย่างที่มันบอก Action จึงไม่ได้เปิดมัน';

  @override
  String get shareRejectedTooLarge =>
      'ไฟล์นั้นใหญ่เกินกว่าที่ Action จะทำงานด้วยได้';

  @override
  String get shareRejectedUnreadable => 'อ่านไฟล์นั้นไม่ได้';

  @override
  String get captureFailureRecognition => 'การอ่านตัวอักษรทำงานไม่ได้';

  @override
  String get captureFailureImageFormat => 'รูปแบบภาพนั้นอ่านไม่ได้บนเครื่องนี้';

  @override
  String get connectSheetTitle => 'เชื่อมต่อ AI ของคุณ';

  @override
  String get connectSheetSubtitle =>
      'คุณใช้บัญชีผู้ให้บริการและกุญแจ API ของคุณเอง Action เก็บกุญแจไว้ในที่เก็บนิรภัยของเครื่องนี้';

  @override
  String get connectErrorKeyMissing => 'วางกุญแจ API ของคุณเพื่อไปต่อ';

  @override
  String get connectErrorModelMissing => 'เลือกโมเดล หรือพิมพ์ไอดีโมเดล';

  @override
  String get connectErrorEndpointMissing => 'ใส่ที่อยู่ endpoint ของคุณ';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'เปิดที่เก็บนิรภัยของเครื่องนี้ไม่ได้ กุญแจจึงไม่ถูกบันทึก';

  @override
  String get connectTestSucceeded => 'เชื่อมต่อแล้ว';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'เชื่อมต่อแล้ว มี $count โมเดลให้ใช้';
  }

  @override
  String get connectProviderLabel => 'ผู้ให้บริการ';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'ต้องเป็นที่อยู่แบบ https:// Action จะไม่ส่งเอกสารของคุณผ่านการเชื่อมต่อที่ไม่ได้เข้ารหัส';

  @override
  String get connectApiKeyLabel => 'กุญแจ API';

  @override
  String get connectApiKeyHint => 'วางกุญแจของคุณ';

  @override
  String get connectKeyPrivacyNote =>
      'กุญแจของคุณอยู่ในเครื่องนี้ Action ไม่เคยส่งมันไปที่ใดนอกจากผู้ให้บริการที่คุณเลือก และแสดงให้คุณดูอีกไม่ได้หลังจากบันทึกแล้ว';

  @override
  String get connectModelLabel => 'โมเดล';

  @override
  String get connectModelIdHint => 'ไอดีโมเดล';

  @override
  String get connectModelFreeTextNote =>
      'ผู้ให้บริการมีการเลิกใช้ไอดีโมเดลเดิมและเพิ่มไอดีใหม่ ถ้าไอดีที่คุณต้องการไม่มีในรายการ ให้พิมพ์ลงที่นี่';

  @override
  String get connectAndTest => 'เชื่อมต่อและทดสอบ';

  @override
  String get connectSaveWithoutTesting => 'บันทึกโดยไม่ทดสอบ';

  @override
  String get toolWarningFactsNotChecked =>
      'Action เทียบสิ่งนี้กับข้อความต้นฉบับไม่ได้ จำนวนเงินและวันที่ในนั้นจึงไม่ได้รับการตรวจสอบ';

  @override
  String get toolTitleRewrite => 'ปรับข้อเขียนนี้ให้ดีขึ้น';

  @override
  String get toolDescriptionRewrite =>
      'ชัดขึ้น สั้นลง หรือเป็นทางการขึ้น — ข้อมูลยังอยู่ครบ';

  @override
  String get toolModeRewriteClearer => 'ชัดขึ้น';

  @override
  String get toolModeRewriteProfessional => 'เป็นมืออาชีพขึ้น';

  @override
  String get toolModeRewriteShorter => 'สั้นลง';

  @override
  String get toolModeRewritePersuasive => 'โน้มน้าวใจมากขึ้น';

  @override
  String get toolModeRewriteSimpler => 'ง่ายขึ้น';

  @override
  String get toolModeRewriteStructured => 'มีโครงสร้างขึ้น';

  @override
  String get toolModeRewriteGrammarOnly => 'ไวยากรณ์เท่านั้น';

  @override
  String get toolSectionWhatChanged => 'อะไรเปลี่ยนไปบ้าง';

  @override
  String get toolSectionNote => 'หมายเหตุ';

  @override
  String get toolSectionAlreadyClearBody =>
      'ข้อความนี้ชัดเจนอยู่แล้ว การเปลี่ยนแปลงด้านล่างเป็นเรื่องเล็กน้อย';

  @override
  String get toolSectionImprovedText => 'ข้อความที่ปรับแล้ว';

  @override
  String get toolTitleDraftReply => 'ร่างคำตอบ';

  @override
  String get toolDescriptionDraftReply => 'คำตอบที่คุณแก้ไขและส่งเองได้';

  @override
  String get toolModeReplyProfessional => 'เป็นมืออาชีพ';

  @override
  String get toolModeReplyConcise => 'กระชับ';

  @override
  String get toolModeReplyFriendly => 'เป็นมิตร';

  @override
  String get toolModeReplyFormal => 'เป็นทางการ';

  @override
  String get toolModeReplyClarification => 'ขอให้ชี้แจง';

  @override
  String get toolModeReplyConfirmation => 'ยืนยันการได้รับ';

  @override
  String get toolModeReplyDispute => 'โต้แย้งเรื่องนี้';

  @override
  String get toolSectionSubject => 'เรื่อง';

  @override
  String get toolSectionDraftReply => 'คำตอบฉบับร่าง';

  @override
  String get toolSectionPlaceholders => 'คุณต้องกรอกส่วนเหล่านี้';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'ฉบับร่าง — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'นี่คือฉบับร่าง Action ไม่ส่งอะไรทั้งนั้น — อ่าน แก้ไข แล้วส่งด้วยตัวคุณเอง';

  @override
  String get toolTitleTranslate => 'แปล';

  @override
  String get toolDescriptionTranslate =>
      'อีกภาษาหนึ่ง โดยตัวเลขและชื่อยังอยู่ครบ';

  @override
  String get toolSectionTranslation => 'คำแปล';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return 'จาก $from เป็น $to';
  }

  @override
  String get toolSectionKeptInOriginal => 'คงไว้ตามต้นฉบับ';

  @override
  String get toolWarningTranslationNotCertified =>
      'เป็นคำแปลเพื่อให้เข้าใจ ไม่ใช่คำแปลที่ได้รับการรับรอง';

  @override
  String get toolTitleStructuredData => 'ดึงตารางออกมา';

  @override
  String get toolDescriptionStructuredData =>
      'แถว ช่องข้อมูล และตัวเลขที่คุณคัดลอกออกไปได้';

  @override
  String get toolSectionTable => 'ตาราง';

  @override
  String get toolSectionFields => 'ช่องข้อมูล';

  @override
  String get toolSectionTableCsv => 'ตาราง (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'อ่านการจัดคอลัมน์ของตารางนี้ได้ไม่น่าเชื่อถือ ตรวจดูว่าแต่ละแถวตรงกันก่อนนำไปใช้';

  @override
  String get toolTitleDeadlineFinder => 'หากำหนดส่ง';

  @override
  String get toolDescriptionDeadlineFinder =>
      'อะไรถึงกำหนด เมื่อไร และจะเกิดอะไรขึ้นถ้าไม่ทำ';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'กำหนดส่ง $count รายการ',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'ไม่มีอะไรถึงกำหนด';

  @override
  String get toolSectionNothingDueBody =>
      'Action ไม่พบกำหนดส่งหรือภาระผูกพันในเนื้อหานี้';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'ไม่มีอะไรถูกตั้งเวลาจนกว่าคุณจะเลือกเอง การเตือนไม่เคยถูกตั้งขึ้นเองโดยอัตโนมัติเลย';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'ถ้าไม่ทำ: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'คุณต้องมี: $items';
  }

  @override
  String get moneyErrorEmpty => 'ไม่ได้ระบุจำนวน';

  @override
  String get moneyErrorMalformed => 'จำนวนนี้ไม่ใช่ตัวเลขล้วน';

  @override
  String get moneyErrorNegative => 'จำนวนติดลบไม่ใช่ยอดที่ชำระได้';

  @override
  String get moneyErrorTooManyDecimals => 'ทศนิยมมากกว่าที่สกุลเงินนี้มี';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'รหัสสกุลเงินนี้ไม่ใช่รหัสที่เรารู้จัก';

  @override
  String get moneyErrorOutOfRange => 'จำนวนนี้ใหญ่จนไม่น่าเป็นไปได้';

  @override
  String get escalationOcrFailed =>
      'การอ่านตัวอักษรทำงานกับรายการที่บันทึกไว้นี้ไม่ได้เลย';

  @override
  String get escalationNoTextRecognised =>
      'สิ่งนี้ดูเหมือนเอกสาร แต่การอ่านไม่ได้ข้อความออกมาเลย';

  @override
  String get escalationThinText =>
      'อ่านข้อความออกมาได้น้อยเกินไปมากสำหรับเอกสารขนาดนี้';

  @override
  String get escalationLowLineConfidence =>
      'ตัวอ่านรายงานว่ามีความมั่นใจต่ำในหลายบรรทัด';

  @override
  String get escalationTableLikeLayout =>
      'การจัดวางดูเหมือนตาราง และการอ่านทีละบรรทัดทำให้เสียข้อมูลว่าค่าใดอยู่แถวไหน';

  @override
  String get escalationFragmentedLayout =>
      'ข้อความกลับมาเป็นชิ้นเล็กชิ้นน้อยจำนวนมาก โครงสร้างจึงไม่ชัดเจน';

  @override
  String get escalationMalformedText =>
      'ข้อความที่อ่านได้ส่วนมากไม่ใช่คำหรือตัวเลขที่อ่านออก';

  @override
  String get escalationConflictingDates =>
      'มีวันที่มากกว่าหนึ่งวันถูกนำเสนอว่าเป็นกำหนดส่ง';

  @override
  String get escalationConflictingAmounts =>
      'มีจำนวนเงินมากกว่าหนึ่งจำนวนถูกนำเสนอว่าเป็นยอดที่ต้องชำระ';

  @override
  String get escalationUnresolvedGrounding =>
      'บางค่าไม่สามารถย้อนกลับไปหาข้อความในเอกสารได้';

  @override
  String get escalationInstructionLikeContent =>
      'ในเอกสารมีข้อความที่เขียนราวกับเป็นคำสั่งถึงแอป ข้อความนั้นถูกถือเป็นเนื้อหาของเอกสาร ไม่เคยถูกถือเป็นคำสั่งเลย';

  @override
  String get providerFailureNetwork =>
      'Action ติดต่อบริการนั้นไม่ได้ ตรวจสอบการเชื่อมต่อของคุณ';

  @override
  String get providerFailureTimedOut => 'บริการใช้เวลาตอบนานเกินไป';

  @override
  String get providerFailureServiceUnavailable =>
      'บริการไม่พร้อมใช้งานชั่วคราว ลองอีกครั้งภายหลัง';

  @override
  String get providerFailureUnauthorized =>
      'ตอนนี้แอปนี้ไม่ได้รับอนุญาตให้ใช้บริการนั้น';

  @override
  String get providerFailureBlocked => 'บริการปฏิเสธที่จะประมวลผลเอกสารนี้';

  @override
  String get providerFailureUnknown =>
      'Action อ่านเอกสารนี้ไม่ได้ ลองอีกครั้งอาจได้ผล';

  @override
  String get reviewBlockerTitle => 'ตั้งชื่อให้งานนี้';

  @override
  String get reviewBlockerDate =>
      'เลือกว่าวันไหนคือกำหนดส่งจริง หรือเว้นไว้ไม่กำหนด';

  @override
  String get reviewBlockerAmount =>
      'เลือกว่าจำนวนไหนถูกต้อง หรือเว้นไว้ไม่กำหนด';

  @override
  String get reviewBlockerStepTitle => 'ขั้นตอนที่คุณเก็บไว้ต้องมีชื่อ';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'หน้า $page',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'หน้า $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$values ไม่อยู่ในข้อความที่เขียนใหม่แล้ว ตรวจสอบก่อนนำไปใช้',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$values และอีก $count รายการไม่อยู่ในข้อความที่เขียนใหม่แล้ว ตรวจสอบก่อนนำไปใช้',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'บรรลุแล้ว';

  @override
  String get goalNewSheetTitle => 'คุณอยากให้เกิดอะไรขึ้น';

  @override
  String get goalNewSheetSubtitle =>
      'ประโยคเดียวก็พอ รายละเอียดค่อยเพิ่มทีหลังได้';

  @override
  String get goalTitleHint => 'ต่อประกันรถโดยไม่จ่ายแพงเกินจำเป็น';

  @override
  String get goalCreateAction => 'สร้างเป้าหมาย';

  @override
  String get goalTitleSheetTitle => 'สิ่งที่คุณต้องการ';

  @override
  String get goalOutcomeSheetTitle => 'เสร็จแล้วเป็นอย่างไร';

  @override
  String get goalContextSheetTitle => 'ตอนนี้ถึงไหนแล้ว';

  @override
  String get goalOutcomeHint => 'รถมีประกันแล้วและเอกสารยื่นเรียบร้อย';

  @override
  String get goalContextHint =>
      'มีใบเสนอราคาสองเจ้าแล้ว และต้องต่ออายุวันที่ 18';

  @override
  String get goalWorkspaceTitle => 'เป้าหมาย';

  @override
  String get goalUnmarkReached => 'ยกเลิกเครื่องหมายว่าบรรลุแล้ว';

  @override
  String get goalMarkReached => 'ทำเครื่องหมายว่าบรรลุแล้ว';

  @override
  String get goalNotFound => 'เป้าหมายนั้นไม่อยู่ที่นี่แล้ว';

  @override
  String get goalDeleteTitle => 'ลบเป้าหมายนี้ไหม';

  @override
  String get goalDeleteBody =>
      'เป้าหมายจะถูกนำออกจากเครื่องนี้ งานที่สร้างจากมันยังคงอยู่เหมือนเดิมทุกประการ';

  @override
  String get goalOutcomeLabel => 'เสร็จแล้วเป็นอย่างไร';

  @override
  String get goalOutcomeEmpty =>
      'ยังไม่ได้เขียนไว้ เป้าหมายจะวางแผนได้ง่ายขึ้นเมื่อคุณบอกไว้แล้วว่าทำเสร็จหมายถึงอะไร';

  @override
  String get goalContextLabel => 'ตอนนี้ถึงไหนแล้ว';

  @override
  String get goalContextEmpty =>
      'ยังไม่ได้เขียนอะไรไว้ สิ่งที่เกิดขึ้นมาแล้ว และสิ่งที่ขวางอยู่';

  @override
  String get goalTitleLabel => 'สิ่งที่คุณต้องการ';

  @override
  String get goalEditTooltip => 'แก้ไขเป้าหมาย';

  @override
  String get goalToolsLabel => 'สิ่งที่ Action ทำได้';

  @override
  String get goalToolsNotReady =>
      'เขียนเพิ่มอีกสักหน่อยว่าคุณต้องการอะไร แล้วเครื่องมือเหล่านี้จะมีอะไรให้ทำงานด้วย';

  @override
  String get toolGoalOptimizerTitle => 'ปรับเป้าหมายให้คมขึ้น';

  @override
  String get toolActionPlanTitle => 'วางแผน';

  @override
  String get resultFactUnconfirmed => 'ยังไม่ได้ยืนยัน';

  @override
  String get resultSuggestedSteps => 'ขั้นตอนที่แนะนำ';

  @override
  String get resultSuggestedAction => 'งานที่แนะนำ';

  @override
  String get resultWorthAsking => 'คำถามที่ควรถาม';

  @override
  String get resultSuggestedDeadlines => 'กำหนดส่งที่แนะนำ';

  @override
  String get resultSuggestions => 'ข้อเสนอแนะ';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ข้อความอ้างอิงสนับสนุน $count รายการ',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'จากแหล่งที่มาที่คุณเลือก';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source $page';
  }

  @override
  String get toolRunStagePreparing => 'กำลังเตรียมเอกสารของคุณ';

  @override
  String get toolRunStageReading => 'กำลังอ่านหน้าที่เลือกไว้';

  @override
  String get toolRunStageAnalysing => 'กำลังวิเคราะห์';

  @override
  String get toolRunStageBuilding => 'กำลังจัดสิ่งที่ให้คุณตรวจทาน';

  @override
  String get toolRunStageDone => 'เสร็จแล้ว';

  @override
  String get toolRunStageFailed => 'ทำงานไม่จบ';

  @override
  String get toolRunStageCancelled => 'คุณหยุดไว้';

  @override
  String get toolRunFailureLocalCheckFailed => 'ตรวจสิ่งนั้นไม่สำเร็จ';

  @override
  String get toolRunFailureProviderRetired =>
      'เวอร์ชันนี้ไม่มีผู้ให้บริการ AI รายนั้นแล้ว';

  @override
  String get toolRunFailureUnusableReply =>
      'คำตอบนั้นกลับมาในรูปแบบที่ใช้ไม่ได้ ลองอีกครั้ง';

  @override
  String get toolRunFailureQuestionRequired => 'พิมพ์คำถามก่อน';

  @override
  String get toolRunFailureInputRequired =>
      'เลือกสิ่งที่จะให้เครื่องมือนี้ทำงานด้วย';

  @override
  String get toolWarningReplyTruncated =>
      'คำตอบนี้ถูกตัดจบกลางคัน สิ่งที่แสดงอยู่จึงอาจไม่ครบ';

  @override
  String get toolWarningNoSupportingQuotes =>
      'โมเดลของคุณไม่ได้ส่งข้อความอ้างอิงสนับสนุนกลับมาเลย ทุกอย่างที่แสดงอยู่ที่นี่จึงไม่มีหลักฐานรองรับ ให้เทียบกับเอกสารก่อนที่คุณจะลงมือทำตาม';

  @override
  String get aiSettingsRemoveTitle => 'นำการเชื่อมต่อนี้ออกไหม';

  @override
  String get aiSettingsRemoveBody =>
      'Action จะลบกุญแจ API ของคุณออกจากเครื่องนี้ และหยุดใช้ฟีเจอร์ AI บัญชีผู้ให้บริการของคุณไม่ได้รับผลกระทบ';

  @override
  String get aiSettingsProviderLabel => 'ผู้ให้บริการ';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'ผู้ให้บริการของคุณเป็นผู้เรียกเก็บเงินตามที่คุณใช้ Action ไม่เคยส่งคำขอเองโดยลำพัง';

  @override
  String get aiSettingsConnectLabel => 'เชื่อมต่อผู้ให้บริการ AI';

  @override
  String get aiSettingsConnectDescription =>
      'ใช้บัญชีและกุญแจ API ของคุณเองกับ OpenAI, Anthropic, Google Gemini หรือ endpoint ที่เข้ากันได้';

  @override
  String get aiSettingsModelLabel => 'โมเดล';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'กุญแจ API';

  @override
  String get aiSettingsKeyStored => 'เก็บไว้ในที่เก็บนิรภัยของเครื่องนี้';

  @override
  String get aiSettingsKeyMissing =>
      'ไม่พบกุญแจบนเครื่องนี้ เชื่อมต่ออีกครั้งเพื่อเพิ่มกุญแจ';

  @override
  String get aiSettingsTestLabel => 'ทดสอบการเชื่อมต่อ';

  @override
  String get aiSettingsProviderUnavailable =>
      'เวอร์ชันนี้ไม่มีผู้ให้บริการรายนั้น';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'เชื่อมต่อแล้ว มี $count โมเดลให้ใช้';
  }

  @override
  String get aiSettingsTestButton => 'ทดสอบ';

  @override
  String get aiSettingsChangeProvider => 'เปลี่ยนผู้ให้บริการหรือโมเดล';

  @override
  String get aiSettingsRemoveKey => 'นำกุญแจออก';

  @override
  String get aiSettingsSectionPrivacy => 'ความเป็นส่วนตัว';

  @override
  String get aiSettingsWhatGetsSentLabel => 'อะไรถูกส่งไปบ้าง';

  @override
  String get aiSettingsWhereItGoesLabel => 'มันไปที่ไหน';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'ไม่มีอะไรถูกส่งจนกว่าคุณจะเชื่อมต่อผู้ให้บริการ';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'ตรงไปยัง $provider โดยใช้กุญแจของคุณ ไม่ผ่านเซิร์ฟเวอร์ใดที่เป็นของ Action';
  }

  @override
  String get aiSettingsSectionData => 'ข้อมูล';

  @override
  String get aiSettingsDataFootnote =>
      'Action จำว่าคุณใช้เครื่องมือใดบ้าง แต่ไม่เคยจำว่าคุณใช้มันกับอะไร';

  @override
  String get aiSettingsRecentToolsLabel => 'เครื่องมือที่ใช้ล่าสุด';

  @override
  String get aiSettingsRecentToolsNone => 'ไม่มี';

  @override
  String get reminderNotificationTitle => 'การเตือนจาก Action';

  @override
  String get reminderNotificationPrivateBody => 'คุณมีบางอย่างที่ต้องตรวจดู';

  @override
  String get reminderChannelName => 'การเตือนของ Action';

  @override
  String get reminderChannelDescription =>
      'การเตือนที่คุณตั้งไว้เองสำหรับงานของคุณ';

  @override
  String get onboardingStart => 'เริ่มใช้ Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'ขั้นที่ $current จาก $total';
  }

  @override
  String get onboardingCaptureTitle => 'เปลี่ยนข้อมูลให้เป็นงานที่ลงมือทำได้';

  @override
  String get onboardingCaptureBody =>
      'เพิ่มภาพหน้าจอ รูปถ่าย หรือข้อความที่มีคนส่งมาให้คุณ Action อ่านมัน แล้วดูออกว่ามันขออะไรจากคุณ';

  @override
  String get onboardingReviewTitle => 'ไม่มีอะไรถูกบันทึกจนกว่าคุณจะยืนยัน';

  @override
  String get onboardingReviewBody =>
      'Action แสดงให้คุณเห็นสิ่งที่มันพบ พร้อมถ้อยคำที่มันมาจาก คุณแก้สิ่งที่ผิดได้ทุกจุด จนกว่าคุณจะยืนยัน มันเป็นเพียงข้อเสนอแนะ — ไม่ใช่ข้อเท็จจริง และยังไม่ใช่งาน';

  @override
  String get onboardingTrackingTitle => 'ตามทันสิ่งที่สำคัญ';

  @override
  String get onboardingTrackingBody =>
      '“ต้องการความสนใจ” จะดึงสิ่งที่เลยกำหนดหรือใกล้ถึงกำหนดขึ้นมาก่อน ทุกงานเก็บขั้นตอนถัดไป ความคืบหน้า และการเตือนที่คุณตั้งไว้เองของมันไว้ครบ';

  @override
  String get onboardingPrivacyBody => 'ควรรู้ไว้ก่อนเริ่ม:';

  @override
  String get onboardingPrivacyOnDevice =>
      'งาน สิ่งที่บันทึกไว้ การเตือน และการค้นหาของคุณถูกเก็บไว้บนเครื่องนี้ การค้นหาและการเตือนทำงานได้โดยไม่ต้องมีการเชื่อมต่อ';

  @override
  String get onboardingPrivacySentToRead =>
      'เมื่อคุณขอให้ Action อ่านอะไรสักอย่าง เนื้อหานั้นจะถูกส่งไปยังบริการ AI ที่ตีความมัน';

  @override
  String get onboardingPrivacyCloud =>
      'บันทึกสั้น ๆ ของงานที่คุณยืนยันแล้ว — ชื่อ วันที่ จำนวนเงิน และขั้นตอนที่แนะนำ — อาจถูกเก็บไว้บนคลาวด์ภายใต้รหัสนิรนามของเครื่องนี้ ส่วนสิ่งที่บันทึกไว้ ขั้นตอน และการเตือนของคุณจะไม่ถูกส่ง';

  @override
  String get onboardingPrivacyNotBackup =>
      'บันทึกนั้นไม่ใช่ข้อมูลสำรอง มันกู้คืนอะไรไปยังเครื่องใหม่ไม่ได้';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'สิ่งที่ขวางอยู่ $count อย่าง',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'อาจทำให้ง่ายขึ้นได้';

  @override
  String get toolDescriptionGoalOptimizer =>
      'อะไรที่ขาดไป อะไรที่ขวางอยู่ อะไรที่ควรทำก่อน';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'หลังจาก $step';
  }

  @override
  String get toolSectionThePlan => 'แผน';

  @override
  String get toolDescriptionActionPlan =>
      'ชุดขั้นตอนที่เรียงลำดับไว้ ซึ่งคุณเปลี่ยนเป็นงานได้';

  @override
  String get toolTitleSmartChecklist => 'ทำรายการตรวจสอบ';

  @override
  String get toolDescriptionSmartChecklist =>
      'ทุกอย่างที่สิ่งนี้ขอจากคุณ เรียงตามลำดับ';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'รายละเอียดที่ขาดไป $count อย่าง',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'ข้อความเหล่านี้ขัดแย้งกันเอง';

  @override
  String get toolTitleMissingInformation => 'สิ่งที่ขาดไป';

  @override
  String get toolDescriptionMissingInformation =>
      'ช่องว่างที่เหลืออยู่ และสิ่งที่ควรถามเกี่ยวกับมัน';

  @override
  String get aiAdapterTimedOut => 'คำขอนั้นใช้เวลานานเกินไป และถูกหยุดแล้ว';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'การเชื่อมต่อที่ปลอดภัยไปยังผู้ให้บริการ AI ของคุณล้มเหลว';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action หาโมเดลหรือ endpoint นั้นไม่พบ';

  @override
  String get aiAdapterRequestRejected => 'ผู้ให้บริการ AI ของคุณปฏิเสธคำขอนั้น';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action เปิดที่เก็บนิรภัยของเครื่องนี้ไม่ได้';

  @override
  String get aiAdapterEndpointMissing =>
      'ใส่ที่อยู่ endpoint AI ของคุณในการตั้งค่า';

  @override
  String get aiAdapterReplyIncomplete => 'คำตอบนั้นกลับมาไม่ครบ ลองอีกครั้ง';

  @override
  String get aiAdapterContentDeclined =>
      'ผู้ให้บริการของคุณปฏิเสธที่จะประมวลผลเนื้อหานั้น';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'นั่นเกิน $limit ไฟล์ในคราวเดียว เลือกให้น้อยลง';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'มีภาพหนึ่งในนั้นใหญ่เกินกว่าที่จะวิเคราะห์ได้';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '“$filename” ใหญ่เกินกว่าที่จะวิเคราะห์ได้ ขีดจำกัดคือ $limit MB';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '“$filename” มี $count หน้า Action อ่านได้ครั้งละไม่เกิน $limit หน้า — เลือกช่วงหน้าที่ต้องการ';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'สิ่งที่คุณเลือกไว้ใหญ่เกินกว่าที่จะส่งได้ในคำขอเดียว';

  @override
  String get toolRunNotAvailableTitle => 'เครื่องมือนั้นใช้ไม่ได้';

  @override
  String get toolRunNotAvailableMessage =>
      'มันอาจถูกนำออกไปแล้วใน Action เวอร์ชันที่ใหม่กว่า';

  @override
  String get toolRunNoSourcesYet =>
      'ยังไม่มีอะไรให้ทำงานด้วย บันทึกบางอย่างเข้ามา หรือวางข้อความไว้ด้านล่าง';

  @override
  String get toolRunChooseSourcesToCompare => 'เลือกสิ่งที่จะเปรียบเทียบ';

  @override
  String get toolRunChooseSource => 'เลือกแหล่งที่มา';

  @override
  String get toolRunQuestionLabel => 'คำถามของคุณ';

  @override
  String get toolRunQuestionHint => 'กำหนดส่งคือเมื่อไร';

  @override
  String get toolRunFreeTextLabel => 'หรือวางข้อความ';

  @override
  String get toolRunFreeTextHint => 'วางหรือพิมพ์ที่นี่';

  @override
  String get toolRunModeLabel => 'ลักษณะผลลัพธ์';

  @override
  String get toolRunRunLocally => 'ตรวจในเครื่องนี้';

  @override
  String get toolRunRun => 'เรียกใช้';

  @override
  String get toolRunStop => 'หยุด';

  @override
  String get toolRunRunAgain => 'เรียกใช้อีกครั้ง';

  @override
  String get toolRunWorkingOn => 'กำลังทำงานกับ:';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'ส่งสิ่งนี้ไปยัง $provider ไหม';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'เนื้อหาที่คุณเลือกไว้จะถูกส่งไปยัง $provider เพื่อประมวลผล โดยใช้กุญแจ API ของคุณ';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'กุญแจของคุณอยู่บนเครื่องนี้ Action ไม่ส่งอะไรอยู่เบื้องหลัง และไม่ส่งงานหรือแหล่งที่มาอื่นของคุณไปด้วย';

  @override
  String get toolRunScopeTitle => 'ก่อนที่สิ่งนี้จะเริ่มทำงาน';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count หน้าจะถูกวิเคราะห์ผ่านการเชื่อมต่อ $provider ของคุณ',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ไฟล์จะถูกวิเคราะห์ผ่านการเชื่อมต่อ $provider ของคุณ',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'ข้อความที่คุณเลือกไว้จะถูกส่งไปยังการเชื่อมต่อ $provider ของคุณ';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'เชื่อมต่อผู้ให้บริการ AI เพื่อใช้เครื่องมือนี้';

  @override
  String get toolRunNeedsProviderBody =>
      'คุณใช้บัญชีผู้ให้บริการและกุญแจ API ของคุณเอง';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'สร้างงานจาก $count ขั้นตอนแล้ว',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เพิ่ม $count ขั้นตอนแล้ว',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ขั้นตอน',
    );
    return 'สร้างงาน · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ขั้นตอน',
    );
    return 'เพิ่มลงในงานนี้ · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'รูปถ่าย';

  @override
  String get sourceTypeLabelScreenshot => 'ภาพหน้าจอ';

  @override
  String get sourceTypeLabelPastedText => 'ข้อความที่วางไว้';

  @override
  String get sourceTypeLabelDocument => 'เอกสาร';

  @override
  String get toolModeClearer => 'ชัดขึ้น';

  @override
  String get toolModeMoreProfessional => 'เป็นมืออาชีพขึ้น';

  @override
  String get toolModeShorter => 'สั้นลง';

  @override
  String get toolModeSimpler => 'ง่ายขึ้น';

  @override
  String get toolModeMoreStructured => 'มีโครงสร้างขึ้น';

  @override
  String get toolModeMorePersuasive => 'โน้มน้าวใจมากขึ้น';

  @override
  String get toolModeGrammarOnly => 'ไวยากรณ์เท่านั้น';

  @override
  String get toolModeProfessional => 'เป็นมืออาชีพ';

  @override
  String get toolModeConcise => 'กระชับ';

  @override
  String get toolModeFriendly => 'เป็นมิตร';

  @override
  String get toolModeFormal => 'เป็นทางการ';

  @override
  String get toolModeAskForClarification => 'ขอให้ชี้แจง';

  @override
  String get toolModeConfirm => 'ยืนยันการได้รับ';

  @override
  String get toolModeDispute => 'โต้แย้งเรื่องนี้';

  @override
  String get toolModeQuick => 'ฉบับย่อ';

  @override
  String get toolModeDetailed => 'ฉบับละเอียด';

  @override
  String get toolModeExecutive => 'ฉบับผู้บริหาร';

  @override
  String get toolModeKeyPoints => 'ประเด็นสำคัญ';

  @override
  String get toolModeActionFocused => 'เน้นงานที่ต้องทำ';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'มีข้อความที่ยกมาอ้าง $count จุดที่หาไม่พบในสิ่งที่คุณเลือก จึงถูกทำเครื่องหมายว่ายังไม่แน่ชัด',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action เทียบข้อความที่ยกมาอ้างเหล่านี้กับตัวไฟล์เองไม่ได้ ข้อความที่ยกมาอ้างเหล่านี้จึงยังไม่ได้รับการตรวจสอบ';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เลยกำหนด · $count วัน',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'กำหนดพรุ่งนี้';

  @override
  String get triageBadgeReminderSoon => 'ใกล้ถึงเวลาเตือน';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เลยกำหนดมา $count วัน',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status $title';
  }

  @override
  String get triageExplanationDone => 'งานนี้เสร็จแล้ว';

  @override
  String get triageExplanationNothingPressing =>
      'งานนี้อยู่ตรงนี้เพราะยังไม่มีอะไรเกี่ยวกับมันที่เร่งในตอนนี้';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'งานนี้ต้องการความใส่ใจเพราะ$reason';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'งานนี้อยู่ต่ำลงมาเพราะ$reason';
  }

  @override
  String get triageReasonOverdue => 'มันเลยกำหนดแล้ว';

  @override
  String get triageReasonDeadlinePassed => 'กำหนดส่งของมันผ่านไปแล้ว';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'มันเลยกำหนดมา $count วันแล้ว',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'มันถึงกำหนดวันนี้';

  @override
  String get triageReasonCriticalDueSoon =>
      'คุณทำเครื่องหมายว่ามันวิกฤต และกำหนดส่งของมันใกล้เข้ามาแล้ว';

  @override
  String get triageReasonAllStepsDone =>
      'ครบทุกขั้นตอนแล้ว — เหลือเพียงปิดงานให้เสร็จ';

  @override
  String get triageReasonDueTomorrow => 'มันถึงกำหนดพรุ่งนี้';

  @override
  String get triageReasonReminderSoon =>
      'คุณตั้งการเตือนไว้สำหรับมันภายในหนึ่งวันข้างหน้า';

  @override
  String get triageReasonDueWithinThreeDays => 'มันถึงกำหนดภายในสามวัน';

  @override
  String get triageReasonCriticalNoDeadline =>
      'คุณทำเครื่องหมายว่ามันวิกฤต และมันไม่มีกำหนดส่ง';

  @override
  String get triageReasonDueWithinSevenDays => 'มันถึงกำหนดภายในหนึ่งสัปดาห์';

  @override
  String get triageReasonImportant => 'คุณทำเครื่องหมายว่ามันสำคัญ';

  @override
  String get triageReasonDueLater => 'กำหนดส่งของมันยังอยู่อีกไกล';

  @override
  String get triageReasonNoDeadline =>
      'มันไม่มีกำหนดส่ง และยังไม่มีอะไรที่เร่ง';

  @override
  String cardCompletedTooltip(String title) {
    return 'เสร็จแล้ว: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'ทำความเข้าใจเอกสารนี้';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'มันคืออะไร อะไรสำคัญ และต้องทำอะไรกับมันต่อ';

  @override
  String get toolSectionWhatThisIs => 'นี่คืออะไร';

  @override
  String get toolSectionWhatMatters => 'อะไรสำคัญกับคุณ';

  @override
  String get toolSectionKeyDetails => 'รายละเอียดสำคัญ';

  @override
  String get toolTitleAskDocument => 'ถามเกี่ยวกับสิ่งที่บันทึกไว้';

  @override
  String get toolDescriptionAskDocument =>
      'คำตอบที่อิงจากสิ่งที่คุณเลือกเท่านั้น — หรือไม่ตอบเลย';

  @override
  String get toolSectionNoAnswer => 'ไม่มีคำตอบอยู่ในเนื้อหานี้';

  @override
  String get toolSectionNoAnswerBody =>
      'Action หาสิ่งนั้นไม่พบในเอกสารที่คุณเลือก';

  @override
  String get toolSectionAnswer => 'คำตอบ';

  @override
  String get toolSectionFromTheDocument => 'จากในเอกสาร';

  @override
  String get toolWarningQuoteNotFound =>
      'ข้อความที่ยกมาอ้างเบื้องหลังคำตอบนี้ไม่มีอยู่ในเนื้อหาที่คุณเลือก ให้ถือว่าคำตอบนี้เชื่อถือไม่ได้';

  @override
  String get toolTitleSmartSummary => 'สรุป';

  @override
  String get toolDescriptionSmartSummary =>
      'ฉบับย่อ — หรือฉบับที่กระทบกับสิ่งที่คุณต้องทำ';

  @override
  String get toolSectionKeyPoints => 'ประเด็นสำคัญ';

  @override
  String get toolTitleCompareDocuments => 'เปรียบเทียบเอกสาร';

  @override
  String get toolDescriptionCompareDocuments =>
      'อะไรเปลี่ยนไป อะไรขัดแย้งกัน อะไรที่หาไม่พบ';

  @override
  String get toolSectionWhatDiffers => 'อะไรต่างกัน';

  @override
  String get toolSectionConflicts => 'จุดที่ขัดแย้งกัน';

  @override
  String get toolSectionOnlyInOne => 'มีอยู่ในฉบับเดียวเท่านั้น';

  @override
  String get toolSectionInCommon => 'สิ่งที่มีร่วมกัน';

  @override
  String get sensitiveKindEmail => 'ที่อยู่อีเมล';

  @override
  String get sensitiveKindPhone => 'หมายเลขโทรศัพท์';

  @override
  String get sensitiveKindPaymentCard => 'หมายเลขบัตรชำระเงิน';

  @override
  String get sensitiveKindIban => 'บัญชีธนาคาร (IBAN)';

  @override
  String get sensitiveKindNationalId => 'หมายเลขประจำตัวบุคคล';

  @override
  String get sensitiveKindPostcode => 'รหัสไปรษณีย์';

  @override
  String get sensitiveKindAccountNumber => 'หมายเลขบัญชี';

  @override
  String get sensitiveKindReference => 'หมายเลขอ้างอิง';

  @override
  String get sensitiveKindDateOfBirth => 'วันเกิด';

  @override
  String get sensitiveKindUrl => 'ที่อยู่เว็บ';

  @override
  String get verdictVerifiedProvenance => 'มีที่มาที่ตรวจสอบแล้ว';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'ไฟล์นี้มีลายเซ็นดิจิทัลติดมาด้วย และลายเซ็นนั้นถูกตรวจแล้วและผ่าน';

  @override
  String get verdictSignalsSynthetic =>
      'มีสัญญาณที่สอดคล้องกับเนื้อหาที่สร้างด้วย AI';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'ไฟล์นี้ระบุว่าตัวมันเองถูกสร้างด้วยเครื่องมือสร้างเนื้อหา ข้อมูลกำกับไฟล์ถูกแก้ไขหรือลบออกได้ นี่จึงเป็นสิ่งที่ไฟล์อ้าง ไม่ใช่ข้อพิสูจน์';

  @override
  String get verdictSignalsEdited =>
      'มีสัญญาณที่สอดคล้องกับเนื้อหาที่ผ่านการแก้ไข';

  @override
  String get verdictSignalsEditedExplainer =>
      'ไฟล์นี้ระบุว่าตัวมันเองผ่านซอฟต์แวร์แก้ไขภาพมา นั่นเป็นเรื่องธรรมดาสำหรับภาพถ่าย และโดยลำพังแล้วมันไม่ได้แปลว่ามีอะไรถูกปลอมขึ้น';

  @override
  String get verdictNoReliableProvenance => 'ไม่พบข้อมูลที่มาที่เชื่อถือได้';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'ในไฟล์นี้ไม่มีข้อมูลที่มาอยู่เลย นั่นเป็นเรื่องปกติ — บริการส่วนใหญ่ตัดมันออก — และมันไม่ได้บ่งชี้ถึงอะไรทั้งนั้น';

  @override
  String get verdictInconclusive => 'สรุปไม่ได้';

  @override
  String get verdictInconclusiveExplainer =>
      'ข้อมูลที่มีอยู่ตรงนี้ไม่พอจะบอกได้ว่าสิ่งนี้มาจากไหน';

  @override
  String get authenticitySignalCamera => 'กล้อง';

  @override
  String get authenticitySignalSoftware => 'ซอฟต์แวร์';

  @override
  String get authenticitySignalDescription => 'คำอธิบาย';

  @override
  String get authenticitySignalCopyright => 'ลิขสิทธิ์';

  @override
  String get authenticitySignalLocation => 'ตำแหน่งที่ตั้ง';

  @override
  String get authenticitySignalLocationValue =>
      'ในไฟล์นี้มีข้อมูลตำแหน่งที่ตั้งอยู่';

  @override
  String get authenticitySignalContentCredentials =>
      'ข้อมูลรับรองเนื้อหา (Content Credentials)';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'ยังไม่ได้ตรวจ — แอปรุ่นนี้ไม่มีตัวตรวจสอบลายเซ็น';

  @override
  String get authenticitySignalFile => 'ไฟล์';

  @override
  String get authenticitySignalFileUnreadableValue => 'อ่านเป็นรูปภาพไม่ได้';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'ไม่ใช่รูปแบบภาพที่รู้จัก';

  @override
  String get authenticitySignalText => 'ข้อความ';

  @override
  String get authenticitySignalTextValue =>
      'ลำพังข้อความอย่างเดียวบอกไม่ได้อย่างน่าเชื่อถือว่ามีการใช้ AI หรือไม่ Action จึงไม่เดา';

  @override
  String get fileTypePng => 'ภาพ PNG';

  @override
  String get fileTypeJpeg => 'ภาพ JPEG';

  @override
  String get fileTypeGif => 'ภาพ GIF';

  @override
  String get fileTypeWebp => 'ภาพ WebP';

  @override
  String get fileTypeWav => 'ไฟล์เสียง WAV';

  @override
  String get fileTypePdf => 'เอกสาร PDF';

  @override
  String get fileTypeHeic => 'ภาพ HEIC';

  @override
  String get fileTypeVideo => 'ไฟล์วิดีโอ';

  @override
  String get fileTypeTiff => 'ภาพ TIFF';

  @override
  String get fileTypeBitmap => 'ภาพบิตแมป';

  @override
  String get fileTypeRtf => 'เอกสาร RTF';

  @override
  String get fileTypeZip => 'ไฟล์บีบอัด Zip';

  @override
  String get fileTypeGzip => 'ไฟล์บีบอัด gzip';

  @override
  String get fileTypeSevenZip => 'ไฟล์บีบอัด 7-Zip';

  @override
  String get fileTypeRar => 'ไฟล์บีบอัด RAR';

  @override
  String get fileTypeWindowsProgram => 'โปรแกรม Windows';

  @override
  String get fileTypeLinuxProgram => 'โปรแกรม Linux';

  @override
  String get fileTypePostScript => 'เอกสาร PostScript';

  @override
  String get fileTypeOgg => 'ไฟล์เสียง Ogg';

  @override
  String get fileTypeMp3 => 'ไฟล์เสียง MP3';

  @override
  String get fileTypePlainText => 'ข้อความล้วน';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'ไฟล์นี้ชื่อลงท้ายว่า \".$extension\" แต่เนื้อในเป็น$contents นั่นอาจเป็นความผิดพลาดโดยสุจริตก็ได้ และมันก็เป็นวิธีที่ไฟล์หนึ่งจะถูกเปิดด้วยสิ่งอื่นที่ไม่ใช่อย่างที่คุณคาดไว้ด้วย';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ไบต์',
    );
    return '$_temp0';
  }

  @override
  String fileSizeKilobytes(String size) {
    return '$size KB';
  }

  @override
  String fileSizeMegabytes(String size) {
    return '$size MB';
  }

  @override
  String fileSizeGigabytes(String size) {
    return '$size GB';
  }

  @override
  String get credentialKindPrivateKey => 'กุญแจส่วนตัว';

  @override
  String get credentialKindApiKey => 'กุญแจ API';

  @override
  String get credentialKindConnectionString =>
      'สตริงการเชื่อมต่อ (connection string)';

  @override
  String get credentialKindAccessToken => 'โทเคนการเข้าถึง';

  @override
  String get credentialKindAuthorizationHeader => 'เฮดเดอร์ Authorization';

  @override
  String get credentialKindPasswordOrKey => 'รหัสผ่านหรือกุญแจ';

  @override
  String get credentialKindPossibleSecret => 'สิ่งที่อาจเป็นความลับ';

  @override
  String get credentialAdvicePrivateKey =>
      'นำสิ่งนี้ออกก่อนแชร์ และเปลี่ยนคู่กุญแจชุดนั้นใหม่ กุญแจส่วนตัวที่ถูกมองเห็นแล้ว ไม่มีทางทำให้กลับมาปลอดภัยได้อีก';

  @override
  String get credentialAdviceProviderApiKey =>
      'เพิกถอนกุญแจนี้กับผู้ให้บริการ แล้วออกกุญแจใหม่ การนำมันออกจากเอกสารไม่ได้ทำให้มันใช้งานไม่ได้';

  @override
  String get credentialAdviceConnectionString =>
      'สิ่งนี้มีทั้งรหัสผ่านและที่อยู่ที่รหัสผ่านนั้นเปิดเข้าไปได้ ถ้ามันถูกแชร์ออกไปแล้ว ให้เปลี่ยนรหัสผ่าน';

  @override
  String get credentialAdviceJsonWebToken =>
      'โทเคนแบบนี้มักหมดอายุ แต่ไม่เสมอไป ให้ถือว่ามันยังใช้งานได้อยู่ เว้นแต่คุณรู้ว่ามันหมดอายุเมื่อไร';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'นำค่าของเฮดเดอร์ออก ล็อกคำขอที่วางต่อ ๆ กันมาเป็นหนึ่งในช่องทางที่พบบ่อยที่สุดที่โทเคนซึ่งยังใช้งานได้จะหลุดออกไปโดยไม่ตั้งใจ';

  @override
  String get credentialAdviceKeyedAssignment =>
      'ย้ายสิ่งนี้ไปไว้ในตัวแปรสภาพแวดล้อม (environment variable) หรือในที่เก็บความลับ (secret store) และเปลี่ยนค่านั้นถ้าไฟล์นี้ถูกแชร์ออกไปแล้ว';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action บอกไม่ได้ว่าสิ่งนี้คืออะไร ตรวจดูก่อนแชร์ — มันอาจเป็นตัวระบุหรือค่าตรวจสอบความถูกต้อง (checksum) ก็ได้พอ ๆ กัน';

  @override
  String get credentialLabelAnthropicApiKey => 'กุญแจ API ของ Anthropic';

  @override
  String get credentialLabelOpenAiProjectKey => 'กุญแจโปรเจกต์ของ OpenAI';

  @override
  String get credentialLabelOpenAiStyleApiKey =>
      'กุญแจ API รูปแบบเดียวกับของ OpenAI';

  @override
  String get credentialLabelGoogleApiKey => 'กุญแจ API ของ Google';

  @override
  String get credentialLabelGoogleOAuthToken => 'โทเคน OAuth ของ Google';

  @override
  String get credentialLabelGitHubToken => 'โทเคน GitHub';

  @override
  String get credentialLabelSlackToken => 'โทเคน Slack';

  @override
  String get credentialLabelAwsAccessKeyId =>
      'กุญแจการเข้าถึงของ AWS (access key ID)';

  @override
  String get credentialLabelGitLabToken => 'โทเคน GitLab';

  @override
  String get credentialLabelNpmToken => 'โทเคน npm';

  @override
  String get credentialLabelPassphrase => 'วลีรหัสผ่าน';

  @override
  String get credentialLabelPassword => 'รหัสผ่าน';

  @override
  String get credentialLabelRefreshToken => 'โทเค็นรีเฟรช';

  @override
  String get credentialLabelToken => 'โทเค็น';

  @override
  String get credentialLabelClientSecret => 'รหัสลับไคลเอนต์';

  @override
  String get credentialLabelCredential => 'ข้อมูลรับรองการเข้าถึง';

  @override
  String get credentialLabelSecret => 'ค่าลับ';

  @override
  String get linkVerdictNoObviousSignals => 'ไม่พบสัญญาณที่เห็นได้ชัด';

  @override
  String get linkVerdictWorthChecking => 'ควรตรวจดูสักหน่อย';

  @override
  String get linkVerdictTreatWithCaution => 'ใช้ความระมัดระวัง';

  @override
  String get linkSummaryNoObviousSignals =>
      'ไม่มีอะไรผิดปกติในวิธีเขียนลิงก์นี้ นั่นไม่เท่ากับการรู้ว่าหน้าเว็บนั้นน่าเชื่อถือ — มีเพียงคุณเท่านั้นที่ตัดสินได้ว่าคุณคาดหมายลิงก์นี้ไว้หรือไม่';

  @override
  String get linkSummaryWorthChecking =>
      'มีสิ่งหนึ่งเกี่ยวกับลิงก์นี้ที่ควรดูให้ดีก่อนคุณจะเปิดมัน';

  @override
  String get linkSummaryTreatWithCaution =>
      'มีหลายสิ่งในวิธีเขียนลิงก์นี้ที่ควรตรวจดูก่อนคุณจะเปิดมัน';

  @override
  String get linkSignalNotHttps => 'ไม่ได้เข้ารหัส';

  @override
  String get linkSignalNonWebScheme => 'ไม่ใช่ลิงก์เว็บ';

  @override
  String get linkSignalEmbeddedCredentials => 'มีรหัสผ่านอยู่ในลิงก์';

  @override
  String get linkSignalMisleadingAuthority => 'ที่อยู่จริงถูกซ่อนไว้';

  @override
  String get linkSignalIpLiteralHost => 'ที่อยู่เป็นตัวเลข';

  @override
  String get linkSignalPunycodeHost => 'อักขระเข้ารหัสในชื่อ';

  @override
  String get linkSignalMixedScriptHost => 'ชื่อผสมหลายระบบตัวอักษร';

  @override
  String get linkSignalEncodedHost => 'อักขระหลีกในชื่อ';

  @override
  String get linkSignalUnusualPort => 'พอร์ตที่ไม่ใช่ค่าปกติ';

  @override
  String get linkSignalDeepSubdomain => 'ชื่อมีหลายส่วน';

  @override
  String get linkSignalPublicSuffixInSubdomain => 'ชื่อที่คุ้นตาอยู่ผิดที่';

  @override
  String get linkSignalShortener => 'ลิงก์แบบย่อ';

  @override
  String get linkSignalExecutableTarget => 'ดาวน์โหลดโปรแกรม';

  @override
  String get linkSignalRedirectParameter => 'พาคุณต่อไปที่อื่น';

  @override
  String get linkSignalVeryLongUrl => 'ยาวมาก';

  @override
  String get linkSignalUnparseable => 'อ่านเป็นลิงก์ไม่ได้';

  @override
  String get linkDetailNotHttps =>
      'ลิงก์นี้ใช้ http สิ่งที่คุณพิมพ์ลงในหน้านั้นจึงถูกอ่านได้ระหว่างทาง';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'สิ่งนี้เปิดด้วย “$scheme:” แทนที่จะเป็นหน้าเว็บ มันอาจขอให้แอปอื่นทำบางอย่าง';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'ชื่อผู้ใช้และรหัสผ่านถูกเขียนไว้ในลิงก์นี้ ลิงก์นี้ถูกแชร์ไปที่ใด ทั้งสองอย่างก็ไปที่นั่นด้วย';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'ทุกอย่างที่อยู่ก่อน “@” ถูกเบราว์เซอร์มองข้าม ปลายทางจริงคือ “$host”';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'ลิงก์นี้ไปที่ “$host” — เป็นที่อยู่ดิบ ไม่ใช่ชื่อ เว็บไซต์ที่ถูกต้องแทบทุกแห่งใช้ชื่อ';
  }

  @override
  String get linkDetailPunycodeHost =>
      'ชื่อเว็บไซต์มีอักขระที่ไม่ใช่อักษรละติน และถูกเก็บไว้ในรูปแบบเข้ารหัส นี่เป็นเรื่องปกติสำหรับหลายภาษา และก็เป็นวิธีที่ทำให้ชื่อหนึ่งดูเหมือนอีกชื่อที่คุ้นตาได้เช่นกัน';

  @override
  String get linkDetailMixedScriptHost =>
      'ชื่อเว็บไซต์ผสมอักษรละตินกับตัวอักษรจากอีกระบบหนึ่งที่หน้าตาเหมือนกัน อ่านมันทีละตัวอักษร';

  @override
  String get linkDetailEncodedHost =>
      'ชื่อเว็บไซต์มีรหัสหลีกอยู่ ซึ่งไม่ใช่ที่ของมัน รหัสเหล่านี้ปิดบังสิ่งที่ชื่อนั้นเขียนไว้จริงได้';

  @override
  String linkDetailUnusualPort(String port) {
    return 'ลิงก์นี้เชื่อมต่อที่พอร์ต $port แทนพอร์ตปกติ ซึ่งพบได้ทั่วไปกับเซิร์ฟเวอร์ทดสอบ และไม่ค่อยพบกับเว็บไซต์สาธารณะ';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'ชื่อนี้มี $count ส่วน มีเพียงสองส่วนท้ายเท่านั้นที่กำหนดว่าใครเป็นผู้ดูแลเว็บไซต์ ส่วนที่เหลือตั้งเป็นอะไรก็ได้',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'ชื่อนี้มี “.$suffix.” อยู่ตรงกลาง ซึ่งทำให้ส่วนต้นดูเหมือนเป็นตัวเว็บไซต์ แต่เว็บไซต์จริง ๆ คือ “$host”';
  }

  @override
  String get linkDetailShortener =>
      'บริการย่อลิงก์บังปลายทางจริงเอาไว้ คุณบอกไม่ได้ว่าลิงก์นี้ไปที่ไหนโดยไม่เปิดมัน';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'ลิงก์นี้ลงท้ายด้วย “$fileExtension” จึงเป็นการดาวน์โหลดสิ่งที่รันบนเครื่องของคุณได้ ไม่ใช่หน้าเว็บให้อ่าน';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'ลิงก์นี้พาที่อยู่อีกแห่งหนึ่งมาด้วยในค่า “$parameter” การเปิดมันจึงอาจพาคุณไปที่อื่นที่ไม่ใช่ “$host”';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'ลิงก์ที่ยาวอ่านยากกว่า และส่วนที่กำหนดปลายทางอาจถูกดันจนพ้นสายตาได้';

  @override
  String get linkDetailUnparseable =>
      'Action อ่านสิ่งนี้เป็นที่อยู่เว็บไม่ได้ ระวังลิงก์ที่ไม่ดูเหมือนลิงก์';

  @override
  String get toolTitleRedaction => 'ซ่อนรายละเอียดอ่อนไหว';

  @override
  String get toolDescriptionRedaction =>
      'หาสิ่งที่ไม่ควรแชร์ออกมา แล้วทำสำเนาที่เอาสิ่งเหล่านั้นออก';

  @override
  String get toolSectionRedactionNothingToScan => 'ไม่มีอะไรให้สแกน';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'เครื่องมือนี้อ่านข้อความ เลือกโน้ต ข้อความที่วางไว้ หรือสิ่งที่บันทึกไว้ซึ่งอ่านข้อความออกมาแล้ว';

  @override
  String get toolSectionRedactionNothingFound => 'ไม่พบสิ่งที่เห็นได้ชัด';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action ไม่พบที่อยู่อีเมล หมายเลขโทรศัพท์ หมายเลขบัตร หรือเลขอ้างอิงในข้อความนี้';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count สิ่งที่ควรซ่อน',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'สำเนาที่ตัดข้อมูลออกแล้ว';

  @override
  String get toolWarningRedactionCoverage =>
      'เครื่องมือนี้หารูปแบบอย่างอีเมล หมายเลขโทรศัพท์ และหมายเลขบัญชี มันจะไม่จับทุกสิ่งที่อ่อนไหวได้ — อ่านสำเนานั้นก่อนคุณจะแชร์';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action ตัดข้อมูลออกจากรูปภาพหรือไฟล์ PDF ไม่ได้ การบังบางอย่างในภาพจะทิ้งต้นฉบับไว้ข้างใต้ จึงไม่มีตัวเลือกนี้ให้';

  @override
  String get toolTitleAuthenticity => 'ตรวจว่าสิ่งนี้มาจากไหน';

  @override
  String get toolDescriptionAuthenticity =>
      'สิ่งที่ไฟล์ประกาศไว้เองเกี่ยวกับที่มาของมัน';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'ไม่มีอะไรให้ตรวจดู';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'เลือกรูปภาพหรือข้อความสักท่อน';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'สิ่งที่ไฟล์นี้บอกเกี่ยวกับตัวมันเอง';

  @override
  String get toolSectionAuthenticityFileItself => 'ตัวไฟล์เอง';

  @override
  String get toolSectionFileContents => 'เนื้อหา';

  @override
  String get toolSectionFileUnknownFormat => 'ไม่ใช่รูปแบบที่ Action รู้จัก';

  @override
  String get toolSectionFileSize => 'ขนาด';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'สิ่งนี้รายงานสิ่งที่ไฟล์ประกาศเกี่ยวกับตัวมันเอง เมตาดาตาถูกแก้ไขหรือถูกลบทิ้งได้ ไม่มีข้อใดเป็นหลักฐานพิสูจน์ อย่าใช้สิ่งนี้กล่าวหาใคร';

  @override
  String get toolTitleCredentialScanner => 'ตรวจหาคีย์และรหัสผ่าน';

  @override
  String get toolDescriptionCredentialScanner =>
      'หาข้อมูลรับรองการเข้าถึงก่อนที่คุณจะแชร์อะไรออกไป';

  @override
  String get toolSectionCredentialNothingToCheck => 'ไม่มีอะไรให้ตรวจสอบ';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'วางข้อความสักท่อน หรือเลือกสิ่งที่บันทึกไว้ซึ่งอ่านข้อความออกมาแล้ว เครื่องมือนี้อ่านได้เฉพาะข้อความ';

  @override
  String get toolSectionCredentialNoneFound => 'ไม่พบข้อมูลรับรองการเข้าถึง';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action ไม่พบสิ่งที่มีรูปร่างแบบกุญแจ API กุญแจส่วนตัว โทเค็น หรือรหัสผ่าน ในข้อความนี้';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'พบข้อมูลรับรองการเข้าถึง $count รายการ',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count สิ่งที่อาจเป็นค่าลับ',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'สำเนาที่เอาข้อมูลรับรองการเข้าถึงออกแล้ว';

  @override
  String get toolWarningCredentialRevoke =>
      'การเอากุญแจออกจากเอกสารไม่ได้ทำให้มันใช้ไม่ได้ ถ้าสิ่งใดในนี้ถูกแชร์ออกไปแล้ว ให้เพิกถอนมันกับผู้ให้บริการ แล้วออกอันใหม่';

  @override
  String get toolWarningCredentialCoverage =>
      'เครื่องมือนี้หาข้อมูลรับรองการเข้าถึงที่มีรูปร่างพอจะจดจำได้ รหัสผ่านที่เขียนออกมาเป็นประโยคจะไม่ถูกพบ ดังนั้นอ่านข้อความเองด้วย';

  @override
  String get toolTitleLinkInspector => 'ตรวจสอบลิงก์';

  @override
  String get toolDescriptionLinkInspector =>
      'สิ่งที่ที่อยู่หนึ่งเผยออกมาก่อนคุณจะเปิดมัน';

  @override
  String get toolSectionLinkNoneFound => 'ไม่พบลิงก์';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'วางลิงก์ หรือเลือกสิ่งที่บันทึกไว้ซึ่งมีลิงก์อยู่';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลิงก์ $count รายการในข้อความนี้',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'อ่านไม่ได้';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'ไม่มีอะไรผิดปกติในวิธีเขียนลิงก์เหล่านี้';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'นั่นไม่เท่ากับการรู้ว่าหน้าเว็บเหล่านั้นน่าเชื่อถือ มีเพียงคุณเท่านั้นที่ตัดสินได้ว่าคุณคาดหมายลิงก์เหล่านี้ไว้หรือไม่';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action อ่านเฉพาะที่อยู่เท่านั้น มันไม่เปิดลิงก์ ไม่ค้นหาข้อมูลของเว็บไซต์ และไม่ตรวจกับบริการจัดอันดับความน่าเชื่อถือใด ๆ — การทำเช่นนั้นจะส่งร่องรอยการท่องเว็บของคุณไปที่อื่น';

  @override
  String get toolWarningLinkNoSignals =>
      'ลิงก์ที่ไม่มีสัญญาณใดเลยก็ยังเป็นอันตรายได้ เครื่องมือนี้หาปัญหาในวิธีเขียนที่อยู่ ซึ่งไม่ใช่ทั้งหมดที่ควรรู้เกี่ยวกับว่ามันพาไปที่ไหน';

  @override
  String get toolSectionObjective => 'สิ่งที่คุณต้องการ';

  @override
  String get toolSectionCurrentState => 'สถานะของเป้าหมายตอนนี้';

  @override
  String get toolSectionRecommendedNextStep => 'ขั้นตอนถัดไปที่แนะนำ';

  @override
  String get toolSectionCredentialAdvice => 'สิ่งที่ควรทำ';

  @override
  String get toolSectionSummary => 'บทสรุป';

  @override
  String get toolDetailSeparator => ' · ';
}
