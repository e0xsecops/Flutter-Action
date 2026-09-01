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
}
