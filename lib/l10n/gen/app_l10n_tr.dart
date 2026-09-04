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
  String get ocrScriptTitle => 'Metin tanıma';

  @override
  String get ocrScriptSubtitle =>
      'Action bir fotoğrafa baktığında okuduğu yazı sistemi. Tanıma bu cihazda yapılır; okunmak üzere hiçbir yakalama hiçbir yere gönderilmez.';

  @override
  String get ocrScriptSectionChoose => 'Yazı sistemi';

  @override
  String get ocrScriptFollowLanguage => 'Uygulama dilini izle';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'Şu anda $script';
  }

  @override
  String get ocrScriptLatin => 'Latin';

  @override
  String get ocrScriptChinese => 'Çince';

  @override
  String get ocrScriptDevanagari => 'Devanagari';

  @override
  String get ocrScriptJapanese => 'Japonca';

  @override
  String get ocrScriptKorean => 'Korece';

  @override
  String get ocrScriptLatinDescription =>
      'İngilizce, İspanyolca, Fransızca, Almanca ve Latin harfleriyle yazılan diğer diller.';

  @override
  String get ocrScriptChineseDescription =>
      'Basitleştirilmiş ve geleneksel Çince.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Hintçe, Marathi ve Nepalce. Bengalce, Tamilce veya Telugu değil — bunların her biri ayrı bir yazı sistemidir.';

  @override
  String get ocrScriptJapaneseDescription => 'Japonca.';

  @override
  String get ocrScriptKoreanDescription => 'Korece.';

  @override
  String get ocrScriptFootnote =>
      'Latin dışındaki her seçenek Latin harflerini de okur; yani birini seçmek bir yazı sistemini değiştirmez, üstüne ekler. Bu değişiklik bundan sonra çekilen fotoğraflar için geçerlidir, daha önce okunanlar için değil.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action $language yazısını okuyamıyor';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'Cihazda bunun için bir tanıyıcı yok. Fotoğraflar Latin harfleriyle yazılmış her şey için okunmaya devam eder, gerisi boş döner. Bunun yerine o metni yazabilir ya da yapıştırabilirsiniz.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action $script okuyacak şekilde ayarlı. Bu fotoğraf başka bir yazı sistemindeyse Ayarlar\'dan değiştirip yeniden okutun.';
  }

  @override
  String get settingsTextRecognition => 'Metin tanıma';

  @override
  String get settingsTextRecognitionDescription =>
      'Action\'ın fotoğraflardan okuduğu yazı sistemi.';

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

  @override
  String get sourceWhatWeRead => 'Okuduğumuz';

  @override
  String get sourceDelete => 'Yakalamayı sil';

  @override
  String get sourceGone => 'O yakalama artık kullanılamıyor.';

  @override
  String get sourceDeleteTitle => 'Bu yakalama silinsin mi?';

  @override
  String get sourceDeleteBody =>
      'Görüntü ve ondan okunan metin bu cihazdan kaldırılır.';

  @override
  String get sourceDeleteKeep => 'Kalsın';

  @override
  String get sourceOpenAction => 'Görevi aç';

  @override
  String sourceOpenActions(int count) {
    return '$count görevi aç';
  }

  @override
  String get sourceCreateAnother => 'Bundan bir tane daha oluştur';

  @override
  String get sourceCreateAction => 'Bundan bir görev oluştur';

  @override
  String get sourceDoMore => 'Bununla daha fazlasını yap';

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
    return '$format $size KB kaynağından';
  }

  @override
  String get sourceTextFound => 'Metin bulundu';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines satır · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'Action\'ın okuduğu metin bu. Ondan ne çıktığı aşağıda.';

  @override
  String get sourceNotInterpreted =>
      'Henüz hiçbir şey yorumlanmadı. Action bununla ne yapılacağını önerecek, bir şey oluşturulmadan önce siz onaylayacaksınız.';

  @override
  String get sourceNoTextExplainer =>
      'Bu; el yazısında, çok az ışıkta ya da bu cihazın henüz okuyamadığı bir yazıda olabilir.';

  @override
  String get sourceReadFailed => 'Bu okunamadı';

  @override
  String get sourceReadFailedReason => 'Metin tanıma tamamlanamadı.';

  @override
  String get sourceTryReadingAgain => 'Yeniden okumayı dene';

  @override
  String get sourceTypeInstead => 'Bilgileri kendiniz yazın';

  @override
  String get sourceTypeWhatItSays => 'Ne yazdığını yazın';

  @override
  String get sourceTypeHint => 'Tarihler, tutarlar ve ne istendiği.';

  @override
  String get sourceMadeFromThis => 'Bu yakalamadan oluşturuldu';

  @override
  String sourceMadeFromThisCount(int count) {
    return 'Bu yakalamadan $count tane oluşturuldu';
  }

  @override
  String get sourceTheDocument => 'Belge';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '1 sayfa',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'Sayfa sayısı bilinmiyor';

  @override
  String get sourceDocumentNotRead =>
      'Action bu belgenin içinde ne olduğunu okumadı. Buna ihtiyaç duyan bir araç çalıştırdığınızda dosya, bağladığınız yapay zekâ sağlayıcısına gider ve bu olmadan önce size bildirilir.';

  @override
  String get previewSaveFailed => 'Bu kaydedilemedi. Yeniden deneyin.';

  @override
  String get previewTitle => 'Yakalamayı kontrol edin';

  @override
  String get previewImageFailed => 'O görüntü açılamadı.';

  @override
  String get previewHint =>
      'Metnin okunabildiğinden ve önemli bir yerin kesilmediğinden emin olun.';

  @override
  String get previewRetake => 'Yeniden çek';

  @override
  String get pasteTitle => 'Metin yapıştır';

  @override
  String get pasteHint =>
      'Baştan sona okumak istemediğiniz e-postayı, mesajı ya da bildirimi yapıştırın.';

  @override
  String get pasteFootnote =>
      'İçinde tarih, tutar ya da bir istek geçen her şey iyi sonuç verir.';

  @override
  String get pasteEnough => 'Çalışmak için yeterli görünüyor.';

  @override
  String get pasteMore => 'Biraz daha metin daha iyi bir sonuç verir.';

  @override
  String get reviewLoadFailed => 'Bu yakalama yüklenemedi.';

  @override
  String get reviewConfirmed => 'Onaylandı';

  @override
  String get reviewNeedsReview => 'Gözden geçirilmeli';

  @override
  String get reviewReview => 'Gözden geçir';

  @override
  String get reviewHighConfidence => 'Yüksek güven';

  @override
  String get reviewConfirmedByYou => 'Sizin onayınızla';

  @override
  String get reviewMissing => 'Eksik';

  @override
  String get reviewNotUnderstood =>
      'Action bu kaynağın yeterince büyük bir bölümünü güvenilir biçimde anlayamadı.';

  @override
  String get reviewNotUnderstoodBody =>
      'Yakalama olduğu gibi duruyor ve hiçbir şey kaybolmadı. Bilgileri kendiniz girebilirsiniz, kaynak da başvurmak için ekli kalır.';

  @override
  String get reviewEnterDetails => 'Bilgileri girin';

  @override
  String get reviewKeepSource => 'Kaynağı sonrası için sakla';

  @override
  String reviewEngine(String engine) {
    return 'Motor: $engine';
  }

  @override
  String get reviewManualNotice =>
      'Bu görevi kendiniz oluşturuyorsunuz. Yalnızca buraya girdikleriniz kullanılacak.';

  @override
  String get reviewUntitled => 'Başlıksız görev';

  @override
  String get reviewEditTitle => 'Başlığı düzenle';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count değeri gözden geçirmeniz gerekiyor.',
      one: 'Bu onaylanabilmeden önce 1 değeri gözden geçirmeniz gerekiyor.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Önemli bilgiler';

  @override
  String get reviewNotFound => 'Bulunamadı';

  @override
  String get reviewSuggestedNextStep => 'Önerilen sonraki adım';

  @override
  String get reviewWhyThisMatters => 'Bu neden önemli';

  @override
  String get reviewSteps => 'Adımlar';

  @override
  String get reviewAddStep => 'Adım ekle';

  @override
  String get reviewInjectionNotice =>
      'Bu kaynaktaki bazı metinler belge bilgisi yerine talimat gibi göründü, bu yüzden Action onu dikkate almadı.';

  @override
  String get reviewLayoutNotice =>
      'Bu belgenin yerleşimi, metin çıkarımının tümüyle koruyamadığı ilişkiler içeriyor olabilir. Onaylamadan önce aşağıdaki değerleri kaynakla karşılaştırın.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Aşağıdaki değerleri kaynakla karşılaştırın.';
  }

  @override
  String get reviewDeadline => 'Son tarih';

  @override
  String get reviewAmount => 'Tutar';

  @override
  String get reviewLeftUnset => 'Yok — bunu boş bırakmayı siz seçtiniz';

  @override
  String get reviewUnclear => 'Belirsiz';

  @override
  String get reviewNotSet => 'Ayarlanmadı';

  @override
  String get reviewNoDeadlineFound => 'Bu belgede hiç bulunamadı';

  @override
  String get reviewNoAmountFound => 'Bu belgede hiç tutar bulunamadı';

  @override
  String get reviewMultipleDates => 'Action birden çok olası tarih buldu.';

  @override
  String reviewMultipleDatesBody(int count) {
    return 'Son tarih $count tarihten biri olabilir. Doğrusunu seçin, başka birini girin ya da boş bırakın.';
  }

  @override
  String get reviewChooseDate => 'Bir tarih seçin';

  @override
  String get reviewMultipleAmounts => 'Action birden fazla olası tutar buldu.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return 'Burada söz konusu olan tutar $count tanesinden biri olabilir. Birini seçin, başka birini girin ya da boş bırakın.';
  }

  @override
  String get reviewChooseAmount => 'Bir tutar seçin';

  @override
  String get reviewSkipStep => 'Bu adımı atla';

  @override
  String get reviewKeepStep => 'Bu adımı sakla';

  @override
  String get reviewEditStep => 'Adımı düzenle';

  @override
  String get reviewCreateManually => 'Elle oluştur';

  @override
  String get reviewConfirmAndCreate => 'Onayla ve görevi oluştur';

  @override
  String get reviewFixHighlighted => 'İşaretli alanları gözden geçirin';

  @override
  String get reviewSaving => 'Kaydediliyor…';

  @override
  String get reviewSaveFailed =>
      'Bu görev kaydedilemedi. Hiçbir şey kaybolmadı — yeniden deneyin.';

  @override
  String get reviewFieldTitle => 'Başlık';

  @override
  String get reviewTitleHint => 'Ne olması gerekiyor?';

  @override
  String get reviewNewStep => 'Yeni adım';

  @override
  String get reviewStepHint => 'Ne yapılacak';

  @override
  String get reviewDatesConflict => 'Belgede birden fazla tarih geçiyor.';

  @override
  String get reviewAmountsConflict => 'Belgede birden fazla tutar geçiyor.';

  @override
  String get reviewAnotherDate => 'Başka bir tarih — 2026-08-30';

  @override
  String get reviewBadDate =>
      'Gerçek bir tarih değil. 2026-08-30 biçimini kullanın.';

  @override
  String get reviewTypeDate => 'Bir tarih yazın ya da aşağıda boş bırakın.';

  @override
  String get reviewUseThisDate => 'Bu tarihi kullan';

  @override
  String get reviewLeaveNoDeadline => 'Son tarih olmadan devam et';

  @override
  String get reviewAnotherAmount => 'Başka bir tutar — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'Bu tutar kullanılamıyor: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Bu tutarı kullan';

  @override
  String get reviewLeaveNoAmount => 'Tutar olmadan devam et';

  @override
  String get reviewThisValue => 'Bu değer';

  @override
  String reviewQuote(String quote) {
    return '“$quote”';
  }

  @override
  String get reviewSeeOnCapture => 'Yakalamanın üzerinde göster';

  @override
  String get reviewViewSource => 'Kaynağı gör';

  @override
  String get reviewFromSource => 'Kaynaktan';

  @override
  String get reviewNotVerified => 'Denetlenmedi';

  @override
  String get reviewCouldNotVerify =>
      'Bu, kaynakla karşılaştırılıp denetlenemedi.';

  @override
  String get reviewLooksRight => 'Doğru görünüyor';

  @override
  String get reviewStageReading => 'Kaynak okunuyor';

  @override
  String get reviewStageUnderstanding => 'Önemli ayrıntılar anlaşılıyor';

  @override
  String get reviewStageChecking =>
      'Neyin gözden geçirilmesi gerektiği denetleniyor';

  @override
  String get reviewNothingToDo => 'Şu anda yapmanız gereken bir şey yok.';

  @override
  String get reviewInformationOnly =>
      'Bu yalnızca bilgi gibi görünüyor — son tarih, ödeme ya da yanıt isteği bulunamadı.';

  @override
  String get reviewInformationOnlyWithSource =>
      'Bu yalnızca bilgi gibi görünüyor — bu yakalamada son tarih, ödeme ya da yanıt isteği bulunamadı.';

  @override
  String get reviewSourceKept => 'Kaynak her hâlükârda saklanır.';

  @override
  String get reviewAddAnyway => 'Yine de bir görev ekle';

  @override
  String get reviewActionConfirmed => 'Görev onaylandı';

  @override
  String get reviewCreatedByYou => 'Sizin oluşturdunuz.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gözden geçirilmiş $count bilgiden yola çıkarak siz onayladınız.',
      one: 'Gözden geçirilmiş 1 bilgiden yola çıkarak siz onayladınız.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Gözden geçirilmiş $count bilgiden yola çıkarak siz onayladınız. Bunların $edited tanesini değiştirdiniz.',
      one:
          'Gözden geçirilmiş 1 bilgiden yola çıkarak siz onayladınız. Bunların $edited tanesini değiştirdiniz.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Bu cihaza kaydedildi.';

  @override
  String get evidenceTitle => 'Bunun geldiği yer';

  @override
  String get evidenceUnverified =>
      'Action bu kelimeleri okuduğu metinde bulamadı, bu yüzden bu değer denetlenmedi. Ona güvenmeden önce aslıyla karşılaştırın.';

  @override
  String get evidenceHighlighted =>
      'Bu kelimeler Action\'ın bu yakalamadan okuduğu metinde geçiyordu ve vurgulama nerede olduğunu gösteriyor.';

  @override
  String get evidenceNoRegion =>
      'Bu kelimeler Action\'ın bu yakalamadan okuduğu metinde geçiyordu. Görüntünün tam olarak neresinde durduklarını çıkaramadı ve tahmin yürütmüyor.';

  @override
  String get evidenceInText =>
      'Bu kelimeler bu yakalamanın içerdiği metinde geçiyordu.';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'Kritik';

  @override
  String get urgencyImportant => 'Önemli';

  @override
  String get urgencyNormal => 'Normal';

  @override
  String get urgencyLow => 'Düşük';

  @override
  String get urgencyUnsure => 'Emin değil';
}
