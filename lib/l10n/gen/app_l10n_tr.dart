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

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'Az önce';

  @override
  String relativeMinutes(int count) {
    return '$count dk önce';
  }

  @override
  String relativeHours(int count) {
    return '$count sa önce';
  }

  @override
  String get relativeYesterday => 'Dün';

  @override
  String relativeDays(int count) {
    return '$count gün önce';
  }

  @override
  String get libraryTitle => 'Kitaplık';

  @override
  String get librarySubtitle =>
      'Action\'ın sizin için sakladığı her şey. Ve hepsi bu cihazda kalır.';

  @override
  String get librarySegmentActions => 'Görevler';

  @override
  String get librarySegmentCaptures => 'Yakalamalar';

  @override
  String get librarySegmentGoals => 'Hedefler';

  @override
  String get librarySegmentDone => 'Bitenler';

  @override
  String get libraryNewGoal => 'Yeni hedef';

  @override
  String get libraryNoGoalsTitle => 'Henüz hedef yok';

  @override
  String get libraryNoGoalsMessage =>
      'Hedef, gerçekleşmesini istediğiniz şeydir. Action neyin eksik olduğunu, neyin engellediğini ve önce ne yapılacağını bulabilir.';

  @override
  String get libraryNoDoneTitle => 'Henüz tamamlanan bir şey yok';

  @override
  String get libraryNoDoneMessage => 'Bitirdiğiniz görevler burada saklanır.';

  @override
  String get libraryNoOpenTitle => 'Açık görev yok';

  @override
  String get libraryNoOpenMessage =>
      'Bir şey yakalayın, Action ne yapılması gerektiğini çıkarsın.';

  @override
  String get libraryNoCapturesTitle => 'Henüz yakalanan bir şey yok';

  @override
  String get libraryNoCapturesMessage =>
      'Eklediğiniz fotoğraflar, ekran görüntüleri ve metinler önce buraya iner. Siz istemeden hiçbir şey çözümlenmez.';

  @override
  String get libraryGoalNoActions => 'Bundan henüz bir şey çıkmadı';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bu hedeften $count görev',
      one: 'Bu hedeften 1 görev',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Görevlerde ve yakalamalarda ara';

  @override
  String get searchClear => 'Temizle';

  @override
  String get searchPrivacyNote =>
      'Arama bu cihazda yapılır. Buraya yazdığınız hiçbir şey cihazdan çıkmaz.';

  @override
  String get searchYouCanSearch => 'ŞUNLARDA ARAYABİLİRSİNİZ';

  @override
  String get searchFieldTitles => 'Başlıklar';

  @override
  String get searchFieldTitlesExample => 'Araç sigortasını yenile';

  @override
  String get searchFieldReferences => 'Referans numaraları';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Kurumlar';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Bir görevin içindeki adımlar';

  @override
  String get searchFieldStepsExample => 'Formu yükle';

  @override
  String get searchFieldCaptureText => 'Bir yakalamadan okunan metin';

  @override
  String get searchFieldCaptureTextExample => 'yenileme bildirimi';

  @override
  String searchNoMatchesTitle(String query) {
    return '\"$query\" için sonuç yok';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Daha az sözcük deneyin ya da referans numarasını göründüğü gibi tam yazın.';

  @override
  String get searchNoMatchesClearFilters =>
      'Daha az sözcük deneyin ya da filtreleri temizleyin.';

  @override
  String get searchFilterActive => 'Açık';

  @override
  String get searchFilterCompleted => 'Tamamlanan';

  @override
  String get searchFilterOverdue => 'Gecikmiş';

  @override
  String get searchFilterThisWeek => 'Bu hafta';

  @override
  String get searchFilterCritical => 'Kritik';

  @override
  String get searchFilterCreatedByYou => 'Sizin oluşturduğunuz';

  @override
  String get searchFilterArchived => 'Arşivlenmiş';

  @override
  String get searchFilterClear => 'Filtreleri temizle';

  @override
  String get searchIncompleteActions =>
      'Görevlerinizde arama yapılamadı, bu yüzden bu sonuçlar eksik olabilir.';

  @override
  String get searchIncompleteCaptures =>
      'Yakalamalarınızda arama yapılamadı, bu yüzden bu sonuçlar eksik olabilir.';

  @override
  String get searchIncompleteBoth =>
      'Ne görevlerinizde ne de yakalamalarınızda arama yapılabildi, bu yüzden bu sonuçlar eksik olabilir.';

  @override
  String get searchMatchTitle => 'Başlık';

  @override
  String get searchMatchNextStep => 'Sonraki adım';

  @override
  String get searchMatchStep => 'Adım';

  @override
  String get searchMatchSummary => 'Özet';

  @override
  String get searchMatchFromCapture => 'Yakalamadan';

  @override
  String get studioSuggested => 'Son yakalamanız için önerilenler';

  @override
  String get studioRecentlyUsed => 'Son kullanılanlar';

  @override
  String get studioReady => 'HAZIR';

  @override
  String get studioNotConnected => 'BAĞLI DEĞİL';

  @override
  String get studioHeroTitle => 'Action Zekâsı';

  @override
  String get studioConnectedBlurb =>
      'Bir belgeyi anlayın, bir hedefi keskinleştirin, bir plan kurun, bir yanıt taslağı yazın ya da önünüzdekini inceleyin.';

  @override
  String studioDisconnectedBlurb(int count) {
    return 'Belgeleri anlamak, plan yapmak ve yazmak için $count araç. Kullanmak için kendi yapay zekâ hesabınızı bağlayın — ücreti sağlayıcınız alır, hiçbir zaman Action almaz.';
  }

  @override
  String get studioConnectAi => 'Yapay zekâyı bağla';

  @override
  String get studioHowItWorks => 'Nasıl çalışır';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bunlardan $count tanesi bunların hiçbiri olmadan, tamamen bu cihazda zaten çalışıyor.',
      one: 'Bunlardan 1\'i bunların hiçbiri olmadan, tamamen bu cihazda zaten çalışıyor.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'Bu cihazda çalışır';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description Bu cihazda çalışır.';
  }

  @override
  String get categoryUnderstand => 'Anla';

  @override
  String get categoryUnderstandBlurb => 'Elinizdekini anlamlandırın.';

  @override
  String get categoryPlan => 'Planla';

  @override
  String get categoryPlanBlurb => 'Onu yapabileceğiniz bir şeye dönüştürün.';

  @override
  String get categoryCreate => 'Yaz';

  @override
  String get categoryCreateBlurb => 'Yazın, iyileştirin, çevirin.';

  @override
  String get categoryExtract => 'Çıkar';

  @override
  String get categoryExtractBlurb => 'Önemli ayrıntıları çekip çıkarın.';

  @override
  String get categoryVerify => 'İncele';

  @override
  String get categoryVerifyBlurb => 'Önünüzdekini inceleyin.';

  @override
  String get captureSheetTitle => 'Bir şey yakala';

  @override
  String get captureSheetSubtitle =>
      'Baştan sona okumak istemediğiniz her şeyi Action\'a verin.';

  @override
  String get captureTakePhoto => 'Fotoğraf çek';

  @override
  String get captureTakePhotoSubtitle =>
      'Önünüzdeki bir mektup, fatura ya da tebligat';

  @override
  String get captureChooseImage => 'Görsel seç';

  @override
  String get captureChooseImageSubtitle =>
      'Bu cihazda zaten olan bir ekran görüntüsü ya da fotoğraf';

  @override
  String get capturePasteText => 'Metin yapıştır';

  @override
  String get capturePasteTextSubtitle => 'Bir e-posta, mesaj ya da tebligat';

  @override
  String get captureChoosePdf => 'PDF seç';

  @override
  String get captureChoosePdfSubtitle =>
      'Zaten elinizde olan bir ekstre, mektup ya da form';

  @override
  String get captureFootnote =>
      'Yakalamalar bu cihazda kalır. Siz istemeden çevrimiçi hiçbir şey çözümlenmez.';

  @override
  String get captureCouldNotOpen => 'Bu açılamadı. Başka bir yolu deneyin.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'Okunuyor';

  @override
  String get stageNeedsReview => 'İnceleme gerekiyor';

  @override
  String get stageActionCreated => 'Görev oluşturuldu';

  @override
  String get stageNoText => 'Metin bulunamadı';

  @override
  String get stageCouldNotBeRead => 'Okunamadı';

  @override
  String get stageReadingPreview => 'Metin okunuyor…';

  @override
  String get stageFailedPreview => 'Bu, bu cihazda okunamadı.';

  @override
  String get provenancePhoto => 'Fotoğraftan yakalandı';

  @override
  String get provenanceImage => 'Görselden yakalandı';

  @override
  String get provenancePastedText => 'Yapıştırılan metinden yakalandı';

  @override
  String get provenanceDocument => 'Belge olarak eklendi';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Bitti $when';
  }

  @override
  String metaOverdue(String date) {
    return 'Gecikmiş · son tarih $date idi';
  }

  @override
  String get metaDueToday => 'Bugün son gün';

  @override
  String metaDueOn(String date) {
    return 'Son tarih $date';
  }

  @override
  String get metaCreatedByYou => 'Sizin oluşturduğunuz';

  @override
  String get categoryPayment => 'Ödeme';

  @override
  String get categoryRenewal => 'Yenileme';

  @override
  String get categoryAppointment => 'Randevu';

  @override
  String get categoryBooking => 'Rezervasyon';

  @override
  String get categoryTravel => 'Seyahat';

  @override
  String get categoryDeadline => 'Son tarih';

  @override
  String get categoryResponse => 'Yanıt gerekiyor';

  @override
  String get categoryDelivery => 'Teslimat';

  @override
  String get categoryDocument => 'Belge';

  @override
  String get categoryNoActionRequired => 'Yapılacak bir şey yok';

  @override
  String get categoryUnsure => 'Belli değil';

  @override
  String get errorEnterManually => 'Elle girin';
}
