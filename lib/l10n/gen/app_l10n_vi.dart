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

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'Vừa xong';

  @override
  String relativeMinutes(int count) {
    return '$count phút trước';
  }

  @override
  String relativeHours(int count) {
    return '$count giờ trước';
  }

  @override
  String get relativeYesterday => 'Hôm qua';

  @override
  String relativeDays(int count) {
    return '$count ngày trước';
  }

  @override
  String get libraryTitle => 'Thư viện';

  @override
  String get librarySubtitle =>
      'Mọi thứ Action đang giữ cho bạn. Và tất cả đều ở lại trên thiết bị này.';

  @override
  String get librarySegmentActions => 'Việc';

  @override
  String get librarySegmentCaptures => 'Đã thu nhận';

  @override
  String get librarySegmentGoals => 'Mục tiêu';

  @override
  String get librarySegmentDone => 'Xong';

  @override
  String get libraryNewGoal => 'Mục tiêu mới';

  @override
  String get libraryNoGoalsTitle => 'Chưa có mục tiêu nào';

  @override
  String get libraryNoGoalsMessage =>
      'Mục tiêu là điều bạn muốn xảy ra. Action có thể tìm ra cái gì còn thiếu, cái gì đang cản, và nên làm gì trước.';

  @override
  String get libraryNoDoneTitle => 'Chưa hoàn thành gì';

  @override
  String get libraryNoDoneMessage =>
      'Những việc bạn làm xong sẽ được giữ ở đây.';

  @override
  String get libraryNoOpenTitle => 'Không có việc nào đang mở';

  @override
  String get libraryNoOpenMessage =>
      'Thu nhận thứ gì đó và Action sẽ tìm ra việc cần làm.';

  @override
  String get libraryNoCapturesTitle => 'Chưa thu nhận gì';

  @override
  String get libraryNoCapturesMessage =>
      'Ảnh, ảnh màn hình và văn bản bạn thêm vào sẽ đến đây trước. Không có gì được phân tích cho tới khi bạn yêu cầu.';

  @override
  String get libraryGoalNoActions => 'Chưa có gì ra đời từ nó';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count việc từ mục tiêu này',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Tìm trong việc và mục đã thu nhận';

  @override
  String get searchClear => 'Xoá';

  @override
  String get searchPrivacyNote =>
      'Tìm ngay trên thiết bị này. Không có gì bạn gõ ở đây rời khỏi máy.';

  @override
  String get searchYouCanSearch => 'BẠN CÓ THỂ TÌM';

  @override
  String get searchFieldTitles => 'Tiêu đề';

  @override
  String get searchFieldTitlesExample => 'Gia hạn bảo hiểm xe';

  @override
  String get searchFieldReferences => 'Số tham chiếu';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Tổ chức';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Bước bên trong một việc';

  @override
  String get searchFieldStepsExample => 'Tải biểu mẫu lên';

  @override
  String get searchFieldCaptureText => 'Văn bản đọc được từ mục đã thu nhận';

  @override
  String get searchFieldCaptureTextExample => 'thông báo gia hạn';

  @override
  String searchNoMatchesTitle(String query) {
    return 'Không có kết quả cho \"$query\"';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Thử ít từ hơn, hoặc nhập số tham chiếu đúng như nó hiện ra.';

  @override
  String get searchNoMatchesClearFilters => 'Thử ít từ hơn, hoặc xoá bộ lọc.';

  @override
  String get searchFilterActive => 'Đang mở';

  @override
  String get searchFilterCompleted => 'Đã xong';

  @override
  String get searchFilterOverdue => 'Quá hạn';

  @override
  String get searchFilterThisWeek => 'Tuần này';

  @override
  String get searchFilterCritical => 'Rất quan trọng';

  @override
  String get searchFilterCreatedByYou => 'Bạn tự tạo';

  @override
  String get searchFilterArchived => 'Đã lưu trữ';

  @override
  String get searchFilterClear => 'Xoá bộ lọc';

  @override
  String get searchIncompleteActions =>
      'Không tìm được trong các việc của bạn, nên kết quả này có thể chưa đầy đủ.';

  @override
  String get searchIncompleteCaptures =>
      'Không tìm được trong các mục đã thu nhận, nên kết quả này có thể chưa đầy đủ.';

  @override
  String get searchIncompleteBoth =>
      'Không tìm được trong cả việc lẫn mục đã thu nhận, nên kết quả này có thể chưa đầy đủ.';

  @override
  String get searchMatchTitle => 'Tiêu đề';

  @override
  String get searchMatchNextStep => 'Bước tiếp theo';

  @override
  String get searchMatchStep => 'Bước';

  @override
  String get searchMatchSummary => 'Tóm tắt';

  @override
  String get searchMatchFromCapture => 'Từ mục đã thu nhận';

  @override
  String get studioSuggested => 'Gợi ý cho mục bạn thu nhận gần nhất';

  @override
  String get studioRecentlyUsed => 'Dùng gần đây';

  @override
  String get studioReady => 'SẴN SÀNG';

  @override
  String get studioNotConnected => 'CHƯA KẾT NỐI';

  @override
  String get studioHeroTitle => 'Trí tuệ Action';

  @override
  String get studioConnectedBlurb =>
      'Hiểu một tài liệu, mài sắc một mục tiêu, dựng một kế hoạch, soạn một câu trả lời, hoặc kiểm tra thứ đang ở trước mặt bạn.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count công cụ để hiểu tài liệu, lập kế hoạch và viết. Kết nối tài khoản AI của riêng bạn để dùng — nhà cung cấp của bạn tính phí, Action thì không bao giờ.';
  }

  @override
  String get studioConnectAi => 'Kết nối AI';

  @override
  String get studioHowItWorks => 'Cách hoạt động';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count trong số đó đã chạy được mà không cần bất cứ thứ nào trong đó, hoàn toàn trên thiết bị này.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'Chạy trên thiết bị này';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description Chạy trên thiết bị này.';
  }

  @override
  String get categoryUnderstand => 'Hiểu';

  @override
  String get categoryUnderstandBlurb => 'Nắm được ý nghĩa của thứ bạn đang có.';

  @override
  String get categoryPlan => 'Lập kế hoạch';

  @override
  String get categoryPlanBlurb => 'Biến nó thành thứ bạn có thể làm.';

  @override
  String get categoryCreate => 'Viết';

  @override
  String get categoryCreateBlurb => 'Viết, chỉnh, dịch.';

  @override
  String get categoryExtract => 'Trích xuất';

  @override
  String get categoryExtractBlurb => 'Rút ra những chi tiết quan trọng.';

  @override
  String get categoryVerify => 'Kiểm tra';

  @override
  String get categoryVerifyBlurb => 'Kiểm tra thứ đang ở trước mặt bạn.';

  @override
  String get captureSheetTitle => 'Thu nhận thứ gì đó';

  @override
  String get captureSheetSubtitle =>
      'Đưa cho Action bất cứ thứ gì bạn không muốn đọc hết.';

  @override
  String get captureTakePhoto => 'Chụp ảnh';

  @override
  String get captureTakePhotoSubtitle =>
      'Một lá thư, hoá đơn hay thông báo trước mặt bạn';

  @override
  String get captureChooseImage => 'Chọn ảnh';

  @override
  String get captureChooseImageSubtitle =>
      'Ảnh màn hình hoặc ảnh đã có sẵn trên thiết bị này';

  @override
  String get capturePasteText => 'Dán văn bản';

  @override
  String get capturePasteTextSubtitle => 'Một email, tin nhắn hay thông báo';

  @override
  String get captureChoosePdf => 'Chọn PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'Sao kê, thư từ hay biểu mẫu bạn đã có';

  @override
  String get captureFootnote =>
      'Mục đã thu nhận ở lại trên thiết bị này. Không có gì được phân tích trực tuyến cho tới khi bạn yêu cầu.';

  @override
  String get captureCouldNotOpen => 'Không mở được thứ đó. Hãy thử cách khác.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'Đang đọc';

  @override
  String get stageNeedsReview => 'Cần xem lại';

  @override
  String get stageActionCreated => 'Đã tạo việc';

  @override
  String get stageNoText => 'Không tìm thấy văn bản';

  @override
  String get stageCouldNotBeRead => 'Không đọc được';

  @override
  String get stageReadingPreview => 'Đang đọc văn bản…';

  @override
  String get stageFailedPreview => 'Không đọc được thứ này trên thiết bị.';

  @override
  String get provenancePhoto => 'Thu nhận từ ảnh chụp';

  @override
  String get provenanceImage => 'Thu nhận từ hình ảnh';

  @override
  String get provenancePastedText => 'Thu nhận từ văn bản dán vào';

  @override
  String get provenanceDocument => 'Thêm vào dưới dạng tài liệu';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Xong $when';
  }

  @override
  String metaOverdue(String date) {
    return 'Quá hạn · hạn là $date';
  }

  @override
  String get metaDueToday => 'Hạn hôm nay';

  @override
  String metaDueOn(String date) {
    return 'Hạn $date';
  }

  @override
  String get metaCreatedByYou => 'Bạn tự tạo';

  @override
  String get categoryPayment => 'Thanh toán';

  @override
  String get categoryRenewal => 'Gia hạn';

  @override
  String get categoryAppointment => 'Hẹn gặp';

  @override
  String get categoryBooking => 'Đặt chỗ';

  @override
  String get categoryTravel => 'Đi lại';

  @override
  String get categoryDeadline => 'Hạn chót';

  @override
  String get categoryResponse => 'Cần trả lời';

  @override
  String get categoryDelivery => 'Giao hàng';

  @override
  String get categoryDocument => 'Tài liệu';

  @override
  String get categoryNoActionRequired => 'Không cần làm gì';

  @override
  String get categoryUnsure => 'Chưa rõ';

  @override
  String get errorEnterManually => 'Tự nhập vào';
}
