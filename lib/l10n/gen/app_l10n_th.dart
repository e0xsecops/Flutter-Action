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
}
