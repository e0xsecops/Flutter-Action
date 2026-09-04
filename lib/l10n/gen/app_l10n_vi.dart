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
  String get ocrScriptTitle => 'Nhận dạng chữ';

  @override
  String get ocrScriptSubtitle =>
      'Hệ chữ viết mà Action đọc khi nhìn vào một tấm ảnh. Việc nhận dạng diễn ra trên thiết bị này; không có thứ gì thu nhận được gửi đi đâu để đọc.';

  @override
  String get ocrScriptSectionChoose => 'Hệ chữ viết';

  @override
  String get ocrScriptFollowLanguage => 'Theo ngôn ngữ của ứng dụng';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'Hiện là $script';
  }

  @override
  String get ocrScriptLatin => 'La-tinh';

  @override
  String get ocrScriptChinese => 'Trung';

  @override
  String get ocrScriptDevanagari => 'Devanagari';

  @override
  String get ocrScriptJapanese => 'Nhật';

  @override
  String get ocrScriptKorean => 'Hàn';

  @override
  String get ocrScriptLatinDescription =>
      'Tiếng Anh, Tây Ban Nha, Pháp, Đức và các thứ tiếng khác viết bằng chữ cái La-tinh.';

  @override
  String get ocrScriptChineseDescription => 'Chữ Trung giản thể và phồn thể.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Tiếng Hindi, Marathi và Nepal. Không phải Bengal, Tamil hay Telugu — mỗi thứ tiếng đó dùng một hệ chữ viết khác.';

  @override
  String get ocrScriptJapaneseDescription => 'Tiếng Nhật.';

  @override
  String get ocrScriptKoreanDescription => 'Tiếng Hàn.';

  @override
  String get ocrScriptFootnote =>
      'Mọi lựa chọn ngoài La-tinh đều đọc được cả chữ cái La-tinh, nên chọn một hệ là thêm vào chứ không phải đánh đổi. Thay đổi này áp dụng cho ảnh chụp từ giờ trở đi, không áp dụng cho ảnh đã đọc.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action không đọc được hệ chữ $language';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'Trên thiết bị không có bộ nhận dạng cho hệ chữ đó. Ảnh vẫn được đọc với mọi phần viết bằng chữ cái La-tinh, phần còn lại sẽ trả về rỗng. Bạn có thể gõ hoặc dán phần chữ đó thay thế.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action đang được đặt để đọc $script. Nếu ảnh này dùng hệ chữ khác, hãy đổi trong Cài đặt rồi đọc lại.';
  }

  @override
  String get settingsTextRecognition => 'Nhận dạng chữ';

  @override
  String get settingsTextRecognitionDescription =>
      'Hệ chữ viết mà Action đọc từ ảnh.';

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

  @override
  String get sourceWhatWeRead => 'Những gì chúng tôi đọc được';

  @override
  String get sourceDelete => 'Xoá bản thu nhận';

  @override
  String get sourceGone => 'Bản thu nhận đó không còn nữa.';

  @override
  String get sourceDeleteTitle => 'Xoá bản thu nhận này?';

  @override
  String get sourceDeleteBody =>
      'Ảnh và phần chữ đọc được từ nó sẽ bị gỡ khỏi thiết bị này.';

  @override
  String get sourceDeleteKeep => 'Giữ lại';

  @override
  String get sourceOpenAction => 'Mở việc';

  @override
  String sourceOpenActions(int count) {
    return 'Mở $count việc';
  }

  @override
  String get sourceCreateAnother => 'Tạo thêm một cái từ đây';

  @override
  String get sourceCreateAction => 'Tạo một việc từ đây';

  @override
  String get sourceDoMore => 'Làm thêm với cái này';

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
    return 'từ $format $size KB';
  }

  @override
  String get sourceTextFound => 'Đã tìm thấy chữ';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines dòng · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'Đây là phần chữ Action đã đọc. Những gì được tạo ra từ nó nằm bên dưới.';

  @override
  String get sourceNotInterpreted =>
      'Chưa có gì được diễn giải. Action sẽ gợi ý nên làm gì với cái này, và bạn xác nhận trước khi bất cứ thứ gì được tạo.';

  @override
  String get sourceNoTextExplainer =>
      'Điều này hay xảy ra với chữ viết tay, ánh sáng rất yếu, hoặc một hệ chữ mà thiết bị này chưa đọc được.';

  @override
  String get sourceReadFailed => 'Không đọc được cái này';

  @override
  String get sourceReadFailedReason => 'Việc nhận dạng chữ đã không hoàn tất.';

  @override
  String get sourceTryReadingAgain => 'Thử đọc lại';

  @override
  String get sourceTypeInstead => 'Gõ thông tin thay thế';

  @override
  String get sourceTypeWhatItSays => 'Gõ lại nội dung trong đó';

  @override
  String get sourceTypeHint =>
      'Ngày tháng, số tiền, và điều đang được yêu cầu.';

  @override
  String get sourceMadeFromThis => 'Tạo ra từ bản thu nhận này';

  @override
  String sourceMadeFromThisCount(int count) {
    return '$count thứ được tạo từ bản thu nhận này';
  }

  @override
  String get sourceTheDocument => 'Tài liệu';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trang',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'Không rõ số trang';

  @override
  String get sourceDocumentNotRead =>
      'Action chưa đọc nội dung bên trong tài liệu này. Khi bạn chạy một công cụ cần đến nó, tệp sẽ được gửi tới nhà cung cấp AI mà bạn đã kết nối, và bạn sẽ được báo trước khi điều đó xảy ra.';

  @override
  String get previewSaveFailed => 'Không lưu được. Hãy thử lại.';

  @override
  String get previewTitle => 'Kiểm tra bản thu nhận';

  @override
  String get previewImageFailed => 'Không mở được ảnh đó.';

  @override
  String get previewHint =>
      'Hãy chắc là chữ đọc được và không có phần quan trọng nào bị cắt mất.';

  @override
  String get previewRetake => 'Chụp lại';

  @override
  String get pasteTitle => 'Dán văn bản';

  @override
  String get pasteHint =>
      'Dán email, tin nhắn hoặc thông báo mà bạn không muốn đọc hết.';

  @override
  String get pasteFootnote =>
      'Bất cứ thứ gì có ngày tháng, số tiền hoặc một yêu cầu đều hợp.';

  @override
  String get pasteEnough => 'Có vẻ đã đủ để làm việc.';

  @override
  String get pasteMore => 'Thêm chút chữ nữa sẽ cho kết quả tốt hơn.';

  @override
  String get reviewLoadFailed => 'Không tải được bản thu nhận này.';

  @override
  String get reviewConfirmed => 'Đã xác nhận';

  @override
  String get reviewNeedsReview => 'Cần xem lại';

  @override
  String get reviewReview => 'Xem lại';

  @override
  String get reviewHighConfidence => 'Độ tin cậy cao';

  @override
  String get reviewConfirmedByYou => 'Bạn đã xác nhận';

  @override
  String get reviewMissing => 'Thiếu';

  @override
  String get reviewNotUnderstood =>
      'Action không hiểu được đủ nhiều từ nguồn này một cách đáng tin.';

  @override
  String get reviewNotUnderstoodBody =>
      'Bản thu nhận vẫn nguyên vẹn và không mất gì cả. Bạn có thể tự nhập thông tin, và nguồn vẫn được đính kèm để đối chiếu.';

  @override
  String get reviewEnterDetails => 'Nhập thông tin';

  @override
  String get reviewKeepSource => 'Giữ nguồn để dùng sau';

  @override
  String reviewEngine(String engine) {
    return 'Bộ máy: $engine';
  }

  @override
  String get reviewManualNotice =>
      'Bạn đang tự tạo việc này. Chỉ những gì bạn nhập ở đây mới được dùng.';

  @override
  String get reviewUntitled => 'Việc chưa có tên';

  @override
  String get reviewEditTitle => 'Sửa tên';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giá trị cần bạn xem lại trước khi có thể xác nhận.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Thông tin chính';

  @override
  String get reviewNotFound => 'Không tìm thấy';

  @override
  String get reviewSuggestedNextStep => 'Bước tiếp theo được gợi ý';

  @override
  String get reviewWhyThisMatters => 'Vì sao điều này quan trọng';

  @override
  String get reviewSteps => 'Các bước';

  @override
  String get reviewAddStep => 'Thêm một bước';

  @override
  String get reviewInjectionNotice =>
      'Một phần chữ trong nguồn này trông giống chỉ dẫn hơn là thông tin của tài liệu, nên Action đã bỏ qua nó.';

  @override
  String get reviewLayoutNotice =>
      'Cách trình bày của tài liệu này có thể chứa những liên hệ mà việc trích xuất chữ không giữ lại được trọn vẹn. Hãy đối chiếu các giá trị bên dưới với nguồn trước khi xác nhận.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Hãy đối chiếu các giá trị bên dưới với nguồn.';
  }

  @override
  String get reviewDeadline => 'Hạn chót';

  @override
  String get reviewAmount => 'Số tiền';

  @override
  String get reviewLeftUnset => 'Không có — bạn đã chọn để trống';

  @override
  String get reviewUnclear => 'Chưa rõ';

  @override
  String get reviewNotSet => 'Chưa đặt';

  @override
  String get reviewNoDeadlineFound => 'Không tìm thấy trong tài liệu này';

  @override
  String get reviewNoAmountFound =>
      'Không tìm thấy số tiền nào trong tài liệu này';

  @override
  String get reviewMultipleDates => 'Action tìm thấy nhiều ngày có thể là hạn.';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count ngày đều có thể là hạn chót. Hãy chọn đúng ngày, nhập ngày khác, hoặc để trống.';
  }

  @override
  String get reviewChooseDate => 'Chọn một ngày';

  @override
  String get reviewMultipleAmounts =>
      'Action tìm thấy nhiều hơn một số tiền có thể đúng.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count số tiền đều có thể là số được nói tới ở đây. Hãy chọn một, nhập số khác, hoặc để trống.';
  }

  @override
  String get reviewChooseAmount => 'Chọn một số tiền';

  @override
  String get reviewSkipStep => 'Bỏ qua bước này';

  @override
  String get reviewKeepStep => 'Giữ bước này';

  @override
  String get reviewEditStep => 'Sửa bước';

  @override
  String get reviewCreateManually => 'Tự tạo';

  @override
  String get reviewConfirmAndCreate => 'Xác nhận và tạo việc';

  @override
  String get reviewFixHighlighted => 'Xem lại các ô được đánh dấu';

  @override
  String get reviewSaving => 'Đang lưu…';

  @override
  String get reviewSaveFailed =>
      'Không lưu được việc này. Không mất gì cả — hãy thử lại.';

  @override
  String get reviewFieldTitle => 'Tên';

  @override
  String get reviewTitleHint => 'Cần làm gì?';

  @override
  String get reviewNewStep => 'Bước mới';

  @override
  String get reviewStepHint => 'Việc cần làm';

  @override
  String get reviewDatesConflict => 'Tài liệu nhắc tới nhiều hơn một ngày.';

  @override
  String get reviewAmountsConflict =>
      'Tài liệu nhắc tới nhiều hơn một số tiền.';

  @override
  String get reviewAnotherDate => 'Một ngày khác — 2026-08-30';

  @override
  String get reviewBadDate =>
      'Không phải một ngày có thật. Hãy dùng dạng 2026-08-30.';

  @override
  String get reviewTypeDate => 'Gõ một ngày, hoặc để trống ở bên dưới.';

  @override
  String get reviewUseThisDate => 'Dùng ngày này';

  @override
  String get reviewLeaveNoDeadline => 'Tiếp tục mà không có hạn chót';

  @override
  String get reviewAnotherAmount => 'Một số tiền khác — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'Không dùng được số tiền này: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Dùng số tiền này';

  @override
  String get reviewLeaveNoAmount => 'Tiếp tục mà không có số tiền';

  @override
  String get reviewThisValue => 'Giá trị này';

  @override
  String reviewQuote(String quote) {
    return '“$quote”';
  }

  @override
  String get reviewSeeOnCapture => 'Xem trên bản thu nhận';

  @override
  String get reviewViewSource => 'Xem nguồn';

  @override
  String get reviewFromSource => 'Từ nguồn';

  @override
  String get reviewNotVerified => 'Chưa đối chiếu';

  @override
  String get reviewCouldNotVerify => 'Không đối chiếu được cái này với nguồn.';

  @override
  String get reviewLooksRight => 'Trông có vẻ đúng';

  @override
  String get reviewStageReading => 'Đang đọc nguồn';

  @override
  String get reviewStageUnderstanding => 'Đang hiểu các chi tiết quan trọng';

  @override
  String get reviewStageChecking => 'Đang kiểm những chỗ cần xem lại';

  @override
  String get reviewNothingToDo => 'Ngay lúc này bạn không cần làm gì cả.';

  @override
  String get reviewInformationOnly =>
      'Cái này có vẻ chỉ là thông tin — không tìm thấy hạn chót, khoản thanh toán hay yêu cầu trả lời nào.';

  @override
  String get reviewInformationOnlyWithSource =>
      'Cái này có vẻ chỉ là thông tin — trong bản thu nhận này không tìm thấy hạn chót, khoản thanh toán hay yêu cầu trả lời nào.';

  @override
  String get reviewSourceKept => 'Nguồn vẫn được giữ trong cả hai trường hợp.';

  @override
  String get reviewAddAnyway => 'Vẫn thêm một việc';

  @override
  String get reviewActionConfirmed => 'Đã xác nhận việc';

  @override
  String get reviewCreatedByYou => 'Do bạn tạo.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bạn đã xác nhận dựa trên $count thông tin đã xem lại.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bạn đã xác nhận dựa trên $count thông tin đã xem lại. Bạn đã đổi $edited trong số đó.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Đã lưu trên thiết bị này.';

  @override
  String get detailLoadFailed =>
      'Không tải được việc này. Nó vẫn được lưu trên thiết bị này.';

  @override
  String get detailNotFoundTitle => 'Việc đó không còn ở đây nữa';

  @override
  String get detailNotFoundMessage => 'Có thể nó đã bị xoá trên thiết bị này.';

  @override
  String get detailGoBack => 'Quay lại';

  @override
  String get detailMore => 'Thêm';

  @override
  String get detailChangeUrgency => 'Đổi mức gấp';

  @override
  String get detailAddRecommendedStep => 'Thêm bước được gợi ý';

  @override
  String get detailEditRecommendedStep => 'Sửa bước được gợi ý';

  @override
  String get detailArchiveTitle => 'Lưu trữ việc này?';

  @override
  String get detailArchiveBody =>
      'Nó rời khỏi danh sách của bạn nhưng không bị xoá, và bản thu nhận sinh ra nó vẫn được giữ.';

  @override
  String get detailArchiveConfirm => 'Lưu trữ';

  @override
  String get detailArchived => 'Đã lưu trữ';

  @override
  String detailCompletedOn(String date) {
    return 'Hoàn thành ngày $date';
  }

  @override
  String get detailSectionDetails => 'Chi tiết';

  @override
  String get detailSectionReminders => 'Nhắc nhở';

  @override
  String get detailAllStepsDone => 'Đã xong mọi bước';

  @override
  String get detailNextEyebrow => 'Tiếp theo';

  @override
  String get detailCompleteQuestion => 'Hoàn thành việc này?';

  @override
  String get detailMarkStepDone => 'Đánh dấu bước đã xong';

  @override
  String get detailCompleteAction => 'Hoàn thành việc này';

  @override
  String get detailAddDeadline => 'Thêm hạn chót';

  @override
  String get detailAddAmount => 'Thêm số tiền';

  @override
  String detailStepsProgress(int completed, int total) {
    return 'Xong $completed trên $total';
  }

  @override
  String get detailNoStepsTitle => 'Chưa có bước nào';

  @override
  String get detailNoStepsMessage =>
      'Hãy chia việc này thành những động tác bạn thật sự phải làm.';

  @override
  String get detailAddFirstStep => 'Thêm bước đầu tiên';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Bước đã hoàn thành: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Bước tiếp theo: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Bước: $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'Đánh dấu “$title” là đã xong';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'Đánh dấu “$title” là chưa xong';
  }

  @override
  String get detailStepOptions => 'Tuỳ chọn của bước';

  @override
  String get detailMoveUp => 'Chuyển lên';

  @override
  String get detailMoveDown => 'Chuyển xuống';

  @override
  String get detailDeleteStep => 'Xoá bước';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'Xoá bước này?';

  @override
  String get stepDeleteKeep => 'Giữ lại';

  @override
  String get detailNoRemindersYet => 'Chưa có nhắc nhở nào.';

  @override
  String get detailReminderLimit =>
      'Đó là số nhắc nhở tối đa cho một việc. Hãy bỏ bớt một cái để thêm cái khác.';

  @override
  String get detailAddReminder => 'Thêm nhắc nhở';

  @override
  String get detailChangeReminder => 'Đổi nhắc nhở';

  @override
  String get detailRemoveReminder => 'Bỏ nhắc nhở';

  @override
  String get detailReminderFormat => 'EEE d MMM, HH:mm';

  @override
  String get reminderStatePending => 'Chưa thiết lập xong';

  @override
  String get reminderStateNotificationsOff =>
      'Đã lưu, nhưng thông báo đang tắt';

  @override
  String get reminderStateFailed => 'Không đặt lịch được';

  @override
  String get reminderStateRemoving => 'Đang bỏ…';

  @override
  String get reminderSetConfirmation =>
      'Đã đặt nhắc nhở. Chúng tôi sẽ nhắc bạn.';

  @override
  String get reminderUpdatedConfirmation => 'Đã cập nhật nhắc nhở.';

  @override
  String get reminderNeedsPermission =>
      'Thông báo đang tắt, nên nhắc nhở này đã được lưu nhưng chưa thể báo cho bạn.';

  @override
  String get reminderScheduleFailed =>
      'Nhắc nhở này đã được lưu, nhưng Android không chịu đặt lịch cho nó.';

  @override
  String get reminderLimitReached => 'Việc đó đã có số nhắc nhở tối đa rồi.';

  @override
  String get reminderTimeInPast => 'Thời điểm đó đã trôi qua.';

  @override
  String get reminderAddTitle => 'Thêm một nhắc nhở';

  @override
  String get reminderChangeTitle => 'Đổi nhắc nhở này';

  @override
  String get reminderDateLabel => 'Ngày';

  @override
  String get reminderTimeLabel => 'Giờ';

  @override
  String get reminderFieldDateFormat => 'EEE d MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'EEEE, d MMMM';

  @override
  String get reminderPresetFormat => 'd MMM, HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return 'Bạn sẽ được nhắc vào $date lúc $time.';
  }

  @override
  String get reminderTimePastError =>
      'Thời điểm đó đã trôi qua. Hãy chọn giờ muộn hơn.';

  @override
  String get reminderSet => 'Đặt nhắc nhở';

  @override
  String get reminderPresetInHour => 'Sau 1 giờ nữa';

  @override
  String get reminderPresetTomorrowMorning => 'Sáng mai';

  @override
  String get reminderPresetNextWeek => 'Tuần sau';

  @override
  String get reminderPresetOnTheDay => 'Đúng ngày';

  @override
  String get reminderPresetDayBefore => 'Trước 1 ngày';

  @override
  String get reminderPresetWeekBefore => 'Trước 1 tuần';

  @override
  String get reminderPresetAtDeadline => 'Đúng hạn chót';

  @override
  String get reminderPresetHourBefore => 'Trước 1 giờ';

  @override
  String get editNextStepTitle => 'Bước tiếp theo được gợi ý';

  @override
  String get editNextStepSubtitle =>
      'Một câu ngắn về động tác hữu ích tiếp theo.';

  @override
  String get editNextStepHint => 'Động tác hữu ích tiếp theo là gì?';

  @override
  String get editRemoveSuggestion => 'Bỏ gợi ý';

  @override
  String get editUrgencyTitle => 'Việc này gấp đến mức nào?';

  @override
  String get editStepHint => 'Một việc cụ thể cần làm';

  @override
  String get editAddStep => 'Thêm bước';

  @override
  String get editDateHint => 'NNNN-TT-NN';

  @override
  String get editRemoveDeadline => 'Bỏ hạn chót';

  @override
  String get editAmountHint => '96,40';

  @override
  String get editSaveAmount => 'Lưu số tiền';

  @override
  String get editRemoveAmount => 'Bỏ số tiền';

  @override
  String get securityTitle => 'Bảo mật và riêng tư';

  @override
  String get securitySectionProtection => 'Bảo vệ';

  @override
  String get securityAppLockUnavailable =>
      'Khoá ứng dụng cần có khoá màn hình trên thiết bị này. Hãy đặt mã PIN, hình mở khoá, mật khẩu hoặc vân tay trong cài đặt thiết bị trước.';

  @override
  String get securityAppLockOn =>
      'Action nhờ thiết bị của bạn xác nhận đúng là bạn.';

  @override
  String get securityAppLockOff =>
      'Yêu cầu vân tay, khuôn mặt hoặc mã PIN thiết bị để mở Action.';

  @override
  String get securityAskAgain => 'Hỏi lại';

  @override
  String get securityAskAgainDescription =>
      'Action được ở nền bao lâu trước khi khoá lại.';

  @override
  String get securityScreenPrivacy => 'Riêng tư màn hình';

  @override
  String get securityScreenPrivacyDescription =>
      'Nhờ Android chặn chụp và quay màn hình, và ẩn Action trong trình chuyển ứng dụng.';

  @override
  String get securityPrivateReminders => 'Nhắc nhở riêng tư';

  @override
  String get securityPrivateRemindersOn =>
      'Nhắc nhở chỉ nói rằng có việc đang chờ bạn.';

  @override
  String get securityPrivateRemindersOff =>
      'Nhắc nhở hiện tên của việc. Hãy bật cái này để tên đó không xuất hiện trên màn hình khoá.';

  @override
  String get securityLockNow => 'Khoá ngay';

  @override
  String get securityLockNowDescription => 'Đóng cửa mà không cần chờ.';

  @override
  String get securitySectionStorage => 'Dữ liệu của bạn được lưu thế nào';

  @override
  String get securityStorageDataLabel =>
      'Việc, bản thu nhận và cài đặt của bạn';

  @override
  String get securityStorageDataDetail =>
      'Chúng nằm trong vùng lưu trữ riêng của chính ứng dụng này, nơi các ứng dụng khác không đọc được và được Android mã hoá như một phần của việc mã hoá thiết bị. Action không thêm một lớp thứ hai của riêng nó lên trên.';

  @override
  String get securityStorageKeyLabel => 'Khoá nhà cung cấp AI của bạn';

  @override
  String get securityStorageKeyDetail =>
      'Được giữ trong Android Keystore chứ không nằm chung với phần còn lại, và không bao giờ hiện lại sau khi bạn lưu.';

  @override
  String get securityStorageGapLabel => 'Những gì điều đó không bao gồm';

  @override
  String get securityStorageGapDetail =>
      'Không điều nào trong đó chống được người dùng thiết bị của bạn khi nó đang mở khoá, và một hệ thống đã bị sửa đổi hoặc root có thể đọc được nhiều hơn hệ thống bình thường. Khoá ứng dụng là thiết lập giúp cho trường hợp thứ nhất.';

  @override
  String get securitySectionInformation => 'Thông tin của bạn';

  @override
  String get securityWhereInfoDescription =>
      'Mọi đường mà dữ liệu của bạn có thể đi, và hai đường rời khỏi thiết bị này.';

  @override
  String get securityAppLockRefused =>
      'Chưa xác nhận, nên không có gì thay đổi.';

  @override
  String get securityAppLockUnavailableToast =>
      'Thiết bị này chưa đặt khoá màn hình. Hãy thêm mã PIN, hình mở khoá, mật khẩu hoặc vân tay trong cài đặt thiết bị rồi thử lại.';

  @override
  String get securityScreenPrivacyRefused =>
      'Thiết bị này không chịu áp dụng riêng tư màn hình, nên nó được để tắt thay vì hiển thị là đang bật.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nhắc nhở đã lên lịch giờ nói ít hơn.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã cập nhật $count nhắc nhở đã lên lịch.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Ngay lập tức';

  @override
  String get appLockDelayOneMinute => 'Sau 1 phút';

  @override
  String get appLockDelayFiveMinutes => 'Sau 5 phút';

  @override
  String get securityDelayImmediatelyDescription =>
      'Mỗi lần Action rời khỏi màn hình';

  @override
  String get securityDelayOneMinuteDescription => 'Đủ để trả lời một tin nhắn';

  @override
  String get securityDelayFiveMinutesDescription => 'Đủ để nghe một cuộc gọi';

  @override
  String get securityHeroProtected => 'Đang được bảo vệ';

  @override
  String get securityHeroNothingOn => 'Chưa bật gì cả';

  @override
  String get securityHeroFootnote =>
      'Mọi thứ ở đây đều chạy trên thiết bị này. Không thiết lập nào trong số này được gửi đi đâu, và không cái nào có thể bị đổi từ xa.';

  @override
  String get securityHeadlineNone => 'Có ba lớp bảo vệ sẵn sàng';

  @override
  String securityHeadlineOne(String first) {
    return '$first đang bật';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first và $second đang bật';
  }

  @override
  String get securityHeadlineAll => 'Cả ba lớp bảo vệ đều đang bật';

  @override
  String get securityTransfersTitle => 'Những gì đã rời khỏi thiết bị này';

  @override
  String get securityTransfersNoProvider =>
      'Chưa kết nối nhà cung cấp AI nào, nên không có gì đang được gửi đi để phân tích cả.';

  @override
  String get securityTransfersDescription =>
      'Được ghi ở đây ngay lúc có thứ gì đó được gửi đi, dù có nhận lại được hay không. Chỉ công cụ, nhà cung cấp và dung lượng — không bao giờ là nội dung bên trong. Giữ 90 ngày trên thiết bị này và không gửi đi đâu.';

  @override
  String get securityClear => 'Xoá';

  @override
  String get securityNothingSent => 'Chưa gửi đi thứ gì';

  @override
  String get securityNothingSentDescription =>
      'Khi bạn chạy một công cụ dùng nhà cung cấp AI của bạn, nó sẽ được liệt kê ở đây.';

  @override
  String get securityClearHistoryTitle => 'Xoá lịch sử này?';

  @override
  String get securityClearHistoryBody =>
      'Bản ghi về những gì đã gửi sẽ bị xoá khỏi thiết bị này. Việc đó không thu hồi bất cứ thứ gì đã được gửi đi.';

  @override
  String get securityUnnamedTool => 'Một công cụ Intelligence';

  @override
  String get securityYourProvider => 'nhà cung cấp AI của bạn';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trang',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tệp',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'một đoạn chữ ngắn';

  @override
  String securityTransferCharacters(int count) {
    return '$count nghìn ký tự';
  }

  @override
  String securitySentTo(String provider) {
    return 'Đã gửi tới $provider.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'Đã gửi tới $provider · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return '$count tuần trước';
  }

  @override
  String get helpTitle => 'Trợ giúp';

  @override
  String get helpAddQuestion => 'Tôi có thể thêm những gì?';

  @override
  String get helpAddAnswer =>
      'Một ảnh chụp màn hình, một tấm ảnh chụp lá thư hay hoá đơn, hoặc chữ bạn dán vào. Hợp nhất là bất cứ thứ gì có ngày tháng, số tiền hoặc một yêu cầu.';

  @override
  String get helpReviewQuestion => 'Vì sao Action bảo tôi xem lại?';

  @override
  String get helpReviewAnswer =>
      'Vì một cỗ máy đọc tài liệu có thể đọc sai, và một hạn chót sai một cách lặng lẽ còn tệ hơn là không có hạn chót nào. Action cho thấy nó tìm được gì và từ những chữ nào, và không có gì được lưu cho đến khi bạn xác nhận.';

  @override
  String get helpVaryQuestion => 'Vì sao kết quả đổi khác khi tôi thử lại?';

  @override
  String get helpVaryAnswer =>
      'Dịch vụ đọc tài liệu của bạn không tất định, nên cùng một bản thu nhận có thể trả về hơi khác. Đó cũng là lý do bước xem lại tồn tại — bạn là phần không thay đổi.';

  @override
  String get helpLateQuestion => 'Vì sao nhắc nhở của tôi đến muộn?';

  @override
  String get helpLateAnswer =>
      'Nhắc nhở được đặt lịch qua Android, và Android quyết định chính xác lúc nào gửi. Tiết kiệm pin, Doze và các thiết lập nguồn của nhà sản xuất đều có thể làm chậm một nhắc nhở. Action không bao giờ hứa một nhắc nhở đúng đến từng phút.';

  @override
  String get helpDataQuestion => 'Dữ liệu của tôi ở đâu?';

  @override
  String get helpDataAnswer =>
      'Gần như tất cả đều nằm trên thiết bị này: các bản thu nhận, việc, bước, nhắc nhở và tìm kiếm của bạn. Hai ngoại lệ — nội dung bạn nhờ Action đọc sẽ được gửi tới dịch vụ AI đọc nó, và một bản ghi ngắn của một việc đã xác nhận có thể được lưu trên đám mây dưới một mã định danh ẩn danh. Mục Riêng tư và dữ liệu trong Cài đặt liệt kê chính xác bản ghi đó chứa những gì.';

  @override
  String get helpBackupQuestion => 'Đây có phải bản sao lưu không?';

  @override
  String get helpBackupAnswer =>
      'Không. Bản ghi trên đám mây không thể khôi phục sang thiết bị mới, và cũng không có tài khoản nào để đăng nhập. Nếu bạn gỡ Action hoặc mất thiết bị này, dữ liệu trên đó là mất.';

  @override
  String get helpCorrectQuestion => 'Tôi sửa một việc thế nào?';

  @override
  String get helpCorrectAnswer =>
      'Mở nó ra và sửa bất kỳ ô nào — tên, hạn chót, số tiền hoặc bước tiếp theo được gợi ý. Bạn có thể thêm, sắp xếp lại, hoàn thành và xoá các bước bất cứ lúc nào. Sửa một việc không bao giờ hỏi dịch vụ AI điều gì.';

  @override
  String get privacyTitle => 'Riêng tư và dữ liệu';

  @override
  String get privacyIntro =>
      'Action giữ trên thiết bị này nhiều nhất có thể. Hai thứ là ngoại lệ, và cả hai đều được liệt kê bên dưới.';

  @override
  String get privacyGroupOnDevice => 'Trên thiết bị này';

  @override
  String get privacyOnDeviceCaptures =>
      'Bản thu nhận — ảnh chụp màn hình, ảnh và chữ bạn thêm vào, cùng phần chữ đọc được từ chúng.';

  @override
  String get privacyOnDeviceActions =>
      'Việc, cùng các bước, thông tin và nhắc nhở của chúng.';

  @override
  String get privacyOnDeviceSearch =>
      'Tìm kiếm. Các tìm kiếm của bạn chạy ở đây, không bao giờ được gửi đi đâu, và không được giữ lại sau khi bạn đóng màn hình.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'Ảnh được lưu mà không kèm vị trí. Toạ độ, thời gian và thông tin máy ảnh mà điện thoại ghi vào trong một tấm ảnh đều bị gỡ trước khi bản thu nhận được lưu, nên chúng không được giữ ở đây và cũng không đi kèm khi bạn gửi một bản thu nhận tới nhà cung cấp AI của bạn.';

  @override
  String get privacyGroupSentToRead => 'Gửi đi để được đọc';

  @override
  String get privacySentToReadWhat =>
      'Khi bạn nhờ Action diễn giải một bản thu nhận, nội dung đó được gửi tới dịch vụ AI đọc nó. Đây không phải AI chạy trên thiết bị.';

  @override
  String get privacySentToReadWhen =>
      'Chỉ bản thu nhận bạn chọn mới được gửi, và chỉ khi bạn yêu cầu.';

  @override
  String get privacyGroupYourProvider =>
      'Gửi tới nhà cung cấp AI của chính bạn';

  @override
  String get privacyProviderWhat =>
      'Nếu bạn kết nối một nhà cung cấp AI trong Cài đặt, các công cụ Intelligence sẽ gửi nội dung bạn chọn tới nhà cung cấp đó — OpenAI, Anthropic, Google hoặc một endpoint bạn đã chọn — bằng khoá API của chính bạn.';

  @override
  String get privacyProviderDirect =>
      'Nó đi thẳng tới họ. Nó không đi qua bất kỳ máy chủ nào thuộc về Action.';

  @override
  String get privacyProviderScope =>
      'Chỉ những gì bạn chọn cho một công cụ mới được gửi, và chỉ khi bạn chạy nó. Những việc, bản thu nhận và nguồn khác của bạn không bao giờ được kèm theo, và không bao giờ có gì được gửi ngầm ở nền.';

  @override
  String get privacyProviderKey =>
      'Khoá API của bạn được giữ trong vùng lưu trữ an toàn của thiết bị này và chỉ được gửi tới nhà cung cấp mà nó thuộc về. Vùng lưu trữ an toàn là một trở ngại thật sự với người cầm thiết bị đang mở khoá của bạn, nhưng nó không tuyệt đối, và Action sẽ không nói ngược lại.';

  @override
  String get privacyProviderLocalTools =>
      'Hai công cụ không bao giờ gửi đi thứ gì: che thông tin nhạy cảm, và kiểm tra một tệp đến từ đâu. Cả hai chạy hoàn toàn trên thiết bị này.';

  @override
  String get privacyProviderAgreement =>
      'Nhà cung cấp của bạn làm gì với những gì bạn gửi là do thoả thuận của bạn với họ quy định, không phải Action.';

  @override
  String get privacyGroupCloud => 'Lưu trên đám mây';

  @override
  String get privacyCloudWhat =>
      'Khi bạn xác nhận một việc, một bản ghi ngắn của nó có thể được lưu dưới một mã định danh ẩn danh thuộc về bản cài đặt này: tên, trạng thái, mức gấp, phân loại, hạn chót, số tiền, bước tiếp theo được gợi ý và các mốc thời gian.';

  @override
  String get privacyCloudNotSent =>
      'Các bản thu nhận của bạn, phần chữ đọc được từ chúng, các bước và thông tin của một việc, cùng các nhắc nhở của bạn đều không được gửi đi.';

  @override
  String get privacyCloudNotBackup =>
      'Đây không phải bản sao lưu. Không có cách nào khôi phục nó sang thiết bị mới, và mất bản cài đặt này thì mất luôn mã định danh ẩn danh.';

  @override
  String get privacyGroupDiagnostics => 'Chẩn đoán';

  @override
  String get privacyDiagnosticsWhat =>
      'Action ghi lại các con số ẩn danh về những gì diễn ra trong ứng dụng — rằng một bản thu nhận đã bắt đầu, rằng một lần trích xuất thành công hay không, rằng một tìm kiếm không thấy gì, rằng một việc đã hoàn thành.';

  @override
  String get privacyDiagnosticsCounts =>
      'Đó là các con số đếm, không phải nội dung. Không bao giờ có tên, số tiền, hạn chót, số tham chiếu, chữ đã thu nhận hay từ khoá tìm kiếm nào được kèm theo, mã định danh ẩn danh hay bất kỳ mã nào của một việc hoặc một bản thu nhận cũng vậy.';

  @override
  String get privacyDiagnosticsCrash =>
      'Nếu ứng dụng gặp sự cố, lỗi và nơi nó xảy ra được báo về để có thể sửa. Action không đính kèm dữ liệu của bạn vào các báo cáo đó.';

  @override
  String get privacySectionYourData => 'Dữ liệu của bạn';

  @override
  String get privacyYourDataFootnote =>
      'Xoá các bản thu nhận vẫn để nguyên các việc của bạn. Một việc mà bản thu nhận đã mất thì vẫn dùng được; chỉ là nó không còn cho thấy nó đến từ đâu.';

  @override
  String get privacyClearCaptures => 'Xoá các bản thu nhận';

  @override
  String get privacyClearCapturesDescription =>
      'Xoá mọi bản thu nhận và tệp ảnh của nó.';

  @override
  String get privacyDeleteAll => 'Xoá toàn bộ dữ liệu của tôi';

  @override
  String get privacyDeleteAllDescription =>
      'Việc, bước, nhắc nhở, bản thu nhận và các bản ghi đám mây ở trên.';

  @override
  String get privacyClearCapturesTitle => 'Xoá các bản thu nhận?';

  @override
  String get privacyClearCapturesBody =>
      'Mọi bản thu nhận và ảnh của nó sẽ bị xoá khỏi thiết bị này. Các việc của bạn vẫn y nguyên như cũ.';

  @override
  String get privacyCapturesDeleted => 'Đã xoá các bản thu nhận.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Một số bản thu nhận không xoá được. Không có gì khác bị thay đổi.';

  @override
  String get privacyDeleteAllTitle => 'Xoá toàn bộ dữ liệu của bạn?';

  @override
  String get privacyDeleteAllBody =>
      'Việc này xoá mọi việc, bước, nhắc nhở và bản thu nhận trên thiết bị này, cùng các bản ghi đám mây liệt kê ở trên. Không thể hoàn tác, và cũng không có bản sao lưu nào để khôi phục.';

  @override
  String get privacyDeleteEverything => 'Xoá tất cả';

  @override
  String get privacyDeletedAll => 'Mọi thứ đã bị xoá.';

  @override
  String get privacyDeleteFailed => 'Không xoá được dữ liệu của bạn.';

  @override
  String get privacyDeletedUnverified =>
      'Mọi thứ trên thiết bị này đã bị xoá. Action không liên lạc được với đám mây để xác nhận rằng ở đó không còn gì, và sẽ kiểm tra lại.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'Đã xoá, trừ $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'Action sẽ thử lại.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action không kiểm tra xong đám mây, và sẽ thử lại.';

  @override
  String get privacyLeftoverCaptures => 'một số bản thu nhận';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bản ghi đám mây',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first và $second';
  }

  @override
  String get privacyCloudDeleted => 'Các bản ghi đám mây đã bị xoá.';

  @override
  String get privacyCloudUnreachable =>
      'Vẫn chưa liên lạc được với chúng. Action sẽ thử lại.';

  @override
  String get privacyPendingTitle => 'Vẫn còn phải xoá';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Lần trước không liên lạc được với $count bản ghi đám mây. Action sẽ tự thử lại, hoặc bạn có thể thử ngay bây giờ.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Thử lại';

  @override
  String get evidenceTitle => 'Chỗ này lấy từ đâu';

  @override
  String get evidenceUnverified =>
      'Action không tìm thấy những chữ này trong phần văn bản nó đã đọc, nên giá trị này chưa được đối chiếu. Hãy so với bản gốc trước khi bạn dựa vào nó.';

  @override
  String get evidenceHighlighted =>
      'Những chữ này có trong phần văn bản Action đọc được từ bản thu nhận này, và phần tô sáng chỉ ra chỗ đó.';

  @override
  String get evidenceNoRegion =>
      'Những chữ này có trong phần văn bản Action đọc được từ bản thu nhận này. Nó không xác định được chính xác vị trí của chúng trên ảnh, và nó không đoán.';

  @override
  String get evidenceInText =>
      'Những chữ này có trong phần văn bản mà bản thu nhận này chứa.';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'Rất gấp';

  @override
  String get urgencyImportant => 'Quan trọng';

  @override
  String get urgencyNormal => 'Bình thường';

  @override
  String get urgencyLow => 'Thấp';

  @override
  String get urgencyUnsure => 'Chưa chắc';
}
