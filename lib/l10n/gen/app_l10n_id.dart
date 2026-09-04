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
}
