// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppL10nTr extends AppL10n {
  AppL10nTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonDone => 'Bitti';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonBack => 'Geri';

  @override
  String get commonRetry => 'Yeniden dene';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonRemove => 'Çıkar';

  @override
  String get commonContinue => 'Devam';

  @override
  String get commonOpen => 'Aç';

  @override
  String get commonCopy => 'Kopyala';

  @override
  String get commonCopied => 'Kopyalandı';

  @override
  String get commonEdit => 'Düzenle';

  @override
  String get commonAdd => 'Ekle';

  @override
  String get commonOn => 'Açık';

  @override
  String get commonOff => 'Kapalı';

  @override
  String get commonUnknown => 'Bilinmiyor';

  @override
  String get commonChecking => 'Kontrol ediliyor…';

  @override
  String get commonSettings => 'Ayarlar';

  @override
  String get commonDismiss => 'Kapat';

  @override
  String get commonUndo => 'Geri al';

  @override
  String get commonSkip => 'Atla';

  @override
  String get commonNotNow => 'Şimdi değil';

  @override
  String get commonSomethingWentWrong => 'Bir şeyler ters gitti.';

  @override
  String get navToday => 'Bugün';

  @override
  String get navLibrary => 'Kitaplık';

  @override
  String get navIntelligence => 'Zekâ';

  @override
  String get navSearch => 'Ara';

  @override
  String get navCapture => 'Bir şey yakala';

  @override
  String get todayGreetingMorning => 'Günaydın';

  @override
  String get todayGreetingAfternoon => 'İyi günler';

  @override
  String get todayGreetingEvening => 'İyi akşamlar';

  @override
  String get todayDateFormat => 'd MMMM · EEEE';

  @override
  String get todayActionsLoadFailed =>
      'Görevleriniz yüklenemedi. Hepsi hâlâ bu cihazda saklı.';

  @override
  String get todaySectionNeedsAttention => 'İlgi bekliyor';

  @override
  String get todaySectionAlsoNeedsAttention => 'Bunlar da ilgi bekliyor';

  @override
  String get todaySectionWaitingForReview => 'İnceleme bekliyor';

  @override
  String get todaySectionComingUp => 'Yaklaşanlar';

  @override
  String todaySeeAllCaptures(int count) {
    return '$count yakalamanın tümünü gör';
  }

  @override
  String get todaySeeAllInLibrary => 'Tümünü Kitaplıkta gör';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tamam',
      one: '1 tamam',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count görev tamamlandı. Kitaplığı aç.',
      one: '1 görev tamamlandı. Kitaplığı aç.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'ŞUNUNLA BAŞLA';

  @override
  String get todayQuickPhoto => 'Fotoğraf';

  @override
  String get todayQuickScreenshot => 'Ekran görüntüsü';

  @override
  String get todayQuickText => 'Metin';

  @override
  String get todayQuickTools =>
      'Bir bağlantıyı inceleyin veya bir metindeki anahtarları bulun';

  @override
  String get briefBadgeNeedsYou => 'SİZİ BEKLİYOR';

  @override
  String get briefBadgeToReview => 'İNCELENECEK';

  @override
  String get briefBadgeAhead => 'İLERİDE';

  @override
  String get briefBadgeStartHere => 'BURADAN BAŞLA';

  @override
  String get briefBadgeClear => 'BOŞ';

  @override
  String get briefNext => 'SONRAKİ';

  @override
  String briefOpenAction(String title) {
    return '$title öğesini aç';
  }

  @override
  String briefMarkDone(String title) {
    return '\"$title\" görevini tamamlandı olarak işaretle';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count görev ilginizi bekliyor',
      one: '1 görev ilginizi bekliyor',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yakalama da inceleme bekliyor.',
      one: '1 yakalama da inceleme bekliyor.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yakalama sizi bekliyor',
      one: '1 yakalama sizi bekliyor',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'Gecikmiş bir şey yok.';

  @override
  String get briefHeadlineNothingToday => 'Bugün sizi bekleyen bir şey yok';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count görev yaklaşıyor.',
      one: '1 görev yaklaşıyor.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'Hepsini bitirdiniz';

  @override
  String get briefDetailClear => 'Süresi gelen de bekleyen de yok.';

  @override
  String get briefHeadlineFirstRun => 'Herhangi bir şeyle başlayın';

  @override
  String get briefDetailFirstRun =>
      'Bir mektup, bir ekran görüntüsü, bir not — Action ne olduğunu kendisi çözer.';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsSectionPersonalise => 'Kişiselleştirme';

  @override
  String get settingsAppearance => 'Görünüm';

  @override
  String get settingsAppearanceDescription =>
      'Açık, koyu ya da cihaz ne yapıyorsa o.';

  @override
  String get settingsLanguageDescription => 'Action\'ın sizinle konuştuğu dil.';

  @override
  String get appearanceSystem => 'Sistem';

  @override
  String get appearanceLight => 'Açık';

  @override
  String get appearanceDark => 'Koyu';

  @override
  String get appearanceSystemDescription => 'Cihaz ayarını izle';

  @override
  String get appearanceLightDescription => 'Her zaman açık';

  @override
  String get appearanceDarkDescription => 'Her zaman koyu';

  @override
  String get languageTitle => 'Dil';

  @override
  String get languageSubtitle =>
      'Değişiklikler hemen uygulanır. Hiçbir yere bir şey gönderilmez; seçim bu cihazda saklanır.';

  @override
  String get languageSectionChoose => 'Bir dil seçin';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get languageSystemDescription => 'Cihazın dilini izle';

  @override
  String get languageDraftNote =>
      'Action\'ın metinleri İngilizce yazıldı. Diğer çeviriler sabit bir sözlüğe göre hazırlandı ve otomatik olarak denetlendi; henüz ana dili o dil olan biri okumadı. İfadenin tam olması önemli olduğu yerlerde — gizlilik, güvenlik, Action\'ın neyi iddia edip neyi etmediği — referans İngilizce olarak kalır.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action yapay zekâ olmadan da çalışır. Kendi sağlayıcınızı bağlamak belge çözümleme, planlama ve taslak yazma araçlarını ekler.';

  @override
  String get settingsAiProvider => 'Yapay zekâ sağlayıcısı';

  @override
  String get settingsAiNotConnected =>
      'Bağlı değil. Kendi hesabınızı ve API anahtarınızı kullanın.';

  @override
  String settingsAiConnected(String provider) {
    return '$provider bağlı.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'Gizlilik ve güvenlik';

  @override
  String get settingsSecurity => 'Güvenlik';

  @override
  String get settingsWhereInfoLives => 'Bilgileriniz nerede duruyor';

  @override
  String get settingsWhereInfoLivesDescription =>
      'Bu cihazda ne kalıyor, ne kalmıyor.';

  @override
  String get protectionAppLock => 'Uygulama Kilidi';

  @override
  String get protectionScreenPrivacy => 'ekran gizliliği';

  @override
  String get protectionPrivateReminders => 'içeriksiz hatırlatıcılar';

  @override
  String get protectionSummaryNone =>
      'Uygulama Kilidi, ekran gizliliği ve bu cihazdan ne çıktığı.';

  @override
  String protectionSummaryOne(String first) {
    return '$first açık.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first ve $second açık.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second ve $third açık.';
  }

  @override
  String get settingsSectionReminders => 'Hatırlatıcılar';

  @override
  String get settingsRemindersFootnote =>
      'Pil ayarlarına ve cihazın nasıl kullanıldığına bağlı olarak Android bir hatırlatıcıyı belirlediğiniz saatten biraz sonra gösterebilir.';

  @override
  String get settingsNotifications => 'Bildirimler';

  @override
  String get settingsNotificationsOnDescription =>
      'Kurduğunuz hatırlatıcılar gösterilebilir.';

  @override
  String get settingsNotificationsOffDescription =>
      'Action için kapalı, bu yüzden hatırlatıcılar görünmez.';

  @override
  String get settingsNotificationsUnknown => 'Denetlenemedi.';

  @override
  String get settingsNotificationsAllowed => 'İzin verildi';

  @override
  String get settingsOpenSystemSettings => 'Ayarları aç';

  @override
  String get settingsActionFootnote =>
      'Action dağınık bilgiyi açık sonraki adımlara dönüştürür. Kaydedilmeden önce her şeyi siz onaylarsınız.';

  @override
  String get settingsHelp => 'Yardım';

  @override
  String get settingsHelpDescription => 'Action nasıl çalışır ve neyi yapmaz.';

  @override
  String get settingsVersion => 'Sürüm';
}
