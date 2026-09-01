// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppL10nId extends AppL10n {
  AppL10nId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonDone => 'Selesai';

  @override
  String get commonSave => 'Simpan';

  @override
  String get commonClose => 'Tutup';

  @override
  String get commonBack => 'Kembali';

  @override
  String get commonRetry => 'Coba lagi';

  @override
  String get commonDelete => 'Hapus';

  @override
  String get commonRemove => 'Keluarkan';

  @override
  String get commonContinue => 'Lanjutkan';

  @override
  String get commonOpen => 'Buka';

  @override
  String get commonCopy => 'Salin';

  @override
  String get commonCopied => 'Tersalin';

  @override
  String get commonEdit => 'Ubah';

  @override
  String get commonAdd => 'Tambah';

  @override
  String get commonOn => 'Aktif';

  @override
  String get commonOff => 'Nonaktif';

  @override
  String get commonUnknown => 'Tidak diketahui';

  @override
  String get commonChecking => 'Memeriksa…';

  @override
  String get commonSettings => 'Pengaturan';

  @override
  String get commonDismiss => 'Abaikan';

  @override
  String get commonUndo => 'Urungkan';

  @override
  String get commonSkip => 'Lewati';

  @override
  String get commonNotNow => 'Nanti saja';

  @override
  String get commonSomethingWentWrong => 'Ada yang tidak beres.';

  @override
  String get navToday => 'Hari ini';

  @override
  String get navLibrary => 'Pustaka';

  @override
  String get navIntelligence => 'Kecerdasan';

  @override
  String get navSearch => 'Cari';

  @override
  String get navCapture => 'Tangkap sesuatu';

  @override
  String get todayGreetingMorning => 'Selamat pagi';

  @override
  String get todayGreetingAfternoon => 'Selamat siang';

  @override
  String get todayGreetingEvening => 'Selamat malam';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'Tugas Anda tidak dapat dimuat. Semuanya masih tersimpan di perangkat ini.';

  @override
  String get todaySectionNeedsAttention => 'Perlu perhatian';

  @override
  String get todaySectionAlsoNeedsAttention => 'Juga perlu perhatian';

  @override
  String get todaySectionWaitingForReview => 'Menunggu ditinjau';

  @override
  String get todaySectionComingUp => 'Akan datang';

  @override
  String todaySeeAllCaptures(int count) {
    return 'Lihat semua $count tangkapan';
  }

  @override
  String get todaySeeAllInLibrary => 'Lihat semua di Pustaka';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selesai',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tugas selesai. Buka pustaka.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'MULAI DENGAN';

  @override
  String get todayQuickPhoto => 'Foto';

  @override
  String get todayQuickScreenshot => 'Tangkapan layar';

  @override
  String get todayQuickText => 'Teks';

  @override
  String get todayQuickTools =>
      'Periksa sebuah tautan, atau temukan kunci di dalam teks';

  @override
  String get briefBadgeNeedsYou => 'BUTUH ANDA';

  @override
  String get briefBadgeToReview => 'UNTUK DITINJAU';

  @override
  String get briefBadgeAhead => 'DI DEPAN';

  @override
  String get briefBadgeStartHere => 'MULAI DI SINI';

  @override
  String get briefBadgeClear => 'KOSONG';

  @override
  String get briefNext => 'BERIKUTNYA';

  @override
  String briefOpenAction(String title) {
    return 'Buka $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'Tandai \"$title\" selesai';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tugas perlu perhatian Anda',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tangkapan juga menunggu ditinjau.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tangkapan menunggu Anda',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'Tidak ada yang terlambat.';

  @override
  String get briefHeadlineNothingToday =>
      'Hari ini tidak ada yang membutuhkan Anda';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tugas akan datang.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'Anda sudah bersih';

  @override
  String get briefDetailClear =>
      'Tidak ada yang jatuh tempo dan tidak ada yang menunggu.';

  @override
  String get briefHeadlineFirstRun => 'Mulai dengan apa saja';

  @override
  String get briefDetailFirstRun =>
      'Sepucuk surat, tangkapan layar, catatan — Action akan mengenali apa itu.';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get settingsSectionPersonalise => 'Personalisasi';

  @override
  String get settingsAppearance => 'Tampilan';

  @override
  String get settingsAppearanceDescription =>
      'Terang, gelap, atau mengikuti perangkat.';

  @override
  String get settingsLanguageDescription =>
      'Bahasa yang dipakai Action untuk berbicara dengan Anda.';

  @override
  String get appearanceSystem => 'Sistem';

  @override
  String get appearanceLight => 'Terang';

  @override
  String get appearanceDark => 'Gelap';

  @override
  String get appearanceSystemDescription => 'Ikuti pengaturan perangkat';

  @override
  String get appearanceLightDescription => 'Selalu terang';

  @override
  String get appearanceDarkDescription => 'Selalu gelap';

  @override
  String get languageTitle => 'Bahasa';

  @override
  String get languageSubtitle =>
      'Perubahan langsung berlaku. Tidak ada yang dikirim ke mana pun; pilihan disimpan di perangkat ini.';

  @override
  String get languageSectionChoose => 'Pilih bahasa';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get languageSystemDescription => 'Ikuti bahasa perangkat';

  @override
  String get languageDraftNote =>
      'Bahasa Inggris adalah bahasa asli teks Action. Terjemahan lain disusun mengikuti glosarium tetap dan diperiksa secara otomatis, namun belum dibaca oleh penutur asli. Ketika pilihan kata benar-benar penting — privasi, keamanan, apa yang diklaim Action dan apa yang tidak — bahasa Inggris tetap menjadi acuan.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action tetap berfungsi tanpa AI. Menghubungkan penyedia Anda sendiri menambahkan alat analisis dokumen, perencanaan, dan penyusunan draf.';

  @override
  String get settingsAiProvider => 'Penyedia AI';

  @override
  String get settingsAiNotConnected =>
      'Belum terhubung. Gunakan akun dan kunci API Anda sendiri.';

  @override
  String settingsAiConnected(String provider) {
    return 'Terhubung ke $provider.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'Privasi & keamanan';

  @override
  String get settingsSecurity => 'Keamanan';

  @override
  String get settingsWhereInfoLives => 'Di mana informasi Anda berada';

  @override
  String get settingsWhereInfoLivesDescription =>
      'Apa yang tetap di perangkat ini, dan apa yang tidak.';

  @override
  String get protectionAppLock => 'Kunci Aplikasi';

  @override
  String get protectionScreenPrivacy => 'privasi layar';

  @override
  String get protectionPrivateReminders => 'pengingat pribadi';

  @override
  String get protectionSummaryNone =>
      'Kunci Aplikasi, privasi layar, dan apa yang keluar dari perangkat ini.';

  @override
  String protectionSummaryOne(String first) {
    return '$first aktif.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first dan $second aktif.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second, dan $third aktif.';
  }

  @override
  String get settingsSectionReminders => 'Pengingat';

  @override
  String get settingsRemindersFootnote =>
      'Android bisa menampilkan pengingat sedikit lebih lambat dari waktu yang Anda tetapkan, tergantung pengaturan baterai dan cara perangkat dipakai.';

  @override
  String get settingsNotifications => 'Notifikasi';

  @override
  String get settingsNotificationsOnDescription =>
      'Pengingat yang Anda buat dapat ditampilkan.';

  @override
  String get settingsNotificationsOffDescription =>
      'Dimatikan untuk Action, jadi pengingat tidak akan muncul.';

  @override
  String get settingsNotificationsUnknown => 'Tidak dapat diperiksa.';

  @override
  String get settingsNotificationsAllowed => 'Diizinkan';

  @override
  String get settingsOpenSystemSettings => 'Buka pengaturan';

  @override
  String get settingsActionFootnote =>
      'Action mengubah informasi yang berantakan menjadi langkah berikutnya yang jelas. Anda mengonfirmasi semuanya sebelum disimpan.';

  @override
  String get settingsHelp => 'Bantuan';

  @override
  String get settingsHelpDescription =>
      'Cara kerja Action, dan apa yang tidak akan dilakukannya.';

  @override
  String get settingsVersion => 'Versi';

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'Baru saja';

  @override
  String relativeMinutes(int count) {
    return '$count mnt lalu';
  }

  @override
  String relativeHours(int count) {
    return '$count jam lalu';
  }

  @override
  String get relativeYesterday => 'Kemarin';

  @override
  String relativeDays(int count) {
    return '$count hr lalu';
  }

  @override
  String get libraryTitle => 'Pustaka';

  @override
  String get librarySubtitle =>
      'Semua yang disimpan Action untuk Anda. Dan semuanya tetap di perangkat ini.';

  @override
  String get librarySegmentActions => 'Tugas';

  @override
  String get librarySegmentCaptures => 'Tangkapan';

  @override
  String get librarySegmentGoals => 'Sasaran';

  @override
  String get librarySegmentDone => 'Selesai';

  @override
  String get libraryNewGoal => 'Sasaran baru';

  @override
  String get libraryNoGoalsTitle => 'Belum ada sasaran';

  @override
  String get libraryNoGoalsMessage =>
      'Sasaran adalah sesuatu yang ingin Anda wujudkan. Action bisa menemukan apa yang kurang, apa yang menghambat, dan apa yang harus dilakukan lebih dulu.';

  @override
  String get libraryNoDoneTitle => 'Belum ada yang selesai';

  @override
  String get libraryNoDoneMessage =>
      'Tugas yang Anda selesaikan akan disimpan di sini.';

  @override
  String get libraryNoOpenTitle => 'Tidak ada tugas terbuka';

  @override
  String get libraryNoOpenMessage =>
      'Tangkap sesuatu dan Action akan mengetahui apa yang perlu dikerjakan.';

  @override
  String get libraryNoCapturesTitle => 'Belum ada yang ditangkap';

  @override
  String get libraryNoCapturesMessage =>
      'Foto, tangkapan layar, dan teks yang Anda tambahkan mendarat di sini lebih dulu. Tidak ada yang dianalisis sampai Anda meminta.';

  @override
  String get libraryGoalNoActions => 'Belum ada yang lahir darinya';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tugas dari sasaran ini',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Cari tugas dan tangkapan';

  @override
  String get searchClear => 'Bersihkan';

  @override
  String get searchPrivacyNote =>
      'Dicari di perangkat ini. Tidak ada yang Anda ketik di sini yang meninggalkannya.';

  @override
  String get searchYouCanSearch => 'ANDA BISA MENCARI';

  @override
  String get searchFieldTitles => 'Judul';

  @override
  String get searchFieldTitlesExample => 'Perpanjang asuransi mobil';

  @override
  String get searchFieldReferences => 'Nomor referensi';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Organisasi';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Langkah di dalam sebuah tugas';

  @override
  String get searchFieldStepsExample => 'Unggah formulirnya';

  @override
  String get searchFieldCaptureText => 'Teks yang dibaca dari tangkapan';

  @override
  String get searchFieldCaptureTextExample => 'pemberitahuan perpanjangan';

  @override
  String searchNoMatchesTitle(String query) {
    return 'Tidak ada hasil untuk \"$query\"';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Coba lebih sedikit kata, atau nomor referensi persis seperti tertulis.';

  @override
  String get searchNoMatchesClearFilters =>
      'Coba lebih sedikit kata, atau bersihkan filternya.';

  @override
  String get searchFilterActive => 'Aktif';

  @override
  String get searchFilterCompleted => 'Selesai';

  @override
  String get searchFilterOverdue => 'Terlambat';

  @override
  String get searchFilterThisWeek => 'Minggu ini';

  @override
  String get searchFilterCritical => 'Kritis';

  @override
  String get searchFilterCreatedByYou => 'Dibuat oleh Anda';

  @override
  String get searchFilterArchived => 'Diarsipkan';

  @override
  String get searchFilterClear => 'Bersihkan filter';

  @override
  String get searchIncompleteActions =>
      'Tugas Anda tidak dapat dicari, jadi hasil ini mungkin tidak lengkap.';

  @override
  String get searchIncompleteCaptures =>
      'Tangkapan Anda tidak dapat dicari, jadi hasil ini mungkin tidak lengkap.';

  @override
  String get searchIncompleteBoth =>
      'Tugas maupun tangkapan Anda tidak dapat dicari, jadi hasil ini mungkin tidak lengkap.';

  @override
  String get searchMatchTitle => 'Judul';

  @override
  String get searchMatchNextStep => 'Langkah berikutnya';

  @override
  String get searchMatchStep => 'Langkah';

  @override
  String get searchMatchSummary => 'Ringkasan';

  @override
  String get searchMatchFromCapture => 'Dari tangkapan';

  @override
  String get studioSuggested => 'Disarankan untuk tangkapan terakhir Anda';

  @override
  String get studioRecentlyUsed => 'Baru dipakai';

  @override
  String get studioReady => 'SIAP';

  @override
  String get studioNotConnected => 'BELUM TERHUBUNG';

  @override
  String get studioHeroTitle => 'Kecerdasan Action';

  @override
  String get studioConnectedBlurb =>
      'Pahami sebuah dokumen, pertajam sasaran, susun rencana, tulis draf balasan, atau periksa apa yang ada di hadapan Anda.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count alat untuk memahami dokumen, merencanakan, dan menulis. Hubungkan akun AI Anda sendiri untuk memakainya — yang menagih adalah penyedia Anda, tidak pernah Action.';
  }

  @override
  String get studioConnectAi => 'Hubungkan AI';

  @override
  String get studioHowItWorks => 'Cara kerjanya';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count di antaranya sudah berjalan tanpa semua itu, sepenuhnya di perangkat ini.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'Berjalan di perangkat ini';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description Berjalan di perangkat ini.';
  }

  @override
  String get categoryUnderstand => 'Pahami';

  @override
  String get categoryUnderstandBlurb => 'Pahami apa yang Anda punya.';

  @override
  String get categoryPlan => 'Rencanakan';

  @override
  String get categoryPlanBlurb =>
      'Ubah menjadi sesuatu yang bisa Anda kerjakan.';

  @override
  String get categoryCreate => 'Buat';

  @override
  String get categoryCreateBlurb => 'Tulis, perbaiki, terjemahkan.';

  @override
  String get categoryExtract => 'Ambil';

  @override
  String get categoryExtractBlurb => 'Tarik keluar detail yang penting.';

  @override
  String get categoryVerify => 'Periksa';

  @override
  String get categoryVerifyBlurb => 'Periksa apa yang ada di hadapan Anda.';

  @override
  String get captureSheetTitle => 'Tangkap sesuatu';

  @override
  String get captureSheetSubtitle =>
      'Serahkan ke Action apa pun yang enggan Anda baca sampai habis.';

  @override
  String get captureTakePhoto => 'Ambil foto';

  @override
  String get captureTakePhotoSubtitle =>
      'Surat, tagihan, atau pemberitahuan di depan Anda';

  @override
  String get captureChooseImage => 'Pilih gambar';

  @override
  String get captureChooseImageSubtitle =>
      'Tangkapan layar atau foto yang sudah ada di perangkat ini';

  @override
  String get capturePasteText => 'Tempel teks';

  @override
  String get capturePasteTextSubtitle => 'Email, pesan, atau pemberitahuan';

  @override
  String get captureChoosePdf => 'Pilih PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'Rekening koran, surat, atau formulir yang sudah Anda punya';

  @override
  String get captureFootnote =>
      'Tangkapan tetap di perangkat ini. Tidak ada yang dianalisis daring sampai Anda meminta.';

  @override
  String get captureCouldNotOpen => 'Tidak bisa dibuka. Coba cara lain.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'Sedang dibaca';

  @override
  String get stageNeedsReview => 'Perlu ditinjau';

  @override
  String get stageActionCreated => 'Tugas dibuat';

  @override
  String get stageNoText => 'Tidak ada teks ditemukan';

  @override
  String get stageCouldNotBeRead => 'Tidak bisa dibaca';

  @override
  String get stageReadingPreview => 'Sedang membaca teksnya…';

  @override
  String get stageFailedPreview => 'Ini tidak bisa dibaca di perangkat ini.';

  @override
  String get provenancePhoto => 'Ditangkap dari foto';

  @override
  String get provenanceImage => 'Ditangkap dari gambar';

  @override
  String get provenancePastedText => 'Ditangkap dari teks yang ditempel';

  @override
  String get provenanceDocument => 'Ditambahkan sebagai dokumen';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Selesai $when';
  }

  @override
  String metaOverdue(String date) {
    return 'Terlambat · jatuh tempo $date';
  }

  @override
  String get metaDueToday => 'Jatuh tempo hari ini';

  @override
  String metaDueOn(String date) {
    return 'Jatuh tempo $date';
  }

  @override
  String get metaCreatedByYou => 'Dibuat oleh Anda';

  @override
  String get categoryPayment => 'Pembayaran';

  @override
  String get categoryRenewal => 'Perpanjangan';

  @override
  String get categoryAppointment => 'Janji temu';

  @override
  String get categoryBooking => 'Pemesanan';

  @override
  String get categoryTravel => 'Perjalanan';

  @override
  String get categoryDeadline => 'Tenggat';

  @override
  String get categoryResponse => 'Perlu balasan';

  @override
  String get categoryDelivery => 'Pengiriman';

  @override
  String get categoryDocument => 'Dokumen';

  @override
  String get categoryNoActionRequired => 'Tidak ada yang perlu dilakukan';

  @override
  String get categoryUnsure => 'Belum jelas';

  @override
  String get errorEnterManually => 'Masukkan sendiri';
}
