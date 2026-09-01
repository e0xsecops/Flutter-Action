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
}
