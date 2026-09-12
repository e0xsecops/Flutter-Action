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
  String get ocrScriptTitle => 'Pengenalan teks';

  @override
  String get ocrScriptSubtitle =>
      'Sistem tulisan yang dibaca Action saat melihat sebuah foto. Pengenalan berlangsung di perangkat ini; tidak ada tangkapan yang dikirim ke mana pun untuk dibaca.';

  @override
  String get ocrScriptSectionChoose => 'Sistem tulisan';

  @override
  String get ocrScriptFollowLanguage => 'Ikuti bahasa aplikasi';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'Saat ini $script';
  }

  @override
  String get ocrScriptLatin => 'Latin';

  @override
  String get ocrScriptChinese => 'Tionghoa';

  @override
  String get ocrScriptDevanagari => 'Dewanagari';

  @override
  String get ocrScriptJapanese => 'Jepang';

  @override
  String get ocrScriptKorean => 'Korea';

  @override
  String get ocrScriptLatinDescription =>
      'Inggris, Spanyol, Prancis, Jerman, dan bahasa lain yang ditulis dengan huruf Latin.';

  @override
  String get ocrScriptChineseDescription =>
      'Tionghoa Sederhana dan Tradisional.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Hindi, Marathi, dan Nepali. Bukan Bengali, Tamil, atau Telugu — masing-masing memakai sistem tulisan yang berbeda.';

  @override
  String get ocrScriptJapaneseDescription => 'Jepang.';

  @override
  String get ocrScriptKoreanDescription => 'Korea.';

  @override
  String get ocrScriptFootnote =>
      'Semua pilihan selain Latin juga membaca huruf Latin, jadi memilih salah satu menambahkan sistem tulisan, bukan menukarnya. Perubahan ini berlaku untuk foto mulai sekarang, bukan untuk yang sudah dibaca.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action tidak dapat membaca tulisan $language';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'Tidak ada pengenal di perangkat untuk tulisan itu. Foto tetap dibaca untuk apa pun yang ditulis dengan huruf Latin, dan sisanya akan kembali kosong. Anda bisa mengetik atau menempelkan teks itu sebagai gantinya.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action disetel membaca $script. Jika foto ini memakai sistem tulisan lain, ubah di Pengaturan lalu baca lagi.';
  }

  @override
  String get settingsTextRecognition => 'Pengenalan teks';

  @override
  String get settingsTextRecognitionDescription =>
      'Sistem tulisan yang dibaca Action dari foto.';

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

  @override
  String get sourceWhatWeRead => 'Yang kami baca';

  @override
  String get sourceDelete => 'Hapus tangkapan';

  @override
  String get sourceGone => 'Tangkapan itu sudah tidak tersedia.';

  @override
  String get sourceDeleteTitle => 'Hapus tangkapan ini?';

  @override
  String get sourceDeleteBody =>
      'Gambar dan teks yang dibaca darinya dikeluarkan dari perangkat ini.';

  @override
  String get sourceDeleteKeep => 'Simpan saja';

  @override
  String get sourceOpenAction => 'Buka tugasnya';

  @override
  String sourceOpenActions(int count) {
    return 'Buka $count tugas';
  }

  @override
  String get sourceCreateAnother => 'Buat satu lagi dari ini';

  @override
  String get sourceCreateAction => 'Buat tugas dari ini';

  @override
  String get sourceDoMore => 'Lakukan lebih banyak dengan ini';

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
    return 'dari $format $size KB';
  }

  @override
  String get sourceTextFound => 'Teks ditemukan';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines baris · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'Ini teks yang dibaca Action. Apa yang dibuat darinya ada di bawah.';

  @override
  String get sourceNotInterpreted =>
      'Belum ada yang ditafsirkan. Action akan menyarankan apa yang bisa dilakukan dengan ini, dan Anda yang menyetujui sebelum apa pun dibuat.';

  @override
  String get sourceNoTextExplainer =>
      'Ini bisa terjadi pada tulisan tangan, cahaya yang sangat kurang, atau tulisan yang belum bisa dibaca perangkat ini.';

  @override
  String get sourceReadFailed => 'Tidak bisa membaca ini';

  @override
  String get sourceReadFailedReason => 'Pengenalan teks tidak sampai selesai.';

  @override
  String get sourceTryReadingAgain => 'Coba baca lagi';

  @override
  String get sourceTypeInstead => 'Ketik saja datanya';

  @override
  String get sourceTypeWhatItSays => 'Ketik apa yang tertulis';

  @override
  String get sourceTypeHint => 'Tanggal, jumlah, dan apa yang diminta.';

  @override
  String get sourceMadeFromThis => 'Dibuat dari tangkapan ini';

  @override
  String sourceMadeFromThisCount(int count) {
    return '$count dibuat dari tangkapan ini';
  }

  @override
  String get sourceTheDocument => 'Dokumennya';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'Jumlah halaman tidak diketahui';

  @override
  String get sourceDocumentNotRead =>
      'Action belum membaca isi dokumen ini. Saat Anda menjalankan alat yang membutuhkannya, berkas itu dikirim ke penyedia AI yang Anda hubungkan, dan Anda diberi tahu sebelum itu terjadi.';

  @override
  String get previewSaveFailed => 'Tidak bisa menyimpan itu. Coba lagi.';

  @override
  String get previewTitle => 'Periksa tangkapannya';

  @override
  String get previewImageFailed => 'Gambar itu tidak bisa dibuka.';

  @override
  String get previewHint =>
      'Pastikan teksnya terbaca dan tidak ada bagian penting yang terpotong.';

  @override
  String get previewRetake => 'Foto ulang';

  @override
  String get pasteTitle => 'Tempel teks';

  @override
  String get pasteHint =>
      'Tempel email, pesan, atau pemberitahuan yang enggan Anda baca sampai habis.';

  @override
  String get pasteFootnote =>
      'Apa pun yang memuat tanggal, jumlah, atau permintaan cocok untuk ini.';

  @override
  String get pasteEnough => 'Sepertinya sudah cukup untuk dikerjakan.';

  @override
  String get pasteMore =>
      'Sedikit teks lagi akan memberi hasil yang lebih baik.';

  @override
  String get reviewLoadFailed => 'Tangkapan ini tidak bisa dimuat.';

  @override
  String get reviewConfirmed => 'Dipastikan';

  @override
  String get reviewNeedsReview => 'Perlu diperiksa';

  @override
  String get reviewReview => 'Periksa';

  @override
  String get reviewHighConfidence => 'Keyakinan tinggi';

  @override
  String get reviewConfirmedByYou => 'Dipastikan oleh Anda';

  @override
  String get reviewMissing => 'Tidak ada';

  @override
  String get reviewNotUnderstood =>
      'Action tidak bisa memahami cukup banyak dari sumber ini dengan andal.';

  @override
  String get reviewNotUnderstoodBody =>
      'Tangkapannya utuh dan tidak ada yang hilang. Anda bisa mengisi datanya sendiri, dan sumbernya tetap terlampir sebagai rujukan.';

  @override
  String get reviewEnterDetails => 'Isi datanya';

  @override
  String get reviewKeepSource => 'Simpan sumbernya untuk nanti';

  @override
  String reviewEngine(String engine) {
    return 'Mesin: $engine';
  }

  @override
  String get reviewManualNotice =>
      'Anda sendiri yang membuat tugas ini. Hanya yang Anda isi di sini yang akan dipakai.';

  @override
  String get reviewUntitled => 'Tugas tanpa judul';

  @override
  String get reviewEditTitle => 'Ubah judul';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nilai perlu Anda periksa sebelum ini bisa dipastikan.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Fakta penting';

  @override
  String get reviewNotFound => 'Tidak ditemukan';

  @override
  String get reviewSuggestedNextStep => 'Saran langkah berikutnya';

  @override
  String get reviewWhyThisMatters => 'Kenapa ini penting';

  @override
  String get reviewSteps => 'Langkah';

  @override
  String get reviewAddStep => 'Tambah langkah';

  @override
  String get reviewInjectionNotice =>
      'Sebagian teks di sumber ini tampak seperti perintah, bukan fakta dokumen, jadi Action mengabaikannya.';

  @override
  String get reviewLayoutNotice =>
      'Tata letak dokumen ini mungkin memuat kaitan yang tidak sepenuhnya terjaga saat teks diambil. Bandingkan nilai di bawah dengan sumbernya sebelum memastikan.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Bandingkan nilai di bawah dengan sumbernya.';
  }

  @override
  String get reviewDeadline => 'Tenggat';

  @override
  String get reviewAmount => 'Jumlah';

  @override
  String get reviewLeftUnset => 'Tidak ada — Anda memilih membiarkannya kosong';

  @override
  String get reviewUnclear => 'Kurang jelas';

  @override
  String get reviewNotSet => 'Belum diisi';

  @override
  String get reviewNoDeadlineFound => 'Tidak ditemukan di dokumen ini';

  @override
  String get reviewNoAmountFound =>
      'Tidak ada jumlah yang ditemukan di dokumen ini';

  @override
  String get reviewMultipleDates =>
      'Action menemukan beberapa kemungkinan tanggal.';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count tanggal bisa jadi tenggatnya. Pilih yang benar, isi yang lain, atau biarkan kosong.';
  }

  @override
  String get reviewChooseDate => 'Pilih tanggal';

  @override
  String get reviewMultipleAmounts =>
      'Action menemukan lebih dari satu kemungkinan jumlah.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count jumlah bisa jadi yang dimaksud di sini. Pilih satu, isi yang lain, atau biarkan kosong.';
  }

  @override
  String get reviewChooseAmount => 'Pilih jumlah';

  @override
  String get reviewSkipStep => 'Lewati langkah ini';

  @override
  String get reviewKeepStep => 'Simpan langkah ini';

  @override
  String get reviewEditStep => 'Ubah langkah';

  @override
  String get reviewCreateManually => 'Buat sendiri';

  @override
  String get reviewConfirmAndCreate => 'Pastikan & buat tugasnya';

  @override
  String get reviewFixHighlighted => 'Periksa kolom yang ditandai';

  @override
  String get reviewSaving => 'Menyimpan…';

  @override
  String get reviewSaveFailed =>
      'Tugas ini tidak bisa disimpan. Tidak ada yang hilang — coba lagi.';

  @override
  String get reviewFieldTitle => 'Judul';

  @override
  String get reviewTitleHint => 'Apa yang perlu terjadi?';

  @override
  String get reviewNewStep => 'Langkah baru';

  @override
  String get reviewStepHint => 'Apa yang harus dilakukan';

  @override
  String get reviewDatesConflict =>
      'Dokumen ini menyebut lebih dari satu tanggal.';

  @override
  String get reviewAmountsConflict =>
      'Dokumen ini menyebut lebih dari satu jumlah.';

  @override
  String get reviewAnotherDate => 'Tanggal lain — 2026-08-30';

  @override
  String get reviewBadDate =>
      'Bukan tanggal yang sahih. Pakai format 2026-08-30.';

  @override
  String get reviewTypeDate =>
      'Ketik sebuah tanggal, atau biarkan kosong di bawah.';

  @override
  String get reviewUseThisDate => 'Pakai tanggal ini';

  @override
  String get reviewLeaveNoDeadline => 'Lanjut tanpa tenggat';

  @override
  String get reviewAnotherAmount => 'Jumlah lain — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'Jumlah ini tidak bisa dipakai: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Pakai jumlah ini';

  @override
  String get reviewLeaveNoAmount => 'Lanjut tanpa jumlah';

  @override
  String get reviewThisValue => 'Nilai ini';

  @override
  String reviewQuote(String quote) {
    return '“$quote”';
  }

  @override
  String get reviewSeeOnCapture => 'Lihat di tangkapannya';

  @override
  String get reviewViewSource => 'Lihat sumbernya';

  @override
  String get reviewFromSource => 'Dari sumber';

  @override
  String get reviewNotVerified => 'Belum dicocokkan';

  @override
  String get reviewCouldNotVerify =>
      'Tidak bisa mencocokkan ini dengan sumbernya.';

  @override
  String get reviewLooksRight => 'Tampak benar';

  @override
  String get reviewStageReading => 'Membaca sumber';

  @override
  String get reviewStageUnderstanding => 'Memahami rincian penting';

  @override
  String get reviewStageChecking => 'Memeriksa apa yang perlu ditinjau';

  @override
  String get reviewNothingToDo => 'Saat ini tidak ada yang perlu Anda lakukan.';

  @override
  String get reviewInformationOnly =>
      'Ini tampak sebagai informasi saja — tidak ditemukan tenggat, pembayaran, atau permintaan balasan.';

  @override
  String get reviewInformationOnlyWithSource =>
      'Ini tampak sebagai informasi saja — di tangkapan ini tidak ditemukan tenggat, pembayaran, atau permintaan balasan.';

  @override
  String get reviewSourceKept => 'Sumbernya tetap disimpan bagaimanapun.';

  @override
  String get reviewAddAnyway => 'Tetap tambahkan tugas';

  @override
  String get reviewActionConfirmed => 'Tugas dipastikan';

  @override
  String get reviewCreatedByYou => 'Dibuat oleh Anda.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dipastikan oleh Anda dari $count fakta yang diperiksa.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Dipastikan oleh Anda dari $count fakta yang diperiksa. Anda mengubah $edited di antaranya.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Disimpan di perangkat ini.';

  @override
  String get detailLoadFailed =>
      'Tugas ini tidak bisa dimuat. Tugas ini tetap tersimpan di perangkat ini.';

  @override
  String get detailNotFoundTitle => 'Tugas itu sudah tidak ada di sini';

  @override
  String get detailNotFoundMessage => 'Mungkin sudah dihapus di perangkat ini.';

  @override
  String get detailGoBack => 'Kembali';

  @override
  String get detailMore => 'Lainnya';

  @override
  String get detailChangeUrgency => 'Ubah tingkat mendesak';

  @override
  String get detailAddRecommendedStep => 'Tambah langkah yang disarankan';

  @override
  String get detailEditRecommendedStep => 'Ubah langkah yang disarankan';

  @override
  String get detailArchiveTitle => 'Arsipkan tugas ini?';

  @override
  String get detailArchiveBody =>
      'Tugas keluar dari daftar Anda tetapi tidak dihapus, dan tangkapan asalnya tetap disimpan.';

  @override
  String get detailArchiveConfirm => 'Arsipkan';

  @override
  String get detailArchived => 'Diarsipkan';

  @override
  String detailCompletedOn(String date) {
    return 'Selesai pada $date';
  }

  @override
  String get detailSectionDetails => 'Rincian';

  @override
  String get detailSectionReminders => 'Pengingat';

  @override
  String get detailAllStepsDone => 'Semua langkah selesai';

  @override
  String get detailNextEyebrow => 'Berikutnya';

  @override
  String get detailCompleteQuestion => 'Selesaikan tugas ini?';

  @override
  String get detailMarkStepDone => 'Tandai langkah selesai';

  @override
  String get detailCompleteAction => 'Selesaikan tugas ini';

  @override
  String get detailAddDeadline => 'Tambah tenggat';

  @override
  String get detailAddAmount => 'Tambah jumlah';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$completed dari $total selesai';
  }

  @override
  String get detailNoStepsTitle => 'Belum ada langkah';

  @override
  String get detailNoStepsMessage =>
      'Pecah ini menjadi gerakan yang memang harus Anda lakukan.';

  @override
  String get detailAddFirstStep => 'Tambah langkah pertama';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Langkah selesai: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Langkah berikutnya: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Langkah: $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'Tandai “$title” sebagai selesai';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'Tandai “$title” sebagai belum selesai';
  }

  @override
  String get detailStepOptions => 'Opsi langkah';

  @override
  String get detailMoveUp => 'Naikkan';

  @override
  String get detailMoveDown => 'Turunkan';

  @override
  String get detailDeleteStep => 'Hapus langkah';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'Hapus langkah ini?';

  @override
  String get stepDeleteKeep => 'Biarkan saja';

  @override
  String get detailNoRemindersYet => 'Belum ada pengingat.';

  @override
  String get detailReminderLimit =>
      'Itu jumlah pengingat terbanyak untuk satu tugas. Hapus satu untuk menambah yang lain.';

  @override
  String get detailAddReminder => 'Tambah pengingat';

  @override
  String get detailChangeReminder => 'Ubah pengingat';

  @override
  String get detailRemoveReminder => 'Hapus pengingat';

  @override
  String get detailReminderFormat => 'EEE d MMM, HH:mm';

  @override
  String get reminderStatePending => 'Belum disiapkan';

  @override
  String get reminderStateNotificationsOff =>
      'Tersimpan, tetapi notifikasi mati';

  @override
  String get reminderStateFailed => 'Tidak bisa dijadwalkan';

  @override
  String get reminderStateRemoving => 'Menghapus…';

  @override
  String get reminderSetConfirmation => 'Pengingat dipasang. Nanti kami colek.';

  @override
  String get reminderUpdatedConfirmation => 'Pengingat diperbarui.';

  @override
  String get reminderNeedsPermission =>
      'Notifikasi mati, jadi pengingat ini tersimpan tetapi belum bisa memberi tahu Anda.';

  @override
  String get reminderScheduleFailed =>
      'Pengingat ini tersimpan, tetapi Android tidak mau menjadwalkannya.';

  @override
  String get reminderLimitReached =>
      'Tugas itu sudah punya pengingat sebanyak batas maksimum.';

  @override
  String get reminderTimeInPast => 'Waktu itu sudah lewat.';

  @override
  String get reminderAddTitle => 'Tambah pengingat';

  @override
  String get reminderChangeTitle => 'Ubah pengingat ini';

  @override
  String get reminderDateLabel => 'Tanggal';

  @override
  String get reminderTimeLabel => 'Waktu';

  @override
  String get reminderFieldDateFormat => 'EEE d MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'EEEE d MMMM';

  @override
  String get reminderPresetFormat => 'd MMM, HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return 'Anda akan diingatkan pada $date pukul $time.';
  }

  @override
  String get reminderTimePastError =>
      'Waktu itu sudah lewat. Pilih yang lebih akhir.';

  @override
  String get reminderSet => 'Pasang pengingat';

  @override
  String get reminderPresetInHour => '1 jam lagi';

  @override
  String get reminderPresetTomorrowMorning => 'Besok pagi';

  @override
  String get reminderPresetNextWeek => 'Minggu depan';

  @override
  String get reminderPresetOnTheDay => 'Pada hari itu';

  @override
  String get reminderPresetDayBefore => '1 hari sebelumnya';

  @override
  String get reminderPresetWeekBefore => '1 minggu sebelumnya';

  @override
  String get reminderPresetAtDeadline => 'Saat tenggat';

  @override
  String get reminderPresetHourBefore => '1 jam sebelumnya';

  @override
  String get editNextStepTitle => 'Langkah berikutnya yang disarankan';

  @override
  String get editNextStepSubtitle =>
      'Satu kalimat pendek tentang gerakan berguna berikutnya.';

  @override
  String get editNextStepHint => 'Apa gerakan berguna berikutnya?';

  @override
  String get editRemoveSuggestion => 'Hapus saran';

  @override
  String get editUrgencyTitle => 'Seberapa mendesak ini?';

  @override
  String get editStepHint => 'Satu hal konkret untuk dikerjakan';

  @override
  String get editAddStep => 'Tambah langkah';

  @override
  String get editDateHint => 'TTTT-BB-HH';

  @override
  String get editRemoveDeadline => 'Hapus tenggat';

  @override
  String get editAmountHint => '96,40';

  @override
  String get editSaveAmount => 'Simpan jumlah';

  @override
  String get editRemoveAmount => 'Hapus jumlah';

  @override
  String get securityTitle => 'Keamanan & privasi';

  @override
  String get securitySectionProtection => 'Perlindungan';

  @override
  String get securityAppLockUnavailable =>
      'Kunci Aplikasi memerlukan kunci layar di perangkat ini. Atur dulu PIN, pola, sandi, atau sidik jari di pengaturan perangkat Anda.';

  @override
  String get securityAppLockOn =>
      'Action meminta perangkat Anda memastikan bahwa itu memang Anda.';

  @override
  String get securityAppLockOff =>
      'Wajibkan sidik jari, wajah, atau PIN perangkat untuk membuka Action.';

  @override
  String get securityAskAgain => 'Tanya lagi';

  @override
  String get securityAskAgainDescription =>
      'Berapa lama Action boleh berada di latar belakang sebelum terkunci.';

  @override
  String get securityScreenPrivacy => 'Privasi layar';

  @override
  String get securityScreenPrivacyDescription =>
      'Meminta Android memblokir tangkapan layar dan perekaman layar, serta menyembunyikan Action di pengalih aplikasi.';

  @override
  String get securityPrivateReminders => 'Pengingat privat';

  @override
  String get securityPrivateRemindersOn =>
      'Pengingat hanya menyebut bahwa ada yang menunggu Anda.';

  @override
  String get securityPrivateRemindersOff =>
      'Pengingat menampilkan judul tugas. Nyalakan ini agar judul itu tidak muncul di layar kunci.';

  @override
  String get securityLockNow => 'Kunci sekarang';

  @override
  String get securityLockNowDescription => 'Menutup pintu tanpa menunggu.';

  @override
  String get securitySectionStorage => 'Cara data Anda disimpan';

  @override
  String get securityStorageDataLabel =>
      'Tugas, tangkapan, dan pengaturan Anda';

  @override
  String get securityStorageDataDetail =>
      'Semuanya berada di penyimpanan privat milik aplikasi ini, yang tidak bisa dibaca aplikasi lain dan yang dienkripsi Android sebagai bagian dari enkripsi perangkat. Action tidak menambahkan lapisan kedua miliknya sendiri di atasnya.';

  @override
  String get securityStorageKeyLabel => 'Kunci penyedia AI Anda';

  @override
  String get securityStorageKeyDetail =>
      'Disimpan di Android Keystore, terpisah dari yang lain, dan tidak pernah ditampilkan lagi setelah Anda menyimpannya.';

  @override
  String get securityStorageGapLabel => 'Yang tidak tercakup';

  @override
  String get securityStorageGapDetail =>
      'Tidak satu pun dari itu melindungi dari orang yang memakai perangkat Anda dalam keadaan tidak terkunci, dan sistem yang dimodifikasi atau di-root bisa membaca lebih banyak daripada yang normal. Kunci Aplikasi adalah kendali yang membantu untuk hal pertama.';

  @override
  String get securitySectionInformation => 'Informasi Anda';

  @override
  String get securityWhereInfoDescription =>
      'Setiap jalur yang bisa ditempuh data Anda, dan dua yang keluar dari perangkat ini.';

  @override
  String get securityAppLockRefused =>
      'Tidak dikonfirmasi, jadi tidak ada yang berubah.';

  @override
  String get securityAppLockUnavailableToast =>
      'Perangkat ini belum punya kunci layar. Tambahkan PIN, pola, sandi, atau sidik jari di pengaturan perangkat, lalu coba lagi.';

  @override
  String get securityScreenPrivacyRefused =>
      'Perangkat ini tidak mau menerapkan privasi layar, jadi fitur itu dibiarkan mati alih-alih ditampilkan sebagai menyala.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pengingat terjadwal kini menyebut lebih sedikit.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pengingat terjadwal diperbarui.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Langsung';

  @override
  String get appLockDelayOneMinute => 'Setelah 1 menit';

  @override
  String get appLockDelayFiveMinutes => 'Setelah 5 menit';

  @override
  String get securityDelayImmediatelyDescription =>
      'Setiap kali Action meninggalkan layar';

  @override
  String get securityDelayOneMinuteDescription =>
      'Cukup untuk membalas satu pesan';

  @override
  String get securityDelayFiveMinutesDescription =>
      'Cukup untuk menerima satu telepon';

  @override
  String get securityHeroProtected => 'Terlindungi';

  @override
  String get securityHeroNothingOn => 'Belum ada yang menyala';

  @override
  String get securityHeroFootnote =>
      'Semua di sini bekerja di perangkat ini. Tidak ada satu pun pengaturan ini yang dikirim ke mana pun, dan tidak ada yang bisa diubah dari jarak jauh.';

  @override
  String get securityHeadlineNone => 'Ada tiga perlindungan yang tersedia';

  @override
  String securityHeadlineOne(String first) {
    return '$first menyala';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first dan $second menyala';
  }

  @override
  String get securityHeadlineAll => 'Ketiga perlindungan menyala';

  @override
  String get securityTransfersTitle => 'Yang sudah keluar dari perangkat ini';

  @override
  String get securityTransfersNoProvider =>
      'Tidak ada penyedia AI yang terhubung, jadi tidak ada apa pun yang sedang dikirim untuk dianalisis.';

  @override
  String get securityTransfersDescription =>
      'Dicatat di sini pada saat sesuatu dikirim, terlepas dari ada tidaknya balasan. Hanya alatnya, penyedianya, dan ukurannya — tidak pernah isinya. Disimpan 90 hari di perangkat ini dan tidak dikirim ke mana pun.';

  @override
  String get securityClear => 'Hapus';

  @override
  String get securityNothingSent => 'Belum ada yang dikirim';

  @override
  String get securityNothingSentDescription =>
      'Saat Anda menjalankan alat yang memakai penyedia AI Anda, alat itu akan tercantum di sini.';

  @override
  String get securityClearHistoryTitle => 'Hapus riwayat ini?';

  @override
  String get securityClearHistoryBody =>
      'Catatan tentang apa yang dikirim akan dihapus dari perangkat ini. Itu tidak membatalkan apa pun yang sudah terkirim.';

  @override
  String get securityUnnamedTool => 'Sebuah alat Intelligence';

  @override
  String get securityYourProvider => 'penyedia AI Anda';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count berkas',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'sepotong teks pendek';

  @override
  String securityTransferCharacters(int count) {
    return '$count ribu karakter';
  }

  @override
  String securitySentTo(String provider) {
    return 'Dikirim ke $provider.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'Dikirim ke $provider · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return '$count mgg lalu';
  }

  @override
  String get helpTitle => 'Bantuan';

  @override
  String get helpAddQuestion => 'Apa yang bisa saya tambahkan?';

  @override
  String get helpAddAnswer =>
      'Tangkapan layar, foto surat atau tagihan, atau teks yang Anda tempel. Yang paling cocok adalah apa pun yang memuat tanggal, jumlah, atau permintaan.';

  @override
  String get helpReviewQuestion => 'Kenapa Action meminta saya memeriksa?';

  @override
  String get helpReviewAnswer =>
      'Karena mesin yang membaca dokumen bisa salah baca, dan tenggat yang diam-diam keliru lebih buruk daripada tidak ada tenggat sama sekali. Action menunjukkan apa yang ditemukannya dan dari kata-kata mana, dan tidak ada yang disimpan sampai Anda menyetujuinya.';

  @override
  String get helpVaryQuestion =>
      'Kenapa hasilnya berubah kalau saya coba lagi?';

  @override
  String get helpVaryAnswer =>
      'Layanan yang membaca dokumen Anda tidak deterministik, jadi tangkapan yang sama bisa kembali sedikit berbeda. Itu juga sebabnya langkah pemeriksaan ada — Andalah bagian yang tidak berubah.';

  @override
  String get helpLateQuestion => 'Kenapa pengingat saya terlambat?';

  @override
  String get helpLateAnswer =>
      'Pengingat dijadwalkan lewat Android, dan Android yang menentukan kapan tepatnya mengirimkannya. Penghemat baterai, Doze, dan pengaturan daya dari pabrikan semuanya bisa menundanya. Action tidak pernah menjanjikan pengingat yang tepat ke menit.';

  @override
  String get helpDataQuestion => 'Di mana data saya?';

  @override
  String get helpDataAnswer =>
      'Hampir semuanya ada di perangkat ini: tangkapan, tugas, langkah, pengingat, dan pencarian Anda. Dua pengecualian — isi yang Anda minta dibaca Action dikirim ke layanan AI yang membacanya, dan catatan singkat sebuah tugas yang sudah dipastikan bisa disimpan di awan di bawah identitas anonim. Privasi & data di Pengaturan merinci persis apa isi catatan itu.';

  @override
  String get helpBackupQuestion => 'Apakah ini cadangan?';

  @override
  String get helpBackupAnswer =>
      'Tidak. Catatan di awan tidak bisa dipulihkan ke perangkat baru, dan tidak ada akun untuk masuk. Kalau Anda mencopot Action atau kehilangan perangkat ini, data di dalamnya hilang.';

  @override
  String get helpCorrectQuestion => 'Bagaimana saya membetulkan sebuah tugas?';

  @override
  String get helpCorrectAnswer =>
      'Buka tugas itu lalu ubah kolom mana pun — judul, tenggat, jumlah, atau langkah berikutnya yang disarankan. Anda bisa menambah, menyusun ulang, menyelesaikan, dan menghapus langkah kapan saja. Mengubah sebuah tugas tidak pernah menanyakan apa pun ke layanan AI.';

  @override
  String get privacyTitle => 'Privasi & data';

  @override
  String get privacyIntro =>
      'Action menyimpan sebanyak mungkin di perangkat ini. Dua hal adalah pengecualian, dan keduanya tercantum di bawah.';

  @override
  String get privacyGroupOnDevice => 'Di perangkat ini';

  @override
  String get privacyOnDeviceCaptures =>
      'Tangkapan — tangkapan layar, foto, dan teks yang Anda tambahkan, serta teks yang dibaca darinya.';

  @override
  String get privacyOnDeviceActions =>
      'Tugas, beserta langkah, faktanya, dan pengingatnya.';

  @override
  String get privacyOnDeviceSearch =>
      'Pencarian. Pencarian Anda berjalan di sini, tidak pernah dikirim ke mana pun, dan tidak disimpan setelah Anda menutup layarnya.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'Foto disimpan tanpa lokasinya. Koordinat, waktu, dan detail kamera yang ditulis ponsel ke dalam sebuah gambar dihapus sebelum tangkapan disimpan, jadi semua itu tidak tersimpan di sini dan tidak ikut terkirim saat Anda mengirim tangkapan ke penyedia AI Anda.';

  @override
  String get privacyGroupSentToRead => 'Dikirim untuk dibaca';

  @override
  String get privacySentToReadWhat =>
      'Saat Anda meminta Action menafsirkan sebuah tangkapan, isi itu dikirim ke layanan AI yang membacanya. Ini bukan AI di perangkat.';

  @override
  String get privacySentToReadWhen =>
      'Yang dikirim hanya tangkapan yang Anda pilih, dan hanya ketika Anda memintanya.';

  @override
  String get privacyGroupYourProvider => 'Dikirim ke penyedia AI Anda sendiri';

  @override
  String get privacyProviderWhat =>
      'Kalau Anda menghubungkan penyedia AI di Pengaturan, alat-alat Intelligence mengirim isi yang Anda pilih ke penyedia itu — OpenAI, Anthropic, Google, atau endpoint yang Anda pilih — memakai kunci API Anda sendiri.';

  @override
  String get privacyProviderDirect =>
      'Kiriman itu langsung ke mereka. Tidak melewati server mana pun milik Action.';

  @override
  String get privacyProviderScope =>
      'Yang dikirim hanya yang Anda pilih untuk sebuah alat, dan hanya ketika Anda menjalankannya. Tugas, tangkapan, dan sumber Anda yang lain tidak pernah ikut, dan tidak pernah ada yang dikirim di latar belakang.';

  @override
  String get privacyProviderKey =>
      'Kunci API Anda disimpan di penyimpanan aman perangkat ini dan hanya dikirim ke penyedia pemiliknya. Penyimpanan aman adalah penghalang nyata bagi siapa pun yang memegang perangkat Anda dalam keadaan tidak terkunci, tetapi tidak mutlak, dan Action tidak akan mengatakan sebaliknya.';

  @override
  String get privacyProviderLocalTools =>
      'Dua alat tidak pernah mengirim apa pun: menyembunyikan detail sensitif, dan memeriksa dari mana sebuah berkas berasal. Keduanya berjalan sepenuhnya di perangkat ini.';

  @override
  String get privacyProviderAgreement =>
      'Apa yang penyedia Anda lakukan dengan yang Anda kirim diatur oleh kesepakatan Anda dengan mereka, bukan oleh Action.';

  @override
  String get privacyGroupCloud => 'Disimpan di awan';

  @override
  String get privacyCloudWhat =>
      'Saat Anda memastikan sebuah tugas, catatan singkatnya bisa disimpan di bawah identitas anonim milik pemasangan ini: judul, status, tingkat mendesak, kategori, tenggat, jumlah, saran langkah berikutnya, dan penanda waktu.';

  @override
  String get privacyCloudNotSent =>
      'Tangkapan Anda, teks yang dibaca darinya, langkah dan fakta sebuah tugas, serta pengingat Anda tidak dikirim.';

  @override
  String get privacyCloudNotBackup =>
      'Ini bukan cadangan. Tidak ada cara memulihkannya ke perangkat baru, dan kehilangan pemasangan ini berarti kehilangan identitas anonimnya juga.';

  @override
  String get privacyGroupDiagnostics => 'Diagnostik';

  @override
  String get privacyDiagnosticsWhat =>
      'Action mencatat hitungan anonim tentang apa yang terjadi di aplikasi — bahwa sebuah tangkapan dimulai, bahwa sebuah ekstraksi berhasil atau tidak, bahwa sebuah pencarian tidak menemukan apa-apa, bahwa sebuah tugas diselesaikan.';

  @override
  String get privacyDiagnosticsCounts =>
      'Itu hitungan, bukan isi. Tidak pernah ada judul, jumlah, tenggat, nomor rujukan, teks tangkapan, atau kata pencarian yang ikut, begitu pula identitas anonim atau pengenal apa pun untuk sebuah tugas atau tangkapan.';

  @override
  String get privacyDiagnosticsCrash =>
      'Kalau aplikasi berhenti mendadak, galat dan tempat terjadinya dilaporkan supaya bisa diperbaiki. Action tidak melampirkan data Anda ke laporan itu.';

  @override
  String get privacySectionYourData => 'Data Anda';

  @override
  String get privacyYourDataFootnote =>
      'Menghapus tangkapan membiarkan tugas Anda tetap ada. Sebuah tugas yang tangkapannya sudah hilang tetap berfungsi; hanya saja ia tidak lagi menunjukkan asalnya.';

  @override
  String get privacyClearCaptures => 'Hapus tangkapan';

  @override
  String get privacyClearCapturesDescription =>
      'Menghapus setiap tangkapan beserta berkas gambarnya.';

  @override
  String get privacyDeleteAll => 'Hapus semua data saya';

  @override
  String get privacyDeleteAllDescription =>
      'Tugas, langkah, pengingat, tangkapan, dan catatan awan di atas.';

  @override
  String get privacyClearCapturesTitle => 'Hapus tangkapan?';

  @override
  String get privacyClearCapturesBody =>
      'Setiap tangkapan dan gambarnya akan dihapus dari perangkat ini. Tugas Anda tetap persis seperti sekarang.';

  @override
  String get privacyCapturesDeleted => 'Tangkapan dihapus.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Sebagian tangkapan tidak bisa dihapus. Tidak ada hal lain yang diubah.';

  @override
  String get privacyDeleteAllTitle => 'Hapus semua data Anda?';

  @override
  String get privacyDeleteAllBody =>
      'Ini menghapus setiap tugas, langkah, pengingat, dan tangkapan di perangkat ini, beserta catatan awan yang tercantum di atas. Tindakan ini tidak bisa dibatalkan, dan tidak ada cadangan untuk memulihkannya.';

  @override
  String get privacyDeleteEverything => 'Hapus semuanya';

  @override
  String get privacyDeletedAll => 'Semuanya sudah dihapus.';

  @override
  String get privacyDeleteFailed => 'Data Anda tidak bisa dihapus.';

  @override
  String get privacyDeletedUnverified =>
      'Semua yang ada di perangkat ini sudah dihapus. Action tidak bisa menjangkau awan untuk memastikan tidak ada yang tersisa di sana, dan akan memeriksa lagi.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'Terhapus, kecuali $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'Action akan mencoba lagi.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action tidak bisa menyelesaikan pemeriksaan awan, dan akan mencoba lagi.';

  @override
  String get privacyLeftoverCaptures => 'sebagian tangkapan';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count catatan awan',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first dan $second';
  }

  @override
  String get privacyCloudDeleted => 'Catatan awan sudah dihapus.';

  @override
  String get privacyCloudUnreachable =>
      'Masih belum bisa dijangkau. Action akan mencoba lagi.';

  @override
  String get privacyPendingTitle => 'Masih harus dihapus';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count catatan awan tidak bisa dijangkau terakhir kali. Action akan mencoba sendiri, atau Anda bisa mencoba sekarang.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Coba lagi';

  @override
  String get evidenceTitle => 'Asal muasalnya';

  @override
  String get evidenceUnverified =>
      'Action tidak menemukan kata-kata ini dalam teks yang dibacanya, jadi nilai ini belum dicocokkan. Bandingkan dengan aslinya sebelum Anda mengandalkannya.';

  @override
  String get evidenceHighlighted =>
      'Kata-kata ini ada dalam teks yang dibaca Action dari tangkapan ini, dan sorotannya menunjukkan letaknya.';

  @override
  String get evidenceNoRegion =>
      'Kata-kata ini ada dalam teks yang dibaca Action dari tangkapan ini. Letak persisnya pada gambar tidak bisa ditentukan, dan itu tidak ditebak-tebak.';

  @override
  String get evidenceInText =>
      'Kata-kata ini ada dalam teks yang dimuat tangkapan ini.';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'Kritis';

  @override
  String get urgencyImportant => 'Penting';

  @override
  String get urgencyNormal => 'Biasa';

  @override
  String get urgencyLow => 'Rendah';

  @override
  String get urgencyUnsure => 'Belum jelas';

  @override
  String get detailSaveFailed =>
      'Itu tidak tersimpan. Tidak ada yang hilang — coba lagi.';

  @override
  String get detailSectionCreatedFrom => 'Dibuat dari';

  @override
  String get detailSourceChecking => 'Mencari tangkapan aslinya…';

  @override
  String get detailSourceUnavailable =>
      'Tangkapan aslinya sudah tidak tersedia.';

  @override
  String get detailReopenAction => 'Buka lagi tugasnya';

  @override
  String get detailMarkActionComplete => 'Tandai tugas selesai';

  @override
  String get detailGetHelp => 'Dapatkan bantuan untuk ini';

  @override
  String get detailSectionHistory => 'Riwayat';

  @override
  String get detailHistoryShowLess => 'Tampilkan lebih sedikit';

  @override
  String detailHistoryShowAll(int count) {
    return 'Tampilkan semua $count entri';
  }

  @override
  String get detailHistoryCreated => 'Dibuat';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dibuat dengan $count langkah',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'Anda memastikan rinciannya';

  @override
  String detailHistoryStepFinished(String title) {
    return 'Menyelesaikan “$title”';
  }

  @override
  String get detailHistoryAStep => 'sebuah langkah';

  @override
  String get detailHistoryReminderSet => 'Anda memasang pengingat';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'Anda memasang pengingat untuk $when';
  }

  @override
  String get detailHistoryCompleted => 'Ditandai selesai';

  @override
  String get detailHistoryChanged => 'Terakhir diubah';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'Kustom (kompatibel dengan OpenAI)';

  @override
  String get aiCapabilityText => 'teks';

  @override
  String get aiCapabilityImages => 'gambar';

  @override
  String get aiCapabilityDocuments => 'dokumen';

  @override
  String get aiCapabilityStructuredResults => 'hasil terstruktur';

  @override
  String get aiCapabilityStreaming => 'keluaran bertahap';

  @override
  String get aiCapabilitySystemInstructions => 'instruksi sistem';

  @override
  String get aiCapabilityEvidenceCitations => 'kutipan bukti';

  @override
  String get aiCapabilityLongDocuments => 'dokumen panjang';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a atau $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head, atau $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'Hubungkan penyedia AI untuk memakai alat ini.';

  @override
  String get aiFailureInvalidKey =>
      'Kunci API itu tidak diterima oleh penyedianya.';

  @override
  String get aiFailureQuotaExceeded =>
      'Akun penyedia Anda kehabisan kredit atau sudah mencapai batas kuotanya.';

  @override
  String get aiFailureRateLimited =>
      'Penyedia Anda sedang membatasi laju permintaan. Coba lagi sebentar lagi.';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action tidak bisa menjangkau penyedia AI Anda. Periksa koneksi Anda.';

  @override
  String get aiFailureUnsupportedModel =>
      'Model itu tidak tersedia untuk kunci Anda. Pilih yang lain di Pengaturan.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'Model yang Anda pilih tidak bisa membaca $capabilities. Pilih model lain di Pengaturan.';
  }

  @override
  String get aiFailureContextTooLarge =>
      'Isi itu terlalu banyak untuk dibaca model ini sekaligus.';

  @override
  String get aiFailureInputTooLargeText =>
      'Teks itu lebih banyak daripada yang bisa dianalisis sekaligus.';

  @override
  String get aiFailureProviderUnavailable =>
      'Penyedia AI Anda sedang bermasalah. Coba lagi sebentar lagi.';

  @override
  String get aiFailureMalformedResponse =>
      'Penyedia itu mengirim balik sesuatu yang tidak bisa dibaca Action.';

  @override
  String get aiFailureCancelled => 'Dihentikan.';

  @override
  String get aiFailureInsecureEndpoint =>
      'Endpoint itu harus berupa alamat https://.';

  @override
  String get aiFailureUnknown =>
      'Ada yang tidak beres saat berkomunikasi dengan penyedia AI Anda.';

  @override
  String get appLockTitle => 'Action terkunci';

  @override
  String get appLockPrompt =>
      'Pastikan ini memang Anda untuk melanjutkan. Action bertanya kepada perangkat Anda — Action tidak pernah melihat sidik jari, wajah, atau PIN Anda.';

  @override
  String get appLockUnlocking => 'Membuka kunci…';

  @override
  String get appLockNotConfirmed =>
      'Itu tidak dikonfirmasi. Coba lagi saat Anda siap.';

  @override
  String get appLockCannotConfirm =>
      'Perangkat Anda saat ini tidak bisa memastikan bahwa ini memang Anda. Periksa apakah kunci layar masih diatur di pengaturan perangkat Anda.';

  @override
  String get appLockWaiting => 'Menunggu…';

  @override
  String get appLockUnlock => 'Buka kunci';

  @override
  String get appLockReasonUnlock => 'Buka kunci Action';

  @override
  String get appLockReasonEnable =>
      'Pastikan ini memang Anda sebelum menyalakan Kunci Aplikasi';

  @override
  String get appLockReasonDisable =>
      'Pastikan ini memang Anda sebelum mematikan Kunci Aplikasi';

  @override
  String get todayCapabilityHeading => 'Yang ditangani Action';

  @override
  String get todayCapabilityDocumentTitle => 'Sebuah surat atau tagihan';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action membacanya dan menemukan tenggat, jumlah, dan nomor referensinya.';

  @override
  String get todayCapabilityScreenshotTitle => 'Sebuah tangkapan layar';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'Ubah pesan yang akan Anda lupakan menjadi sesuatu yang bisa Anda kerjakan.';

  @override
  String get todayCapabilityTextTitle => 'Sepotong teks';

  @override
  String get todayCapabilityTextBlurb =>
      'Tempel apa saja. Action mengenali apa itu dan apa yang dimintanya dari Anda.';

  @override
  String get todayCapabilityConfirmTitle => 'Anda mengonfirmasi semuanya';

  @override
  String get todayCapabilityConfirmBlurb =>
      'Tidak ada yang menjadi tugas sampai Anda melihat buktinya dan menyetujuinya.';

  @override
  String get todayCapabilityExploreIntelligence => 'Jelajahi Kecerdasan';

  @override
  String get documentRejectedEmpty => 'Berkas itu kosong.';

  @override
  String documentRejectedTooLarge(String size) {
    return 'Dokumen itu berukuran $size, lebih besar dari yang bisa ditangani Action.';
  }

  @override
  String get documentRejectedNotAPdf =>
      'Itu bukan PDF, apa pun namanya. Action membaca PDF dan gambar.';

  @override
  String get documentRejectedUnreadable => 'Dokumen itu tidak bisa dibaca.';

  @override
  String get pdfRejectedNotAPdf => 'Berkas itu bukan PDF, apa pun namanya.';

  @override
  String get pdfRejectedEncrypted =>
      'PDF itu dilindungi kata sandi, jadi Action tidak bisa membacanya.';

  @override
  String get pdfRejectedDamaged =>
      'PDF itu tidak bisa dibaca. Mungkin isinya tidak lengkap.';

  @override
  String get shareRejectedEmpty =>
      'Tidak ada apa pun yang bisa dibaca di kiriman itu.';

  @override
  String get shareRejectedUnsupportedType =>
      'Action bisa menerima teks, gambar, dan PDF. Itu sesuatu yang lain.';

  @override
  String get shareRejectedContentMismatch =>
      'Berkas itu bukan jenis berkas seperti yang diakuinya, jadi Action tidak membukanya.';

  @override
  String get shareRejectedTooLarge =>
      'Berkas itu terlalu besar untuk ditangani Action.';

  @override
  String get shareRejectedUnreadable => 'Berkas itu tidak bisa dibaca.';

  @override
  String get captureFailureRecognition =>
      'Pengenalan teks tidak bisa dijalankan.';

  @override
  String get captureFailureImageFormat =>
      'Format gambar itu tidak bisa dibaca di perangkat ini.';

  @override
  String get connectSheetTitle => 'Hubungkan AI Anda';

  @override
  String get connectSheetSubtitle =>
      'Anda memakai akun penyedia dan kunci API Anda sendiri. Action menyimpan kunci itu di penyimpanan aman perangkat ini.';

  @override
  String get connectErrorKeyMissing =>
      'Tempel kunci API Anda untuk melanjutkan.';

  @override
  String get connectErrorModelMissing =>
      'Pilih sebuah model, atau ketik id model.';

  @override
  String get connectErrorEndpointMissing => 'Tambahkan alamat endpoint Anda.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'Penyimpanan aman perangkat ini tidak bisa dibuka, jadi kuncinya tidak tersimpan.';

  @override
  String get connectTestSucceeded => 'Terhubung.';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'Terhubung. $count model tersedia.';
  }

  @override
  String get connectProviderLabel => 'Penyedia';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'Harus berupa alamat https://. Action tidak akan mengirim dokumen Anda lewat koneksi yang tidak terenkripsi.';

  @override
  String get connectApiKeyLabel => 'Kunci API';

  @override
  String get connectApiKeyHint => 'Tempel kunci Anda';

  @override
  String get connectKeyPrivacyNote =>
      'Kunci Anda tetap di perangkat ini. Action tidak pernah mengirimnya ke mana pun kecuali ke penyedia yang Anda pilih, dan tidak bisa menampilkannya lagi kepada Anda setelah disimpan.';

  @override
  String get connectModelLabel => 'Model';

  @override
  String get connectModelIdHint => 'Id model';

  @override
  String get connectModelFreeTextNote =>
      'Penyedia menghentikan id model lama dan menambahkan yang baru. Kalau yang Anda mau tidak ada dalam daftar, ketik di sini.';

  @override
  String get connectAndTest => 'Hubungkan dan uji';

  @override
  String get connectSaveWithoutTesting => 'Simpan tanpa menguji';

  @override
  String get toolWarningFactsNotChecked =>
      'Action tidak bisa membandingkan ini dengan teks aslinya, jadi jumlah dan tanggal di dalamnya belum diperiksa.';

  @override
  String get toolTitleRewrite => 'Perbaiki tulisan ini';

  @override
  String get toolDescriptionRewrite =>
      'Lebih jelas, lebih pendek, atau lebih resmi — faktanya tetap utuh.';

  @override
  String get toolModeRewriteClearer => 'Lebih jelas';

  @override
  String get toolModeRewriteProfessional => 'Lebih profesional';

  @override
  String get toolModeRewriteShorter => 'Lebih pendek';

  @override
  String get toolModeRewritePersuasive => 'Lebih persuasif';

  @override
  String get toolModeRewriteSimpler => 'Lebih sederhana';

  @override
  String get toolModeRewriteStructured => 'Lebih terstruktur';

  @override
  String get toolModeRewriteGrammarOnly => 'Tata bahasa saja';

  @override
  String get toolSectionWhatChanged => 'Yang berubah';

  @override
  String get toolSectionNote => 'Catatan';

  @override
  String get toolSectionAlreadyClearBody =>
      'Ini sudah jelas. Perubahan di bawah ini kecil saja.';

  @override
  String get toolSectionImprovedText => 'Teks yang diperbaiki';

  @override
  String get toolTitleDraftReply => 'Susun draf balasan';

  @override
  String get toolDescriptionDraftReply =>
      'Sebuah balasan yang bisa Anda ubah dan kirim sendiri.';

  @override
  String get toolModeReplyProfessional => 'Profesional';

  @override
  String get toolModeReplyConcise => 'Ringkas';

  @override
  String get toolModeReplyFriendly => 'Ramah';

  @override
  String get toolModeReplyFormal => 'Resmi';

  @override
  String get toolModeReplyClarification => 'Minta penjelasan';

  @override
  String get toolModeReplyConfirmation => 'Konfirmasi penerimaan';

  @override
  String get toolModeReplyDispute => 'Sanggah ini';

  @override
  String get toolSectionSubject => 'Subjek';

  @override
  String get toolSectionDraftReply => 'Draf balasan';

  @override
  String get toolSectionPlaceholders => 'Ini harus Anda isi';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'Draf — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'Ini sebuah draf. Action tidak mengirim apa pun — baca, ubah, lalu kirim sendiri.';

  @override
  String get toolTitleTranslate => 'Terjemahkan';

  @override
  String get toolDescriptionTranslate =>
      'Bahasa lain, dengan angka dan nama tetap utuh.';

  @override
  String get toolSectionTranslation => 'Terjemahan';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return 'Dari $from ke $to';
  }

  @override
  String get toolSectionKeptInOriginal => 'Dibiarkan seperti aslinya';

  @override
  String get toolWarningTranslationNotCertified =>
      'Terjemahan untuk memahami isinya, bukan terjemahan tersumpah.';

  @override
  String get toolTitleStructuredData => 'Ambil tabel';

  @override
  String get toolDescriptionStructuredData =>
      'Baris, isian, dan angka yang bisa Anda salin.';

  @override
  String get toolSectionTable => 'Tabel';

  @override
  String get toolSectionFields => 'Isian';

  @override
  String get toolSectionTableCsv => 'Tabel (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'Tata letak kolom tabel ini tidak bisa dibaca dengan andal. Periksa apakah barisnya sejajar sebelum Anda memakainya.';

  @override
  String get toolTitleDeadlineFinder => 'Temukan tenggat';

  @override
  String get toolDescriptionDeadlineFinder =>
      'Apa yang jatuh tempo, kapan, dan apa yang terjadi kalau tidak.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tenggat',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'Tidak ada yang jatuh tempo';

  @override
  String get toolSectionNothingDueBody =>
      'Action tidak menemukan tenggat atau kewajiban dalam materi ini.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'Tidak ada yang dijadwalkan sampai Anda memilihnya. Pengingat tidak pernah dipasang secara otomatis.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'Kalau tidak: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'Anda perlu: $items';
  }

  @override
  String get moneyErrorEmpty => 'tidak ada jumlah yang diisi';

  @override
  String get moneyErrorMalformed => 'jumlahnya bukan angka biasa';

  @override
  String get moneyErrorNegative =>
      'jumlah negatif bukan jumlah yang bisa dibayarkan';

  @override
  String get moneyErrorTooManyDecimals =>
      'angka desimalnya lebih banyak daripada yang dimiliki mata uangnya';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'kode mata uangnya tidak kami kenali';

  @override
  String get moneyErrorOutOfRange => 'besarnya jumlah itu tidak masuk akal';

  @override
  String get escalationOcrFailed =>
      'Pengenalan sama sekali tidak bisa dijalankan pada tangkapan ini.';

  @override
  String get escalationNoTextRecognised =>
      'Ini tampak seperti dokumen, tetapi tidak ada teks yang dikenali.';

  @override
  String get escalationThinText =>
      'Teks yang dikenali jauh terlalu sedikit untuk dokumen sebesar ini.';

  @override
  String get escalationLowLineConfidence =>
      'Pengenal melaporkan keyakinan rendah pada beberapa baris.';

  @override
  String get escalationTableLikeLayout =>
      'Tata letaknya tampak seperti tabel, dan membacanya baris demi baris menghilangkan kaitan nilai mana milik baris mana.';

  @override
  String get escalationFragmentedLayout =>
      'Teksnya kembali sebagai banyak potongan kecil, jadi strukturnya tidak jelas.';

  @override
  String get escalationMalformedText =>
      'Banyak dari teks yang dikenali bukan kata atau angka yang bisa dibaca.';

  @override
  String get escalationConflictingDates =>
      'Lebih dari satu tanggal disajikan sebagai tenggat.';

  @override
  String get escalationConflictingAmounts =>
      'Lebih dari satu jumlah disajikan sebagai jumlah yang harus dibayar.';

  @override
  String get escalationUnresolvedGrounding =>
      'Sebagian nilai tidak bisa dicocokkan dengan teks dokumen.';

  @override
  String get escalationInstructionLikeContent =>
      'Dokumen ini memuat teks yang ditulis seolah-olah perintah untuk aplikasi. Teks itu diperlakukan sebagai isi dokumen, tidak pernah sebagai perintah.';

  @override
  String get providerFailureNetwork =>
      'Action tidak bisa menjangkau layanannya. Periksa koneksi Anda.';

  @override
  String get providerFailureTimedOut => 'Layanan itu terlalu lama menjawab.';

  @override
  String get providerFailureServiceUnavailable =>
      'Layanan itu sedang tidak tersedia untuk sementara. Coba lagi nanti.';

  @override
  String get providerFailureUnauthorized =>
      'Aplikasi ini saat ini tidak berwenang memakai layanan itu.';

  @override
  String get providerFailureBlocked =>
      'Layanan itu menolak memproses dokumen ini.';

  @override
  String get providerFailureUnknown =>
      'Action tidak bisa membaca dokumen ini. Mencoba lagi mungkin berhasil.';

  @override
  String get reviewBlockerTitle => 'Beri tugas ini sebuah judul.';

  @override
  String get reviewBlockerDate =>
      'Pilih tanggal mana yang merupakan tenggat sebenarnya, atau biarkan kosong.';

  @override
  String get reviewBlockerAmount =>
      'Pilih jumlah mana yang benar, atau biarkan kosong.';

  @override
  String get reviewBlockerStepTitle => 'Langkah yang Anda simpan perlu judul.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'halaman $page',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'halaman $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Teks hasilnya tidak lagi memuat $values. Periksa dulu sebelum Anda memakainya.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Teks hasilnya tidak lagi memuat $values dan $count lainnya. Periksa dulu sebelum Anda memakainya.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'Tercapai';

  @override
  String get goalNewSheetTitle => 'Apa yang ingin Anda wujudkan?';

  @override
  String get goalNewSheetSubtitle =>
      'Satu kalimat sudah cukup. Rinciannya bisa Anda tambahkan nanti.';

  @override
  String get goalTitleHint => 'Perpanjang asuransi mobil tanpa bayar lebih.';

  @override
  String get goalCreateAction => 'Buat sasaran';

  @override
  String get goalTitleSheetTitle => 'Yang Anda inginkan';

  @override
  String get goalOutcomeSheetTitle => 'Seperti apa kalau selesai';

  @override
  String get goalContextSheetTitle => 'Posisinya sekarang';

  @override
  String get goalOutcomeHint =>
      'Mobilnya sudah diasuransikan dan surat-suratnya sudah beres.';

  @override
  String get goalContextHint =>
      'Saya sudah punya dua penawaran dan perpanjangannya jatuh pada tanggal 18.';

  @override
  String get goalWorkspaceTitle => 'Sasaran';

  @override
  String get goalUnmarkReached => 'Ternyata belum tercapai';

  @override
  String get goalMarkReached => 'Tandai tercapai';

  @override
  String get goalNotFound => 'Sasaran itu sudah tidak ada di sini.';

  @override
  String get goalDeleteTitle => 'Hapus sasaran ini?';

  @override
  String get goalDeleteBody =>
      'Sasaran ini dihapus dari perangkat ini. Semua tugas yang dibuat darinya tetap persis seperti sekarang.';

  @override
  String get goalOutcomeLabel => 'Seperti apa selesainya';

  @override
  String get goalOutcomeEmpty =>
      'Belum ditulis. Sebuah sasaran lebih mudah direncanakan kalau Anda sudah menyebutkan apa arti menyelesaikannya.';

  @override
  String get goalContextLabel => 'Sejauh mana sekarang';

  @override
  String get goalContextEmpty =>
      'Belum ada yang ditulis. Apa yang sudah terjadi sejauh ini, dan apa yang menghalangi.';

  @override
  String get goalTitleLabel => 'Apa yang Anda inginkan';

  @override
  String get goalEditTooltip => 'Ubah sasaran';

  @override
  String get goalToolsLabel => 'Yang bisa dilakukan Action';

  @override
  String get goalToolsNotReady =>
      'Tulis sedikit lebih banyak tentang apa yang Anda inginkan, dan alat-alat ini akan punya bahan untuk dikerjakan.';

  @override
  String get toolGoalOptimizerTitle => 'Pertajam sasaran';

  @override
  String get toolActionPlanTitle => 'Susun rencana';

  @override
  String get resultFactUnconfirmed => 'Belum terkonfirmasi';

  @override
  String get resultSuggestedSteps => 'Saran langkah';

  @override
  String get resultSuggestedAction => 'Saran tugas';

  @override
  String get resultWorthAsking => 'Layak ditanyakan';

  @override
  String get resultSuggestedDeadlines => 'Saran tenggat';

  @override
  String get resultSuggestions => 'Yang disarankan';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kutipan pendukung',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'Dari sumber yang dipilih';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => 'Menyiapkan dokumen Anda';

  @override
  String get toolRunStageReading => 'Membaca halaman yang dipilih';

  @override
  String get toolRunStageAnalysing => 'Menganalisis';

  @override
  String get toolRunStageBuilding => 'Menyusun tinjauan Anda';

  @override
  String get toolRunStageDone => 'Selesai';

  @override
  String get toolRunStageFailed => 'Itu tidak sampai selesai';

  @override
  String get toolRunStageCancelled => 'Dihentikan';

  @override
  String get toolRunFailureLocalCheckFailed => 'Itu tidak bisa diperiksa.';

  @override
  String get toolRunFailureProviderRetired =>
      'Penyedia AI itu sudah tidak tersedia di versi ini.';

  @override
  String get toolRunFailureUnusableReply =>
      'Balasan itu tidak kembali dalam bentuk yang bisa dipakai. Coba lagi.';

  @override
  String get toolRunFailureQuestionRequired => 'Ketik pertanyaannya dulu.';

  @override
  String get toolRunFailureInputRequired =>
      'Pilih sesuatu untuk dikerjakan alat ini.';

  @override
  String get toolWarningReplyTruncated =>
      'Balasan ini terpotong, jadi isinya mungkin tidak lengkap.';

  @override
  String get toolWarningNoSupportingQuotes =>
      'Model Anda tidak mengembalikan satu pun kutipan pendukung, jadi tidak ada satu pun di sini yang didukung bukti. Bandingkan dengan dokumennya sebelum Anda menindaklanjutinya.';

  @override
  String get aiSettingsRemoveTitle => 'Hapus koneksi ini?';

  @override
  String get aiSettingsRemoveBody =>
      'Action akan menghapus kunci API Anda dari perangkat ini dan berhenti memakai fitur AI. Akun Anda di penyedia itu tidak terpengaruh.';

  @override
  String get aiSettingsProviderLabel => 'Penyedia';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'Yang menagih Anda atas pemakaian adalah penyedia Anda. Action tidak pernah mengirim permintaan atas kehendaknya sendiri.';

  @override
  String get aiSettingsConnectLabel => 'Hubungkan penyedia AI';

  @override
  String get aiSettingsConnectDescription =>
      'Pakai akun dan kunci API Anda sendiri dengan OpenAI, Anthropic, Google Gemini, atau endpoint yang kompatibel.';

  @override
  String get aiSettingsModelLabel => 'Model';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'Kunci API';

  @override
  String get aiSettingsKeyStored =>
      'Disimpan di penyimpanan aman perangkat ini.';

  @override
  String get aiSettingsKeyMissing =>
      'Tidak ada kunci yang ditemukan di perangkat ini. Hubungkan lagi untuk menambahkannya.';

  @override
  String get aiSettingsTestLabel => 'Uji koneksi';

  @override
  String get aiSettingsProviderUnavailable =>
      'Penyedia itu tidak tersedia di versi ini.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'Terhubung. $count model tersedia.';
  }

  @override
  String get aiSettingsTestButton => 'Uji';

  @override
  String get aiSettingsChangeProvider => 'Ubah penyedia atau model';

  @override
  String get aiSettingsRemoveKey => 'Hapus kunci';

  @override
  String get aiSettingsSectionPrivacy => 'Privasi';

  @override
  String get aiSettingsWhatGetsSentLabel => 'Yang dikirim';

  @override
  String get aiSettingsWhereItGoesLabel => 'Ke mana perginya';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'Tidak ada yang dikirim sampai Anda menghubungkan sebuah penyedia.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'Langsung ke $provider, memakai kunci Anda. Tidak melewati server mana pun milik Action.';
  }

  @override
  String get aiSettingsSectionData => 'Data';

  @override
  String get aiSettingsDataFootnote =>
      'Action mengingat alat mana yang Anda pakai, tidak pernah pada apa Anda memakainya.';

  @override
  String get aiSettingsRecentToolsLabel => 'Alat yang baru dipakai';

  @override
  String get aiSettingsRecentToolsNone => 'Tidak ada';

  @override
  String get reminderNotificationTitle => 'Pengingat Action';

  @override
  String get reminderNotificationPrivateBody =>
      'Ada sesuatu yang perlu Anda periksa.';

  @override
  String get reminderChannelName => 'Pengingat Action';

  @override
  String get reminderChannelDescription =>
      'Pengingat yang Anda pasang sendiri untuk tugas-tugas Anda.';

  @override
  String get onboardingStart => 'Mulai pakai Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'Langkah $current dari $total';
  }

  @override
  String get onboardingCaptureTitle => 'Ubah informasi menjadi tugas';

  @override
  String get onboardingCaptureBody =>
      'Tambahkan tangkapan layar, foto, atau teks yang dikirim kepada Anda. Action membacanya dan mengetahui apa yang diminta dari Anda.';

  @override
  String get onboardingReviewTitle =>
      'Tidak ada yang disimpan sampai Anda memastikannya';

  @override
  String get onboardingReviewBody =>
      'Action menunjukkan apa yang ditemukannya dan dari kata-kata mana. Anda membetulkan apa pun yang salah. Sampai Anda memastikannya, itu masih saran — bukan fakta, dan bukan tugas.';

  @override
  String get onboardingTrackingTitle => 'Tetap tahu apa yang penting';

  @override
  String get onboardingTrackingBody =>
      'Perlu perhatian menampilkan lebih dulu apa yang terlambat atau sudah dekat. Setiap tugas menyimpan langkah berikutnya, kemajuannya, dan pengingat apa pun yang Anda pasang untuknya.';

  @override
  String get onboardingPrivacyBody => 'Perlu Anda ketahui sebelum mulai:';

  @override
  String get onboardingPrivacyOnDevice =>
      'Tugas, tangkapan, pengingat, dan pencarian Anda disimpan di perangkat ini. Pencarian dan pengingat berfungsi tanpa koneksi.';

  @override
  String get onboardingPrivacySentToRead =>
      'Saat Anda meminta Action membaca sesuatu, isi itu dikirim ke layanan AI yang menafsirkannya.';

  @override
  String get onboardingPrivacyCloud =>
      'Catatan singkat sebuah tugas yang sudah dipastikan — judulnya, tanggalnya, jumlahnya, dan saran langkahnya — bisa disimpan di awan di bawah identitas anonim untuk perangkat ini. Tangkapan, langkah, dan pengingat Anda tidak.';

  @override
  String get onboardingPrivacyNotBackup =>
      'Catatan itu bukan cadangan. Catatan itu tidak bisa memulihkan apa pun ke perangkat baru.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count penghambat',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'Bisa lebih sederhana';

  @override
  String get toolDescriptionGoalOptimizer =>
      'Apa yang kurang, apa yang menghambat, apa yang harus dilakukan lebih dulu.';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'Setelah: $step';
  }

  @override
  String get toolSectionThePlan => 'Rencananya';

  @override
  String get toolDescriptionActionPlan =>
      'Serangkaian langkah berurutan yang bisa Anda ubah menjadi tugas.';

  @override
  String get toolTitleSmartChecklist => 'Buat daftar periksa';

  @override
  String get toolDescriptionSmartChecklist =>
      'Semua yang diminta dari Anda, secara berurutan.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rincian yang kurang',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'Ini saling bertentangan';

  @override
  String get toolTitleMissingInformation => 'Apa yang kurang';

  @override
  String get toolDescriptionMissingInformation =>
      'Bagian yang kurang, dan apa yang perlu ditanyakan tentangnya.';

  @override
  String get aiAdapterTimedOut => 'Itu terlalu lama dan dihentikan.';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'Koneksi aman ke penyedia AI Anda gagal.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action tidak dapat menemukan model atau endpoint itu.';

  @override
  String get aiAdapterRequestRejected =>
      'Penyedia AI Anda menolak permintaan itu.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action tidak bisa membuka penyimpanan aman perangkat ini.';

  @override
  String get aiAdapterEndpointMissing =>
      'Tambahkan alamat endpoint AI Anda di Pengaturan.';

  @override
  String get aiAdapterReplyIncomplete =>
      'Balasan itu tidak lengkap. Coba lagi.';

  @override
  String get aiAdapterContentDeclined =>
      'Penyedia Anda menolak memproses isi itu.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'Itu lebih dari $limit berkas sekaligus. Pilih lebih sedikit.';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'Salah satu gambar itu terlalu besar untuk dianalisis.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '“$filename” terlalu besar untuk dianalisis. Batasnya $limit MB.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '“$filename” punya $count halaman. Action membaca paling banyak $limit sekaligus — pilih rentangnya.';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'Pilihan itu terlalu besar untuk dikirim dalam satu permintaan.';

  @override
  String get toolRunNotAvailableTitle => 'Alat itu tidak tersedia';

  @override
  String get toolRunNotAvailableMessage =>
      'Mungkin sudah dihapus di versi Action yang lebih baru.';

  @override
  String get toolRunNoSourcesYet =>
      'Belum ada yang bisa dikerjakan. Tangkap sesuatu, atau tempel teks di bawah.';

  @override
  String get toolRunChooseSourcesToCompare => 'Pilih apa yang mau dibandingkan';

  @override
  String get toolRunChooseSource => 'Pilih sebuah sumber';

  @override
  String get toolRunQuestionLabel => 'Pertanyaan Anda';

  @override
  String get toolRunQuestionHint => 'Kapan tenggatnya?';

  @override
  String get toolRunFreeTextLabel => 'Atau tempel teks';

  @override
  String get toolRunFreeTextHint => 'Tempel atau ketik di sini';

  @override
  String get toolRunModeLabel => 'Gaya';

  @override
  String get toolRunRunLocally => 'Periksa di perangkat ini';

  @override
  String get toolRunRun => 'Jalankan';

  @override
  String get toolRunStop => 'Hentikan';

  @override
  String get toolRunRunAgain => 'Jalankan lagi';

  @override
  String get toolRunWorkingOn => 'Sedang mengerjakan';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'Kirim ini ke $provider?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'Isi yang Anda pilih akan dikirim ke $provider untuk diproses, memakai kunci API Anda.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'Kunci Anda tetap di perangkat ini. Action tidak mengirim apa pun di latar belakang, dan tidak mengirim tugas atau sumber Anda yang lain.';

  @override
  String get toolRunScopeTitle => 'Sebelum ini dijalankan';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    return '$_temp0 akan dianalisis memakai koneksi $provider Anda.';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count berkas',
    );
    return '$_temp0 akan dianalisis memakai koneksi $provider Anda.';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'Teks yang Anda pilih akan dikirim ke koneksi $provider Anda.';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'Hubungkan penyedia AI untuk memakai alat ini';

  @override
  String get toolRunNeedsProviderBody =>
      'Anda memakai akun penyedia dan kunci API Anda sendiri.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count langkah',
    );
    return 'Tugas dibuat dari $_temp0.';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count langkah ditambahkan.',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count langkah',
    );
    return 'Buat tugas · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count langkah',
    );
    return 'Tambahkan ke tugas ini · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'Foto';

  @override
  String get sourceTypeLabelScreenshot => 'Tangkapan layar';

  @override
  String get sourceTypeLabelPastedText => 'Catatan tempelan';

  @override
  String get sourceTypeLabelDocument => 'Dokumen';

  @override
  String get toolModeClearer => 'Lebih jelas';

  @override
  String get toolModeMoreProfessional => 'Lebih profesional';

  @override
  String get toolModeShorter => 'Lebih pendek';

  @override
  String get toolModeSimpler => 'Lebih sederhana';

  @override
  String get toolModeMoreStructured => 'Lebih terstruktur';

  @override
  String get toolModeMorePersuasive => 'Lebih meyakinkan';

  @override
  String get toolModeGrammarOnly => 'Tata bahasa saja';

  @override
  String get toolModeProfessional => 'Profesional';

  @override
  String get toolModeConcise => 'Ringkas';

  @override
  String get toolModeFriendly => 'Ramah';

  @override
  String get toolModeFormal => 'Formal';

  @override
  String get toolModeAskForClarification => 'Minta penjelasan';

  @override
  String get toolModeConfirm => 'Konfirmasi';

  @override
  String get toolModeDispute => 'Sanggah ini';

  @override
  String get toolModeQuick => 'Sekilas';

  @override
  String get toolModeDetailed => 'Terperinci';

  @override
  String get toolModeExecutive => 'Eksekutif';

  @override
  String get toolModeKeyPoints => 'Poin utama';

  @override
  String get toolModeActionFocused => 'Fokus tugas';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count rincian yang dikutip tidak ditemukan dalam apa yang Anda pilih, jadi rincian itu ditandai belum pasti.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action tidak bisa memeriksa kutipan-kutipan ini dengan berkasnya sendiri, jadi kutipan-kutipan itu belum dicocokkan.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Terlambat · $count hari',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'Jatuh tempo besok';

  @override
  String get triageBadgeReminderSoon => 'Pengingat sebentar lagi';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Terlambat $count hari',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status. $title';
  }

  @override
  String get triageExplanationDone => 'Ini sudah selesai.';

  @override
  String get triageExplanationNothingPressing =>
      'Ini ada di sini karena belum ada hal yang mendesak padanya.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'Ini perlu perhatian karena $reason.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'Ini ada lebih ke bawah karena $reason.';
  }

  @override
  String get triageReasonOverdue => 'sudah terlambat';

  @override
  String get triageReasonDeadlinePassed => 'tenggatnya sudah lewat';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sudah terlambat $count hari',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'jatuh tempo hari ini';

  @override
  String get triageReasonCriticalDueSoon =>
      'Anda menandainya kritis dan tenggatnya sudah dekat';

  @override
  String get triageReasonAllStepsDone =>
      'semua langkahnya sudah selesai — tinggal diselesaikan';

  @override
  String get triageReasonDueTomorrow => 'jatuh tempo besok';

  @override
  String get triageReasonReminderSoon =>
      'Anda memasang pengingat untuknya dalam sehari ke depan';

  @override
  String get triageReasonDueWithinThreeDays => 'jatuh tempo dalam tiga hari';

  @override
  String get triageReasonCriticalNoDeadline =>
      'Anda menandainya kritis, dan ini tidak punya tenggat';

  @override
  String get triageReasonDueWithinSevenDays => 'jatuh tempo dalam seminggu';

  @override
  String get triageReasonImportant => 'Anda menandainya penting';

  @override
  String get triageReasonDueLater => 'tenggatnya masih lebih jauh';

  @override
  String get triageReasonNoDeadline =>
      'ini tidak punya tenggat dan tidak ada yang mendesak';

  @override
  String cardCompletedTooltip(String title) {
    return 'Selesai: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'Pahami dokumen ini';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'Apa ini, apa yang penting, dan apa yang harus dilakukan tentangnya.';

  @override
  String get toolSectionWhatThisIs => 'Apa ini';

  @override
  String get toolSectionWhatMatters => 'Apa yang penting';

  @override
  String get toolSectionKeyDetails => 'Rincian penting';

  @override
  String get toolTitleAskDocument => 'Tanya tentang sebuah sumber';

  @override
  String get toolDescriptionAskDocument =>
      'Jawaban yang berpijak pada apa yang Anda pilih — atau tidak ada sama sekali.';

  @override
  String get toolSectionNoAnswer => 'Tidak ada jawaban dalam materi ini';

  @override
  String get toolSectionNoAnswerBody =>
      'Action tidak menemukan itu dalam dokumen yang dipilih.';

  @override
  String get toolSectionAnswer => 'Jawaban';

  @override
  String get toolSectionFromTheDocument => 'Dari dokumen';

  @override
  String get toolWarningQuoteNotFound =>
      'Kutipan yang mendasari jawaban ini tidak ada dalam materi yang dipilih. Perlakukan jawaban ini sebagai tidak dapat diandalkan.';

  @override
  String get toolTitleSmartSummary => 'Buat ringkasan';

  @override
  String get toolDescriptionSmartSummary =>
      'Versi singkatnya — atau bagian yang mengubah apa yang harus Anda lakukan.';

  @override
  String get toolSectionKeyPoints => 'Poin utama';

  @override
  String get toolTitleCompareDocuments => 'Bandingkan dokumen';

  @override
  String get toolDescriptionCompareDocuments =>
      'Apa yang berubah, apa yang bertentangan, apa yang tidak ada.';

  @override
  String get toolSectionWhatDiffers => 'Apa yang berbeda';

  @override
  String get toolSectionConflicts => 'Pertentangan';

  @override
  String get toolSectionOnlyInOne => 'Hanya ada di salah satunya';

  @override
  String get toolSectionInCommon => 'Yang sama-sama ada';

  @override
  String get sensitiveKindEmail => 'Alamat email';

  @override
  String get sensitiveKindPhone => 'Nomor telepon';

  @override
  String get sensitiveKindPaymentCard => 'Nomor kartu pembayaran';

  @override
  String get sensitiveKindIban => 'Rekening bank (IBAN)';

  @override
  String get sensitiveKindNationalId => 'Nomor identitas nasional';

  @override
  String get sensitiveKindPostcode => 'Kode pos';

  @override
  String get sensitiveKindAccountNumber => 'Nomor rekening';

  @override
  String get sensitiveKindReference => 'Nomor referensi';

  @override
  String get sensitiveKindDateOfBirth => 'Tanggal lahir';

  @override
  String get sensitiveKindUrl => 'Alamat web';

  @override
  String get verdictVerifiedProvenance =>
      'Tersedia asal-usul yang terverifikasi';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'Berkas ini memuat tanda tangan yang diperiksa dan lolos.';

  @override
  String get verdictSignalsSynthetic =>
      'Indikasi yang konsisten dengan konten yang dihasilkan AI';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'Berkas ini menyatakan dirinya dibuat dengan alat generatif. Metadata bisa diubah atau dihapus, jadi ini adalah klaim berkas itu sendiri, bukan bukti.';

  @override
  String get verdictSignalsEdited =>
      'Indikasi yang konsisten dengan konten yang telah diedit';

  @override
  String get verdictSignalsEditedExplainer =>
      'Berkas ini menyatakan dirinya pernah melewati perangkat lunak penyuntingan. Itu lazim untuk foto dan dengan sendirinya tidak berarti ada yang dipalsukan.';

  @override
  String get verdictNoReliableProvenance =>
      'Tidak ditemukan asal-usul yang andal';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'Tidak ada informasi asal-usul di dalam berkas ini. Itu normal — sebagian besar layanan menghapusnya — dan itu bukan pertanda apa pun.';

  @override
  String get verdictInconclusive => 'Tidak konklusif';

  @override
  String get verdictInconclusiveExplainer =>
      'Informasi di sini tidak cukup untuk menyatakan dari mana ini berasal.';

  @override
  String get authenticitySignalCamera => 'Kamera';

  @override
  String get authenticitySignalSoftware => 'Perangkat lunak';

  @override
  String get authenticitySignalDescription => 'Deskripsi';

  @override
  String get authenticitySignalCopyright => 'Hak cipta';

  @override
  String get authenticitySignalLocation => 'Lokasi';

  @override
  String get authenticitySignalLocationValue =>
      'Data lokasi ada di dalam berkas ini.';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'Tidak diperiksa — versi ini tidak memiliki pemverifikasi tanda tangan.';

  @override
  String get authenticitySignalFile => 'Berkas';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'Tidak bisa dibaca sebagai gambar.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'Bukan format gambar yang dikenali.';

  @override
  String get authenticitySignalText => 'Teks';

  @override
  String get authenticitySignalTextValue =>
      'Teks saja tidak bisa menunjukkan dengan andal apakah AI dipakai. Action tidak menebak-nebak.';

  @override
  String get fileTypePng => 'gambar PNG';

  @override
  String get fileTypeJpeg => 'gambar JPEG';

  @override
  String get fileTypeGif => 'gambar GIF';

  @override
  String get fileTypeWebp => 'gambar WebP';

  @override
  String get fileTypeWav => 'rekaman WAV';

  @override
  String get fileTypePdf => 'dokumen PDF';

  @override
  String get fileTypeHeic => 'gambar HEIC';

  @override
  String get fileTypeVideo => 'berkas video';

  @override
  String get fileTypeTiff => 'gambar TIFF';

  @override
  String get fileTypeBitmap => 'gambar bitmap';

  @override
  String get fileTypeRtf => 'dokumen RTF';

  @override
  String get fileTypeZip => 'arsip Zip';

  @override
  String get fileTypeGzip => 'arsip gzip';

  @override
  String get fileTypeSevenZip => 'arsip 7-Zip';

  @override
  String get fileTypeRar => 'arsip RAR';

  @override
  String get fileTypeWindowsProgram => 'program Windows';

  @override
  String get fileTypeLinuxProgram => 'program Linux';

  @override
  String get fileTypePostScript => 'dokumen PostScript';

  @override
  String get fileTypeOgg => 'rekaman Ogg';

  @override
  String get fileTypeMp3 => 'rekaman MP3';

  @override
  String get fileTypePlainText => 'teks biasa';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'Berkas ini bernama \".$extension\" tetapi isinya $contents. Itu bisa saja kekeliruan yang tidak disengaja, dan itu juga cara sebuah berkas berakhir dibuka oleh sesuatu selain yang Anda kira.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count byte',
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
  String get credentialKindPrivateKey => 'Kunci privat';

  @override
  String get credentialKindApiKey => 'Kunci API';

  @override
  String get credentialKindConnectionString => 'String koneksi';

  @override
  String get credentialKindAccessToken => 'Token akses';

  @override
  String get credentialKindAuthorizationHeader => 'Header Authorization';

  @override
  String get credentialKindPasswordOrKey => 'Kata sandi atau kunci';

  @override
  String get credentialKindPossibleSecret => 'Kemungkinan rahasia';

  @override
  String get credentialAdvicePrivateKey =>
      'Hapus ini sebelum dibagikan, dan ganti pasangan kuncinya. Sebuah kunci privat tidak bisa dibuat aman lagi setelah pernah terlihat.';

  @override
  String get credentialAdviceProviderApiKey =>
      'Cabut kunci ini di penyedianya dan terbitkan yang baru. Menghapusnya dari dokumen tidak menonaktifkannya.';

  @override
  String get credentialAdviceConnectionString =>
      'Ini memuat kata sandi sekaligus alamat yang dibukanya. Ganti kata sandinya kalau ini sudah pernah dibagikan.';

  @override
  String get credentialAdviceJsonWebToken =>
      'Token seperti ini sering kedaluwarsa, tetapi tidak selalu. Perlakukan sebagai masih aktif kecuali Anda tahu kapan masa berlakunya habis.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'Hapus nilai header-nya. Log permintaan yang ditempel adalah salah satu cara paling umum sebuah token yang masih berfungsi terbagikan tanpa sengaja.';

  @override
  String get credentialAdviceKeyedAssignment =>
      'Pindahkan ini ke variabel lingkungan atau penyimpanan rahasia, dan ganti nilainya kalau berkasnya sudah pernah dibagikan.';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action tidak bisa memastikan ini apa. Periksa sebelum dibagikan — ini sama mungkinnya berupa sebuah pengenal atau sebuah checksum.';

  @override
  String get credentialLabelAnthropicApiKey => 'Kunci API Anthropic';

  @override
  String get credentialLabelOpenAiProjectKey => 'Kunci proyek OpenAI';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'Kunci API bergaya OpenAI';

  @override
  String get credentialLabelGoogleApiKey => 'Kunci API Google';

  @override
  String get credentialLabelGoogleOAuthToken => 'Token OAuth Google';

  @override
  String get credentialLabelGitHubToken => 'Token GitHub';

  @override
  String get credentialLabelSlackToken => 'Token Slack';

  @override
  String get credentialLabelAwsAccessKeyId => 'ID kunci akses AWS';

  @override
  String get credentialLabelGitLabToken => 'Token GitLab';

  @override
  String get credentialLabelNpmToken => 'Token npm';

  @override
  String get credentialLabelPassphrase => 'Frasa sandi';

  @override
  String get credentialLabelPassword => 'Kata sandi';

  @override
  String get credentialLabelRefreshToken => 'Token refresh';

  @override
  String get credentialLabelToken => 'Token';

  @override
  String get credentialLabelClientSecret => 'Rahasia klien';

  @override
  String get credentialLabelCredential => 'Kredensial';

  @override
  String get credentialLabelSecret => 'Rahasia';

  @override
  String get linkVerdictNoObviousSignals => 'Tidak ada indikasi yang mencolok';

  @override
  String get linkVerdictWorthChecking => 'Layak diperiksa';

  @override
  String get linkVerdictTreatWithCaution => 'Perlakukan dengan hati-hati';

  @override
  String get linkSummaryNoObviousSignals =>
      'Tidak ada yang tidak biasa pada cara tautan ini ditulis. Itu tidak sama dengan mengetahui bahwa halamannya layak dipercaya — hanya Anda yang bisa menilai apakah Anda memang mengharapkannya.';

  @override
  String get linkSummaryWorthChecking =>
      'Ada satu hal pada tautan ini yang layak dilihat sebelum Anda membukanya.';

  @override
  String get linkSummaryTreatWithCaution =>
      'Ada beberapa hal pada cara tautan ini ditulis yang layak diperiksa sebelum Anda membukanya.';

  @override
  String get linkSignalNotHttps => 'Tidak terenkripsi';

  @override
  String get linkSignalNonWebScheme => 'Bukan tautan web';

  @override
  String get linkSignalEmbeddedCredentials => 'Kata sandi di dalam tautan';

  @override
  String get linkSignalMisleadingAuthority => 'Alamat asli tersembunyi';

  @override
  String get linkSignalIpLiteralHost => 'Alamat numerik';

  @override
  String get linkSignalPunycodeHost => 'Karakter terkode dalam nama';

  @override
  String get linkSignalMixedScriptHost => 'Campuran abjad dalam nama';

  @override
  String get linkSignalEncodedHost => 'Kode escape dalam nama';

  @override
  String get linkSignalUnusualPort => 'Port tidak biasa';

  @override
  String get linkSignalDeepSubdomain => 'Banyak bagian dalam nama';

  @override
  String get linkSignalPublicSuffixInSubdomain =>
      'Nama familier di tempat yang salah';

  @override
  String get linkSignalShortener => 'Tautan yang dipendekkan';

  @override
  String get linkSignalExecutableTarget => 'Mengunduh sebuah program';

  @override
  String get linkSignalRedirectParameter => 'Mengarahkan Anda ke tempat lain';

  @override
  String get linkSignalVeryLongUrl => 'Sangat panjang';

  @override
  String get linkSignalUnparseable => 'Tidak terbaca sebagai tautan';

  @override
  String get linkDetailNotHttps =>
      'Tautan ini memakai http, jadi apa pun yang Anda ketik di halamannya bisa terbaca dalam perjalanan ke sana.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'Ini dibuka dengan \"$scheme:\", bukan sebagai halaman web. Ini bisa saja meminta aplikasi lain melakukan sesuatu.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'Nama pengguna dan kata sandi tertulis di dalam tautan ini. Ke mana pun tautan ini dibagikan, keduanya ikut.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'Semua yang ada sebelum \"@\" diabaikan oleh peramban. Tujuan sebenarnya adalah \"$host\".';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'Ini menuju \"$host\" — alamat mentah, bukan sebuah nama. Situs yang sah hampir selalu memakai nama.';
  }

  @override
  String get linkDetailPunycodeHost =>
      'Nama situs ini memuat karakter non-Latin yang disimpan dalam bentuk terkode. Ini normal untuk banyak bahasa, dan ini juga cara sebuah nama bisa dibuat tampak seperti nama yang sudah dikenal.';

  @override
  String get linkDetailMixedScriptHost =>
      'Nama situs ini mencampur huruf Latin dengan huruf dari abjad lain yang tampak sama. Bacalah karakter demi karakter.';

  @override
  String get linkDetailEncodedHost =>
      'Nama situs ini memuat kode escape, padahal di situ bukan tempatnya. Kode itu bisa menyembunyikan apa yang sebenarnya tertulis pada nama itu.';

  @override
  String linkDetailUnusualPort(String port) {
    return 'Ini terhubung di port $port, bukan port yang biasa. Itu lazim untuk server uji dan tidak biasa untuk situs publik.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Nama ini punya $count bagian. Hanya dua bagian terakhir yang menentukan siapa yang menjalankan situsnya; sisanya bisa diisi apa saja.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'Nama ini memuat \".$suffix.\" di tengahnya, yang membuat bagian awalnya tampak seperti situsnya. Situsnya sebenarnya adalah \"$host\".';
  }

  @override
  String get linkDetailShortener =>
      'Layanan pemendek tautan menyembunyikan tujuan sebenarnya. Anda tidak bisa mengetahui ke mana ini menuju tanpa membukanya.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'Tautan ini berakhiran \"$fileExtension\", jadi yang diunduh adalah sesuatu yang bisa berjalan di perangkat Anda, bukan halaman untuk dibaca.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'Tautan ini membawa alamat kedua di pengaturan \"$parameter\"-nya, jadi membukanya bisa membawa Anda ke tempat selain \"$host\".';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'Tautan panjang lebih sulit dibaca, dan bagian yang menentukan tujuannya bisa terdorong keluar dari pandangan.';

  @override
  String get linkDetailUnparseable =>
      'Action tidak bisa membaca ini sebagai alamat web. Berhati-hatilah dengan tautan yang tidak tampak seperti tautan.';

  @override
  String get toolTitleRedaction => 'Sembunyikan detail sensitif';

  @override
  String get toolDescriptionRedaction =>
      'Temukan apa yang tidak seharusnya dibagikan, lalu buat salinan yang bersih.';

  @override
  String get toolSectionRedactionNothingToScan =>
      'Tidak ada yang bisa dipindai';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'Alat ini membaca teks. Pilih sebuah catatan, pesan yang ditempel, atau tangkapan yang teksnya sudah dibaca.';

  @override
  String get toolSectionRedactionNothingFound =>
      'Tidak ditemukan apa pun yang mencolok';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action tidak menemukan alamat email, nomor telepon, nomor kartu, atau nomor referensi dalam teks ini.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hal yang layak disembunyikan',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'Salinan dengan detail yang dihapus';

  @override
  String get toolWarningRedactionCoverage =>
      'Ini menemukan pola seperti email, nomor telepon, dan nomor rekening. Ini tidak akan menangkap semua yang sensitif — baca salinannya sebelum Anda membagikannya.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action tidak bisa menghapus detail sensitif dari gambar atau berkas PDF. Menutupi sesuatu di dalam gambar akan menyisakan aslinya di baliknya, jadi opsi itu tidak ditawarkan.';

  @override
  String get toolTitleAuthenticity => 'Periksa dari mana ini berasal';

  @override
  String get toolDescriptionAuthenticity =>
      'Apa yang dinyatakan sebuah berkas tentang asal-usulnya sendiri.';

  @override
  String get toolSectionAuthenticityNothingToInspect =>
      'Tidak ada yang bisa ditelaah';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'Pilih sebuah gambar atau sepotong teks.';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'Apa yang dikatakan berkas ini tentang dirinya sendiri';

  @override
  String get toolSectionAuthenticityFileItself => 'Berkasnya sendiri';

  @override
  String get toolSectionFileContents => 'Isi';

  @override
  String get toolSectionFileUnknownFormat =>
      'Bukan format yang dikenali Action';

  @override
  String get toolSectionFileSize => 'Ukuran';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'Ini melaporkan apa yang dinyatakan sebuah berkas tentang dirinya sendiri. Metadata bisa diubah atau dihilangkan, jadi tidak satu pun dari itu merupakan bukti. Jangan pakai ini untuk menuduh siapa pun.';

  @override
  String get toolTitleCredentialScanner => 'Cari kunci dan kata sandi';

  @override
  String get toolDescriptionCredentialScanner =>
      'Temukan kredensial sebelum Anda membagikan sesuatu.';

  @override
  String get toolSectionCredentialNothingToCheck =>
      'Tidak ada yang bisa diperiksa';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'Tempel sepotong teks, atau pilih tangkapan yang teksnya sudah dibaca. Alat ini hanya membaca teks.';

  @override
  String get toolSectionCredentialNoneFound => 'Tidak ditemukan kredensial';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action tidak menemukan apa pun yang berbentuk kunci API, kunci privat, token, atau kata sandi dalam teks ini.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kredensial ditemukan',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hal yang mungkin merupakan rahasia',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'Salinan dengan kredensial yang dihapus';

  @override
  String get toolWarningCredentialRevoke =>
      'Menghapus sebuah kunci dari dokumen tidak menonaktifkannya. Kalau salah satu dari ini sudah pernah dibagikan, cabut kunci itu di penyedianya dan terbitkan yang baru.';

  @override
  String get toolWarningCredentialCoverage =>
      'Ini menemukan kredensial yang bentuknya dikenali. Kata sandi yang ditulis lepas di dalam kalimat tidak akan ditemukan, jadi baca juga teksnya.';

  @override
  String get toolTitleLinkInspector => 'Periksa sebuah tautan';

  @override
  String get toolDescriptionLinkInspector =>
      'Apa yang tersingkap dari sebuah alamat sebelum Anda membukanya.';

  @override
  String get toolSectionLinkNoneFound => 'Tidak ditemukan tautan';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'Tempel sebuah tautan, atau pilih tangkapan yang memuatnya.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tautan dalam teks ini',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'Tidak terbaca';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary. $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'Tidak ada yang tidak biasa pada cara semua ini ditulis';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'Itu tidak sama dengan mengetahui bahwa halaman-halamannya layak dipercaya. Hanya Anda yang bisa menilai apakah Anda memang mengharapkannya.';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action hanya membaca alamatnya. Alat ini tidak membuka tautannya, tidak mencari tahu situsnya, dan tidak memeriksa layanan reputasi mana pun — melakukan itu akan mengirim aktivitas penjelajahan Anda ke suatu tempat.';

  @override
  String get toolWarningLinkNoSignals =>
      'Tautan tanpa indikasi apa pun tetap bisa berbahaya. Ini menemukan masalah pada cara sebuah alamat ditulis, dan itu bukan segala hal yang perlu diketahui tentang ke mana tautan itu menuju.';

  @override
  String get toolSectionObjective => 'Apa yang Anda inginkan';

  @override
  String get toolSectionCurrentState => 'Sejauh mana sekarang';

  @override
  String get toolSectionRecommendedNextStep =>
      'Langkah berikutnya yang disarankan';

  @override
  String get toolSectionCredentialAdvice => 'Yang harus Anda lakukan';

  @override
  String get toolSectionSummary => 'Ringkasan';

  @override
  String get toolDetailSeparator => ' · ';
}
