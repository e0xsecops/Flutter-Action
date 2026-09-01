// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppL10nVi extends AppL10n {
  AppL10nVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'Huỷ';

  @override
  String get commonDone => 'Xong';

  @override
  String get commonSave => 'Lưu';

  @override
  String get commonClose => 'Đóng';

  @override
  String get commonBack => 'Quay lại';

  @override
  String get commonRetry => 'Thử lại';

  @override
  String get commonDelete => 'Xoá';

  @override
  String get commonRemove => 'Bỏ ra';

  @override
  String get commonContinue => 'Tiếp tục';

  @override
  String get commonOpen => 'Mở';

  @override
  String get commonCopy => 'Sao chép';

  @override
  String get commonCopied => 'Đã sao chép';

  @override
  String get commonEdit => 'Sửa';

  @override
  String get commonAdd => 'Thêm';

  @override
  String get commonOn => 'Bật';

  @override
  String get commonOff => 'Tắt';

  @override
  String get commonUnknown => 'Không rõ';

  @override
  String get commonChecking => 'Đang kiểm tra…';

  @override
  String get commonSettings => 'Cài đặt';

  @override
  String get commonDismiss => 'Bỏ qua';

  @override
  String get commonUndo => 'Hoàn tác';

  @override
  String get commonSkip => 'Bỏ qua bước này';

  @override
  String get commonNotNow => 'Để sau';

  @override
  String get commonSomethingWentWrong => 'Đã có lỗi xảy ra.';

  @override
  String get navToday => 'Hôm nay';

  @override
  String get navLibrary => 'Thư viện';

  @override
  String get navIntelligence => 'Trí tuệ';

  @override
  String get navSearch => 'Tìm kiếm';

  @override
  String get navCapture => 'Thu nhận thứ gì đó';

  @override
  String get todayGreetingMorning => 'Chào buổi sáng';

  @override
  String get todayGreetingAfternoon => 'Chào buổi chiều';

  @override
  String get todayGreetingEvening => 'Chào buổi tối';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'Không tải được các việc của bạn. Chúng vẫn được lưu trên thiết bị này.';

  @override
  String get todaySectionNeedsAttention => 'Cần bạn để ý';

  @override
  String get todaySectionAlsoNeedsAttention => 'Cũng cần bạn để ý';

  @override
  String get todaySectionWaitingForReview => 'Đang chờ xem lại';

  @override
  String get todaySectionComingUp => 'Sắp tới';

  @override
  String todaySeeAllCaptures(int count) {
    return 'Xem tất cả $count mục đã thu nhận';
  }

  @override
  String get todaySeeAllInLibrary => 'Xem tất cả trong Thư viện';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Xong $count',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã hoàn thành $count việc. Mở thư viện.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'BẮT ĐẦU VỚI';

  @override
  String get todayQuickPhoto => 'Ảnh';

  @override
  String get todayQuickScreenshot => 'Ảnh màn hình';

  @override
  String get todayQuickText => 'Văn bản';

  @override
  String get todayQuickTools =>
      'Kiểm tra một liên kết, hoặc tìm khoá trong một đoạn văn bản';

  @override
  String get briefBadgeNeedsYou => 'CẦN BẠN';

  @override
  String get briefBadgeToReview => 'CẦN XEM LẠI';

  @override
  String get briefBadgeAhead => 'PHÍA TRƯỚC';

  @override
  String get briefBadgeStartHere => 'BẮT ĐẦU Ở ĐÂY';

  @override
  String get briefBadgeClear => 'TRỐNG';

  @override
  String get briefNext => 'TIẾP THEO';

  @override
  String briefOpenAction(String title) {
    return 'Mở $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'Đánh dấu \"$title\" là đã xong';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count việc cần bạn để ý',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mục đã thu nhận cũng đang chờ xem lại.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mục đã thu nhận đang chờ bạn',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'Không có gì quá hạn.';

  @override
  String get briefHeadlineNothingToday => 'Hôm nay không có gì cần bạn';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count việc sắp tới.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'Bạn đã xong hết';

  @override
  String get briefDetailClear => 'Không có gì đến hạn và không có gì đang chờ.';

  @override
  String get briefHeadlineFirstRun => 'Bắt đầu với bất cứ thứ gì';

  @override
  String get briefDetailFirstRun =>
      'Một lá thư, một ảnh màn hình, một ghi chú — Action sẽ nhận ra đó là gì.';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get settingsSectionPersonalise => 'Cá nhân hoá';

  @override
  String get settingsAppearance => 'Giao diện';

  @override
  String get settingsAppearanceDescription => 'Sáng, tối, hoặc theo thiết bị.';

  @override
  String get settingsLanguageDescription =>
      'Ngôn ngữ Action dùng để nói với bạn.';

  @override
  String get appearanceSystem => 'Theo hệ thống';

  @override
  String get appearanceLight => 'Sáng';

  @override
  String get appearanceDark => 'Tối';

  @override
  String get appearanceSystemDescription => 'Theo cài đặt của thiết bị';

  @override
  String get appearanceLightDescription => 'Luôn sáng';

  @override
  String get appearanceDarkDescription => 'Luôn tối';

  @override
  String get languageTitle => 'Ngôn ngữ';

  @override
  String get languageSubtitle =>
      'Thay đổi có hiệu lực ngay. Không có gì được gửi đi đâu cả; lựa chọn được lưu trên thiết bị này.';

  @override
  String get languageSectionChoose => 'Chọn ngôn ngữ';

  @override
  String get languageSystem => 'Theo hệ thống';

  @override
  String get languageSystemDescription => 'Theo ngôn ngữ của thiết bị';

  @override
  String get languageDraftNote =>
      'Tiếng Anh là ngôn ngữ mà nội dung của Action được viết ra. Các bản dịch khác được soạn theo một bảng thuật ngữ cố định và đã được kiểm tra tự động, nhưng chưa có người bản ngữ đọc lại. Ở những chỗ mà cách diễn đạt chính xác là quan trọng — quyền riêng tư, bảo mật, điều Action khẳng định và điều Action không khẳng định — tiếng Anh vẫn là bản tham chiếu.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action vẫn dùng được khi không có AI. Kết nối nhà cung cấp của riêng bạn sẽ thêm các công cụ phân tích tài liệu, lập kế hoạch và soạn thảo.';

  @override
  String get settingsAiProvider => 'Nhà cung cấp AI';

  @override
  String get settingsAiNotConnected =>
      'Chưa kết nối. Dùng tài khoản và khoá API của riêng bạn.';

  @override
  String settingsAiConnected(String provider) {
    return 'Đã kết nối với $provider.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'Quyền riêng tư & bảo mật';

  @override
  String get settingsSecurity => 'Bảo mật';

  @override
  String get settingsWhereInfoLives => 'Thông tin của bạn nằm ở đâu';

  @override
  String get settingsWhereInfoLivesDescription =>
      'Cái gì ở lại trên thiết bị này, và cái gì thì không.';

  @override
  String get protectionAppLock => 'Khoá ứng dụng';

  @override
  String get protectionScreenPrivacy => 'riêng tư màn hình';

  @override
  String get protectionPrivateReminders => 'nhắc nhở ẩn nội dung';

  @override
  String get protectionSummaryNone =>
      'Khoá ứng dụng, riêng tư màn hình, và những gì rời khỏi thiết bị này.';

  @override
  String protectionSummaryOne(String first) {
    return '$first đang bật.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first và $second đang bật.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second và $third đang bật.';
  }

  @override
  String get settingsSectionReminders => 'Nhắc nhở';

  @override
  String get settingsRemindersFootnote =>
      'Android có thể hiển thị nhắc nhở muộn hơn giờ bạn đặt một chút, tuỳ vào cài đặt pin và cách thiết bị đang được dùng.';

  @override
  String get settingsNotifications => 'Thông báo';

  @override
  String get settingsNotificationsOnDescription =>
      'Các nhắc nhở bạn đặt có thể được hiển thị.';

  @override
  String get settingsNotificationsOffDescription =>
      'Đang tắt cho Action, nên nhắc nhở sẽ không xuất hiện.';

  @override
  String get settingsNotificationsUnknown => 'Không kiểm tra được.';

  @override
  String get settingsNotificationsAllowed => 'Được phép';

  @override
  String get settingsOpenSystemSettings => 'Mở cài đặt';

  @override
  String get settingsActionFootnote =>
      'Action biến mớ thông tin lộn xộn thành những bước tiếp theo rõ ràng. Bạn xác nhận mọi thứ trước khi nó được lưu.';

  @override
  String get settingsHelp => 'Trợ giúp';

  @override
  String get settingsHelpDescription =>
      'Action hoạt động thế nào, và sẽ không làm gì.';

  @override
  String get settingsVersion => 'Phiên bản';
}
