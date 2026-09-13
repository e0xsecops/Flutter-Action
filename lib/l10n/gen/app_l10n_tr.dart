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
  String get detailLoadFailed =>
      'Bu görev yüklenemedi. Yine de bu cihazda saklı duruyor.';

  @override
  String get detailNotFoundTitle => 'O görev artık burada değil';

  @override
  String get detailNotFoundMessage => 'Bu cihazda silinmiş olabilir.';

  @override
  String get detailGoBack => 'Geri dön';

  @override
  String get detailMore => 'Daha fazla';

  @override
  String get detailChangeUrgency => 'Aciliyeti değiştir';

  @override
  String get detailAddRecommendedStep => 'Önerilen adım ekle';

  @override
  String get detailEditRecommendedStep => 'Önerilen adımı düzenle';

  @override
  String get detailArchiveTitle => 'Bu görev arşivlensin mi?';

  @override
  String get detailArchiveBody =>
      'Listenizden çıkar ama silinmez, ve geldiği yakalama saklı kalır.';

  @override
  String get detailArchiveConfirm => 'Arşivle';

  @override
  String get detailArchived => 'Arşivlendi';

  @override
  String detailCompletedOn(String date) {
    return '$date tarihinde tamamlandı';
  }

  @override
  String get detailSectionDetails => 'Ayrıntılar';

  @override
  String get detailSectionReminders => 'Hatırlatıcılar';

  @override
  String get detailAllStepsDone => 'Bütün adımlar bitti';

  @override
  String get detailNextEyebrow => 'Sırada';

  @override
  String get detailCompleteQuestion => 'Bu görev tamamlansın mı?';

  @override
  String get detailMarkStepDone => 'Adımı bitti olarak işaretle';

  @override
  String get detailCompleteAction => 'Bu görevi tamamla';

  @override
  String get detailAddDeadline => 'Son tarih ekle';

  @override
  String get detailAddAmount => 'Tutar ekle';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$total adımdan $completed tanesi bitti';
  }

  @override
  String get detailNoStepsTitle => 'Henüz adım yok';

  @override
  String get detailNoStepsMessage =>
      'Bunu gerçekten yapmanız gereken hamlelere bölün.';

  @override
  String get detailAddFirstStep => 'İlk adımı ekle';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Tamamlanan adım: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Sonraki adım: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Adım: $title';
  }

  @override
  String detailMarkDone(String title) {
    return '“$title” adımını bitti olarak işaretle';
  }

  @override
  String detailMarkNotDone(String title) {
    return '“$title” adımını bitmedi olarak işaretle';
  }

  @override
  String get detailStepOptions => 'Adım seçenekleri';

  @override
  String get detailMoveUp => 'Yukarı taşı';

  @override
  String get detailMoveDown => 'Aşağı taşı';

  @override
  String get detailDeleteStep => 'Adımı sil';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'Bu adım silinsin mi?';

  @override
  String get stepDeleteKeep => 'Kalsın';

  @override
  String get detailNoRemindersYet => 'Henüz hatırlatıcı yok.';

  @override
  String get detailReminderLimit =>
      'Bir görevin alabileceği en fazla hatırlatıcı sayısı bu. Başka eklemek için birini kaldırın.';

  @override
  String get detailAddReminder => 'Hatırlatıcı ekle';

  @override
  String get detailChangeReminder => 'Hatırlatıcıyı değiştir';

  @override
  String get detailRemoveReminder => 'Hatırlatıcıyı kaldır';

  @override
  String get detailReminderFormat => 'EEE d MMM, HH:mm';

  @override
  String get reminderStatePending => 'Henüz kurulmadı';

  @override
  String get reminderStateNotificationsOff =>
      'Kaydedildi ama bildirimler kapalı';

  @override
  String get reminderStateFailed => 'Zamanlanamadı';

  @override
  String get reminderStateRemoving => 'Kaldırılıyor…';

  @override
  String get reminderSetConfirmation => 'Hatırlatıcı kuruldu. Size dürteceğiz.';

  @override
  String get reminderUpdatedConfirmation => 'Hatırlatıcı güncellendi.';

  @override
  String get reminderNeedsPermission =>
      'Bildirimler kapalı, bu yüzden bu hatırlatıcı kaydedildi ama sizi henüz uyaramaz.';

  @override
  String get reminderScheduleFailed =>
      'Bu hatırlatıcı kaydedildi ama Android onu zamanlamak istemedi.';

  @override
  String get reminderLimitReached =>
      'O görev zaten alabileceği en fazla hatırlatıcıya sahip.';

  @override
  String get reminderTimeInPast => 'O saat çoktan geçti.';

  @override
  String get reminderAddTitle => 'Hatırlatıcı ekle';

  @override
  String get reminderChangeTitle => 'Bu hatırlatıcıyı değiştir';

  @override
  String get reminderDateLabel => 'Tarih';

  @override
  String get reminderTimeLabel => 'Saat';

  @override
  String get reminderFieldDateFormat => 'EEE d MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'd MMMM EEEE';

  @override
  String get reminderPresetFormat => 'd MMM, HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return 'Size $date günü saat $time hatırlatılacak.';
  }

  @override
  String get reminderTimePastError =>
      'O saat çoktan geçti. Daha ileri bir saat seçin.';

  @override
  String get reminderSet => 'Hatırlatıcıyı kur';

  @override
  String get reminderPresetInHour => '1 saat sonra';

  @override
  String get reminderPresetTomorrowMorning => 'Yarın sabah';

  @override
  String get reminderPresetNextWeek => 'Gelecek hafta';

  @override
  String get reminderPresetOnTheDay => 'Aynı gün';

  @override
  String get reminderPresetDayBefore => '1 gün önce';

  @override
  String get reminderPresetWeekBefore => '1 hafta önce';

  @override
  String get reminderPresetAtDeadline => 'Son tarihte';

  @override
  String get reminderPresetHourBefore => '1 saat önce';

  @override
  String get editNextStepTitle => 'Önerilen sonraki adım';

  @override
  String get editNextStepSubtitle =>
      'Sonraki işe yarar hamle hakkında kısa bir cümle.';

  @override
  String get editNextStepHint => 'Sonraki işe yarar hamle nedir?';

  @override
  String get editRemoveSuggestion => 'Öneriyi kaldır';

  @override
  String get editUrgencyTitle => 'Bu ne kadar acil?';

  @override
  String get editStepHint => 'Yapılacak somut bir şey';

  @override
  String get editAddStep => 'Adım ekle';

  @override
  String get editDateHint => 'YYYY-AA-GG';

  @override
  String get editRemoveDeadline => 'Son tarihi kaldır';

  @override
  String get editAmountHint => '96,40';

  @override
  String get editSaveAmount => 'Tutarı kaydet';

  @override
  String get editRemoveAmount => 'Tutarı kaldır';

  @override
  String get securityTitle => 'Güvenlik ve gizlilik';

  @override
  String get securitySectionProtection => 'Koruma';

  @override
  String get securityAppLockUnavailable =>
      'Uygulama Kilidi bu cihazda bir ekran kilidi gerektirir. Önce cihaz ayarlarınızdan bir PIN, desen, parola veya parmak izi ayarlayın.';

  @override
  String get securityAppLockOn =>
      'Action, siz olduğunuzu doğrulamasını cihazınızdan ister.';

  @override
  String get securityAppLockOff =>
      'Action\'ı açmak için parmak izinizi, yüzünüzü veya cihaz PIN\'inizi isteyin.';

  @override
  String get securityAskAgain => 'Yeniden sor';

  @override
  String get securityAskAgainDescription =>
      'Action kilitlenmeden önce ne kadar süre arka planda kalabilir.';

  @override
  String get securityScreenPrivacy => 'Ekran gizliliği';

  @override
  String get securityScreenPrivacyDescription =>
      'Android\'den ekran görüntüsü ile ekran kaydını engellemesini ve Action\'ı uygulama değiştiricide gizlemesini isteyin.';

  @override
  String get securityPrivateReminders => 'Özel hatırlatıcılar';

  @override
  String get securityPrivateRemindersOn =>
      'Hatırlatıcılar yalnızca bir şeyin sizi beklediğini söyler.';

  @override
  String get securityPrivateRemindersOff =>
      'Hatırlatıcılar görevin başlığını gösterir. Başlığın kilit ekranına çıkmaması için bunu açın.';

  @override
  String get securityLockNow => 'Şimdi kilitle';

  @override
  String get securityLockNowDescription => 'Beklemeden kapıyı kapatın.';

  @override
  String get securitySectionStorage => 'Verileriniz nasıl saklanıyor';

  @override
  String get securityStorageDataLabel =>
      'Görevleriniz, yakalamalarınız ve ayarlarınız';

  @override
  String get securityStorageDataDetail =>
      'Bu uygulamanın kendi özel depolamasında duruyorlar; başka uygulamalar okuyamaz ve Android bunları cihaz şifrelemesinin bir parçası olarak şifreler. Action bunun üstüne kendine ait ikinci bir katman eklemez.';

  @override
  String get securityStorageKeyLabel => 'Yapay zekâ sağlayıcı anahtarınız';

  @override
  String get securityStorageKeyDetail =>
      'Geri kalanın yanında değil, Android Keystore içinde tutulur ve kaydettikten sonra bir daha gösterilmez.';

  @override
  String get securityStorageGapLabel => 'Bunun kapsamadığı şeyler';

  @override
  String get securityStorageGapDetail =>
      'Bunların hiçbiri, cihazınızı kilitsizken kullanan birine karşı koruma sağlamaz; değiştirilmiş ya da root\'lanmış bir sistem de normal bir sistemden fazlasını okuyabilir. Uygulama Kilidi, bunlardan ilkine yardımcı olan ayardır.';

  @override
  String get securitySectionInformation => 'Bilgileriniz';

  @override
  String get securityWhereInfoDescription =>
      'Verilerinizin gidebileceği her yol ve bu cihazdan ayrılan iki tanesi.';

  @override
  String get securityAppLockRefused =>
      'Onaylanmadı, bu yüzden hiçbir şey değişmedi.';

  @override
  String get securityAppLockUnavailableToast =>
      'Bu cihazda kurulu bir ekran kilidi yok. Cihaz ayarlarınızdan bir PIN, desen, parola veya parmak izi ekleyin, sonra yeniden deneyin.';

  @override
  String get securityScreenPrivacyRefused =>
      'Bu cihaz ekran gizliliğini uygulamadı, bu yüzden açık gibi gösterilmek yerine kapalı bırakıldı.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count planlanmış hatırlatıcı artık daha az şey söylüyor.',
      one: '1 planlanmış hatırlatıcı artık daha az şey söylüyor.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count planlanmış hatırlatıcı güncellendi.',
      one: '1 planlanmış hatırlatıcı güncellendi.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Hemen';

  @override
  String get appLockDelayOneMinute => '1 dakika sonra';

  @override
  String get appLockDelayFiveMinutes => '5 dakika sonra';

  @override
  String get securityDelayImmediatelyDescription =>
      'Action ekrandan her ayrıldığında';

  @override
  String get securityDelayOneMinuteDescription =>
      'Bir mesaja cevap vermeye yetecek kadar';

  @override
  String get securityDelayFiveMinutesDescription =>
      'Bir aramayı almaya yetecek kadar';

  @override
  String get securityHeroProtected => 'Korunuyor';

  @override
  String get securityHeroNothingOn => 'Hiçbiri açık değil';

  @override
  String get securityHeroFootnote =>
      'Buradaki her şey bu cihazda çalışır. Bu ayarların hiçbiri hiçbir yere gönderilmez ve hiçbiri uzaktan değiştirilemez.';

  @override
  String get securityHeadlineNone => 'Üç koruma mevcut';

  @override
  String securityHeadlineOne(String first) {
    return '$first açık';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first ve $second açık';
  }

  @override
  String get securityHeadlineAll => 'Üç korumanın üçü de açık';

  @override
  String get securityTransfersTitle => 'Bu cihazdan ne çıktı';

  @override
  String get securityTransfersNoProvider =>
      'Bağlı bir yapay zekâ sağlayıcı yok, bu yüzden analiz için hiçbir şey gönderilmiyor.';

  @override
  String get securityTransfersDescription =>
      'Bir şey gönderildiği anda, karşılığı dönsün ya da dönmesin buraya yazılır. Yalnızca araç, sağlayıcı ve boyut — içinde ne olduğu asla. Bu cihazda 90 gün saklanır ve hiçbir yere gönderilmez.';

  @override
  String get securityClear => 'Temizle';

  @override
  String get securityNothingSent => 'Hiçbir şey gönderilmedi';

  @override
  String get securityNothingSentDescription =>
      'Yapay zekâ sağlayıcınızı kullanan bir araç çalıştırdığınızda burada listelenecek.';

  @override
  String get securityClearHistoryTitle => 'Bu geçmiş temizlensin mi?';

  @override
  String get securityClearHistoryBody =>
      'Nelerin gönderildiğine dair kayıt bu cihazdan silinecek. Bu, çoktan gönderilmiş hiçbir şeyi geri almaz.';

  @override
  String get securityUnnamedTool => 'Bir Intelligence aracı';

  @override
  String get securityYourProvider => 'yapay zekâ sağlayıcınıza';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '1 sayfa',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dosya',
      one: '1 dosya',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'kısa bir metin';

  @override
  String securityTransferCharacters(int count) {
    return '$count bin karakter';
  }

  @override
  String securitySentTo(String provider) {
    return '$provider adresine gönderildi.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return '$provider adresine gönderildi · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return '$count hf önce';
  }

  @override
  String get helpTitle => 'Yardım';

  @override
  String get helpAddQuestion => 'Ne ekleyebilirim?';

  @override
  String get helpAddAnswer =>
      'Bir ekran görüntüsü, bir mektup ya da fatura fotoğrafı veya yapıştırdığınız metin. İçinde tarih, tutar ya da bir talep geçen her şey en iyi sonucu verir.';

  @override
  String get helpReviewQuestion => 'Action neden gözden geçirmemi istiyor?';

  @override
  String get helpReviewAnswer =>
      'Çünkü bir belgeyi okuyan makine onu yanlış okuyabilir ve sessizce yanlış olan bir son tarih, hiç son tarih olmamasından kötüdür. Action neyi bulduğunu ve hangi sözcüklerden geldiğini gösterir, siz onaylamadan da hiçbir şey kaydedilmez.';

  @override
  String get helpVaryQuestion => 'Tekrar denediğimde sonuçlar neden değişiyor?';

  @override
  String get helpVaryAnswer =>
      'Belgenizi okuyan hizmet belirlenimci değildir, bu yüzden aynı yakalama biraz farklı dönebilir. Gözden geçirme adımı da bu yüzden var — değişmeyen taraf sizsiniz.';

  @override
  String get helpLateQuestion => 'Hatırlatıcım neden geç geldi?';

  @override
  String get helpLateAnswer =>
      'Hatırlatıcılar Android üzerinden planlanır ve onları tam olarak ne zaman ileteceğine Android karar verir. Pil tasarrufu, Doze ve üreticinin güç ayarları bir hatırlatıcıyı geciktirebilir. Action hiçbir zaman dakikası dakikasına bir hatırlatıcı sözü vermez.';

  @override
  String get helpDataQuestion => 'Verilerim nerede?';

  @override
  String get helpDataAnswer =>
      'Neredeyse tamamı bu cihazda: yakalamalarınız, görevleriniz, adımlarınız, hatırlatıcılarınız ve aramalarınız. İki istisna — Action\'ın okumasını istediğiniz içerik onu okuyan yapay zekâ hizmetine gönderilir ve onaylanmış bir görevin kısa bir kaydı anonim bir kimlik altında bulutta saklanabilir. Ayarlar\'daki Gizlilik ve veriler, o kaydın tam olarak neleri içerdiğini listeler.';

  @override
  String get helpBackupQuestion => 'Bu bir yedek mi?';

  @override
  String get helpBackupAnswer =>
      'Hayır. Buluttaki kayıt yeni bir cihaza geri yüklenemez ve giriş yapılacak bir hesap yoktur. Action\'ı kaldırırsanız ya da bu cihazı kaybederseniz, üzerindeki veriler gider.';

  @override
  String get helpCorrectQuestion => 'Bir görevi nasıl düzeltirim?';

  @override
  String get helpCorrectAnswer =>
      'Görevi açın ve herhangi bir alanı düzenleyin — başlığı, son tarihi, tutarı ya da önerilen sonraki adımı. Adımları dilediğiniz zaman ekleyebilir, sıralayabilir, tamamlayabilir ve silebilirsiniz. Bir görevi düzenlemek yapay zekâ hizmetine asla bir şey sormaz.';

  @override
  String get privacyTitle => 'Gizlilik ve veriler';

  @override
  String get privacyIntro =>
      'Action elinden geldiğince çok şeyi bu cihazda tutar. İki şey istisnadır ve ikisi de aşağıda listelenmiştir.';

  @override
  String get privacyGroupOnDevice => 'Bu cihazda';

  @override
  String get privacyOnDeviceCaptures =>
      'Yakalamalar — eklediğiniz ekran görüntüleri, fotoğraflar ve metinler ile bunlardan okunan metin.';

  @override
  String get privacyOnDeviceActions =>
      'Görevler; adımları, bilgileri ve hatırlatıcılarıyla birlikte.';

  @override
  String get privacyOnDeviceSearch =>
      'Arama. Aramalarınız burada çalışır, hiçbir yere gönderilmez ve ekranı kapattıktan sonra saklanmaz.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'Fotoğraflar konumları olmadan saklanır. Bir telefonun görüntünün içine yazdığı koordinatlar, saat ve kamera bilgileri yakalama kaydedilmeden önce kaldırılır; böylece burada tutulmazlar ve bir yakalamayı yapay zekâ sağlayıcınıza gönderdiğinizde de gitmezler.';

  @override
  String get privacyGroupSentToRead => 'Okunmak üzere gönderilenler';

  @override
  String get privacySentToReadWhat =>
      'Action\'dan bir yakalamayı yorumlamasını istediğinizde, o içerik onu okuyan yapay zekâ hizmetine gönderilir. Bu, cihaz üzerinde çalışan bir yapay zekâ değildir.';

  @override
  String get privacySentToReadWhen =>
      'Yalnızca seçtiğiniz yakalama gönderilir ve yalnızca siz istediğinizde.';

  @override
  String get privacyGroupYourProvider =>
      'Kendi yapay zekâ sağlayıcınıza gönderilenler';

  @override
  String get privacyProviderWhat =>
      'Ayarlar\'da bir yapay zekâ sağlayıcı bağlarsanız, Intelligence araçları seçtiğiniz içeriği o sağlayıcıya — OpenAI, Anthropic, Google ya da seçtiğiniz bir endpoint — kendi API anahtarınızla gönderir.';

  @override
  String get privacyProviderDirect =>
      'Doğrudan onlara gider. Action\'a ait hiçbir sunucudan geçmez.';

  @override
  String get privacyProviderScope =>
      'Yalnızca bir araç için seçtiğiniz gönderilir ve yalnızca onu çalıştırdığınızda. Diğer görevleriniz, yakalamalarınız ve kaynaklarınız asla dahil edilmez, arka planda da hiçbir zaman bir şey gönderilmez.';

  @override
  String get privacyProviderKey =>
      'API anahtarınız bu cihazın güvenli deposunda tutulur ve yalnızca ait olduğu sağlayıcıya gönderilir. Güvenli depo, cihazınızı kilitsiz ele geçiren biri için gerçek bir engeldir, ama mutlak değildir ve Action aksini iddia etmez.';

  @override
  String get privacyProviderLocalTools =>
      'Bazı araçlar hiçbir zaman bir şey göndermez: hassas ayrıntıları gizlemek, bir dosyanın nereden geldiğini kontrol etmek, kimlik bilgilerini bulmak ve bir bağlantıyı incelemek tamamen bu cihazda çalışır.';

  @override
  String get privacyProviderAgreement =>
      'Sağlayıcınızın gönderdiklerinizle ne yaptığı, Action\'ın değil, onunla yaptığınız sözleşmenin konusudur.';

  @override
  String get privacyGroupCloud => 'Bulutta saklananlar';

  @override
  String get privacyCloudWhat =>
      'Bir görevi onayladığınızda, ona ait kısa bir kayıt bu kuruluma ait anonim bir kimlik altında saklanabilir: başlığı, durumu, aciliyeti, kategorisi, son tarihi, tutarı, önerilen sonraki adımı ve zaman damgaları.';

  @override
  String get privacyCloudNotSent =>
      'Yakalamalarınız, onlardan okunan metin, bir görevin adımları ve bilgileri ile hatırlatıcılarınız gönderilmez.';

  @override
  String get privacyCloudNotBackup =>
      'Bu bir yedek değildir. Yeni bir cihaza geri yüklemenin yolu yoktur ve bu kurulumu kaybetmek anonim kimliği de beraberinde götürür.';

  @override
  String get privacyGroupDiagnostics => 'Tanılama';

  @override
  String get privacyDiagnosticsWhat =>
      'Action uygulamada olup bitenlerin anonim sayımlarını tutar — bir yakalamanın başladığını, bir çıkarımın işe yarayıp yaramadığını, bir aramanın hiçbir şey bulamadığını, bir görevin tamamlandığını.';

  @override
  String get privacyDiagnosticsCounts =>
      'Bunlar sayımdır, içerik değil. Hiçbir başlık, tutar, son tarih, referans, yakalanmış metin ya da arama terimi asla dahil edilmez; anonim kimlik ile bir göreve veya yakalamaya ait herhangi bir tanımlayıcı da dahil edilmez.';

  @override
  String get privacyDiagnosticsCrash =>
      'Uygulama çökerse, düzeltilebilmesi için hata ve nerede olduğu bildirilir. Action bu raporlara verilerinizi eklemez.';

  @override
  String get privacySectionYourData => 'Verileriniz';

  @override
  String get privacyYourDataFootnote =>
      'Yakalamaları temizlemek görevlerinizi yerinde bırakır. Yakalaması silinmiş bir görev yine çalışır; yalnızca artık neyden geldiğini göstermez.';

  @override
  String get privacyClearCaptures => 'Yakalamaları temizle';

  @override
  String get privacyClearCapturesDescription =>
      'Her yakalamayı ve görüntü dosyasını siler.';

  @override
  String get privacyDeleteAll => 'Bütün verilerimi sil';

  @override
  String get privacyDeleteAllDescription =>
      'Görevler, adımlar, hatırlatıcılar, yakalamalar ve yukarıdaki bulut kayıtları.';

  @override
  String get privacyClearCapturesTitle => 'Yakalamalar temizlensin mi?';

  @override
  String get privacyClearCapturesBody =>
      'Her yakalama ve görüntüsü bu cihazdan silinecek. Görevleriniz tam olduğu gibi kalır.';

  @override
  String get privacyCapturesDeleted => 'Yakalamalar silindi.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Bazı yakalamalar silinemedi. Başka hiçbir şey değiştirilmedi.';

  @override
  String get privacyDeleteAllTitle => 'Bütün verileriniz silinsin mi?';

  @override
  String get privacyDeleteAllBody =>
      'Bu, bu cihazdaki her görevi, adımı, hatırlatıcıyı ve yakalamayı ve yukarıda listelenen bulut kayıtlarını siler. Geri alınamaz ve geri yüklenecek bir yedek yoktur.';

  @override
  String get privacyDeleteEverything => 'Her şeyi sil';

  @override
  String get privacyDeletedAll => 'Her şey silindi.';

  @override
  String get privacyDeleteFailed => 'Verileriniz silinemedi.';

  @override
  String get privacyDeletedUnverified =>
      'Bu cihazdaki her şey silindi. Action, orada bir şey kalmadığını doğrulamak için buluta ulaşamadı ve yeniden bakacak.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return '$leftovers dışında silindi.';
  }

  @override
  String get privacyWillTryAgain => 'Action yeniden deneyecek.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action bulut kontrolünü bitiremedi ve yeniden deneyecek.';

  @override
  String get privacyLeftoverCaptures => 'bazı yakalamalar';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bulut kaydı',
      one: '1 bulut kaydı',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first ve $second';
  }

  @override
  String get privacyCloudDeleted => 'Bulut kayıtları silindi.';

  @override
  String get privacyCloudUnreachable =>
      'Onlara yine ulaşılamadı. Action yeniden deneyecek.';

  @override
  String get privacyPendingTitle => 'Hâlâ silinecek';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Geçen sefer $count bulut kaydına ulaşılamadı. Action kendiliğinden yeniden deneyecek, ya da şimdi siz deneyebilirsiniz.',
      one: 'Geçen sefer 1 bulut kaydına ulaşılamadı. Action kendiliğinden yeniden deneyecek, ya da şimdi siz deneyebilirsiniz.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Yeniden dene';

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

  @override
  String get detailSaveFailed =>
      'Bu kaydedilemedi. Hiçbir şey kaybolmadı — yeniden deneyin.';

  @override
  String get detailSectionCreatedFrom => 'Şuradan oluşturuldu';

  @override
  String get detailSourceChecking => 'Asıl yakalamaya bakılıyor…';

  @override
  String get detailSourceUnavailable => 'Asıl yakalama artık mevcut değil.';

  @override
  String get detailReopenAction => 'Görevi yeniden aç';

  @override
  String get detailMarkActionComplete => 'Görevi tamamlandı olarak işaretle';

  @override
  String get detailGetHelp => 'Bununla ilgili yardım al';

  @override
  String get detailSectionHistory => 'Geçmiş';

  @override
  String get detailHistoryShowLess => 'Daha az göster';

  @override
  String detailHistoryShowAll(int count) {
    return '$count kaydın tümünü göster';
  }

  @override
  String get detailHistoryCreated => 'Oluşturuldu';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adımla oluşturuldu',
      one: '1 adımla oluşturuldu',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'Ayrıntıları siz onayladınız';

  @override
  String detailHistoryStepFinished(String title) {
    return 'Bitirdiniz: “$title”';
  }

  @override
  String get detailHistoryAStep => 'bir adım';

  @override
  String get detailHistoryReminderSet => 'Bir hatırlatıcı kurdunuz';

  @override
  String detailHistoryReminderSetFor(String when) {
    return '$when için bir hatırlatıcı kurdunuz';
  }

  @override
  String get detailHistoryCompleted => 'Bitti olarak işaretlendi';

  @override
  String get detailHistoryChanged => 'Son değişiklik';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'Özel (OpenAI uyumlu)';

  @override
  String get aiCapabilityText => 'metin';

  @override
  String get aiCapabilityImages => 'görseller';

  @override
  String get aiCapabilityDocuments => 'belgeler';

  @override
  String get aiCapabilityStructuredResults => 'yapılandırılmış sonuçlar';

  @override
  String get aiCapabilityStreaming => 'akış';

  @override
  String get aiCapabilitySystemInstructions => 'sistem talimatları';

  @override
  String get aiCapabilityEvidenceCitations => 'kanıt alıntıları';

  @override
  String get aiCapabilityLongDocuments => 'uzun belgeler';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a ya da $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head ya da $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'Bu aracı kullanmak için bir yapay zekâ sağlayıcı bağlayın.';

  @override
  String get aiFailureInvalidKey =>
      'O API anahtarı sağlayıcı tarafından kabul edilmedi.';

  @override
  String get aiFailureQuotaExceeded =>
      'Sağlayıcı hesabınızın kredisi bitti ya da kotasına ulaştı.';

  @override
  String get aiFailureRateLimited =>
      'Sağlayıcınız istek hızını sınırlıyor. Birazdan yeniden deneyin.';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action yapay zekâ sağlayıcınıza ulaşamadı. Bağlantınızı kontrol edin.';

  @override
  String get aiFailureUnsupportedModel =>
      'O model anahtarınıza açık değil. Ayarlar\'dan başka birini seçin.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'Seçtiğiniz model $capabilities okuyamıyor. Ayarlar\'dan başka bir model seçin.';
  }

  @override
  String get aiFailureContextTooLarge =>
      'Bu içerik, bu modelin bir seferde okuyabileceğinden fazlaydı.';

  @override
  String get aiFailureInputTooLargeText =>
      'Bu, bir seferde çözümlenebilecek olandan daha fazla metin.';

  @override
  String get aiFailureProviderUnavailable =>
      'Yapay zekâ sağlayıcınızda bir sorun var. Birazdan yeniden deneyin.';

  @override
  String get aiFailureMalformedResponse =>
      'O sağlayıcı, Action\'ın okuyamadığı bir şey geri gönderdi.';

  @override
  String get aiFailureCancelled => 'Durduruldu.';

  @override
  String get aiFailureInsecureEndpoint =>
      'O endpoint bir https:// adresi olmalı.';

  @override
  String get aiFailureUnknown =>
      'Yapay zekâ sağlayıcınızla konuşurken bir şeyler ters gitti.';

  @override
  String get appLockTitle => 'Action kilitli';

  @override
  String get appLockPrompt =>
      'Devam etmek için siz olduğunuzu doğrulayın. Action bunu cihazınızdan ister — parmak izinizi, yüzünüzü ya da PIN\'inizi asla görmez.';

  @override
  String get appLockUnlocking => 'Kilit açılıyor…';

  @override
  String get appLockNotConfirmed =>
      'Bu doğrulanmadı. Hazır olduğunuzda yeniden deneyin.';

  @override
  String get appLockCannotConfirm =>
      'Cihazınız şu anda siz olduğunuzu doğrulayamıyor. Cihaz ayarlarınızda hâlâ kurulu bir ekran kilidi olduğunu kontrol edin.';

  @override
  String get appLockWaiting => 'Bekleniyor…';

  @override
  String get appLockUnlock => 'Kilidi aç';

  @override
  String get appLockReasonUnlock => 'Action\'ın kilidini aç';

  @override
  String get appLockReasonEnable =>
      'Uygulama Kilidi\'ni açmadan önce siz olduğunuzu doğrulayın';

  @override
  String get appLockReasonDisable =>
      'Uygulama Kilidi\'ni kapatmadan önce siz olduğunuzu doğrulayın';

  @override
  String get todayCapabilityHeading => 'Action neyi üstlenir';

  @override
  String get todayCapabilityDocumentTitle => 'Bir mektup ya da fatura';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action onu okur; son tarihi, tutarı ve referans numarasını bulur.';

  @override
  String get todayCapabilityScreenshotTitle => 'Bir ekran görüntüsü';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'Yoksa unutacağınız bir mesajı, harekete geçebileceğiniz bir şeye dönüştürün.';

  @override
  String get todayCapabilityTextTitle => 'Bir parça metin';

  @override
  String get todayCapabilityTextBlurb =>
      'Ne olursa yapıştırın. Action onun ne olduğunu ve sizden ne istediğini çözer.';

  @override
  String get todayCapabilityConfirmTitle => 'Her şeyi siz onaylarsınız';

  @override
  String get todayCapabilityConfirmBlurb =>
      'Siz kanıtı görüp evet demeden hiçbir şey göreve dönüşmez.';

  @override
  String get todayCapabilityExploreIntelligence => 'Zekâ\'yı keşfet';

  @override
  String get documentRejectedEmpty => 'O dosya boş.';

  @override
  String documentRejectedTooLarge(String size) {
    return 'O belge $size; bu da Action\'ın çalışabileceğinden büyük.';
  }

  @override
  String get documentRejectedNotAPdf =>
      'Adı ne olursa olsun bu bir PDF değil. Action, PDF\'leri ve görselleri okur.';

  @override
  String get documentRejectedUnreadable => 'O belge okunamadı.';

  @override
  String get pdfRejectedNotAPdf => 'Adı ne olursa olsun o dosya bir PDF değil.';

  @override
  String get pdfRejectedEncrypted =>
      'O PDF parola korumalı, bu yüzden Action onu okuyamıyor.';

  @override
  String get pdfRejectedDamaged => 'O PDF okunamadı. Eksik olabilir.';

  @override
  String get shareRejectedEmpty => 'O paylaşımda okunacak bir şey yoktu.';

  @override
  String get shareRejectedUnsupportedType =>
      'Action metin, görsel ve PDF alabilir. Bu başka bir şeydi.';

  @override
  String get shareRejectedContentMismatch =>
      'O dosya, söylediği türden bir dosya değil; bu yüzden Action onu açmadı.';

  @override
  String get shareRejectedTooLarge =>
      'O dosya Action\'ın çalışamayacağı kadar büyük.';

  @override
  String get shareRejectedUnreadable => 'O dosya okunamadı.';

  @override
  String get captureFailureRecognition => 'Metin tanıma çalıştırılamadı.';

  @override
  String get captureFailureImageFormat =>
      'O görüntü biçimi bu cihazda okunamadı.';

  @override
  String get connectSheetTitle => 'Yapay zekânızı bağlayın';

  @override
  String get connectSheetSubtitle =>
      'Kendi sağlayıcı hesabınızı ve API anahtarınızı kullanırsınız. Action anahtarı bu cihazın güvenli deposunda saklar.';

  @override
  String get connectErrorKeyMissing =>
      'Devam etmek için API anahtarınızı yapıştırın.';

  @override
  String get connectErrorModelMissing =>
      'Bir model seçin ya da bir model kimliği yazın.';

  @override
  String get connectErrorEndpointMissing =>
      'Endpoint\'inizin adresini ekleyin.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'Bu cihazın güvenli deposu açılamadı, bu yüzden anahtar kaydedilmedi.';

  @override
  String get connectTestSucceeded => 'Bağlanıldı.';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'Bağlanıldı. $count model kullanılabilir.';
  }

  @override
  String get connectProviderLabel => 'Sağlayıcı';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'Bir https:// adresi olmalı. Action belgelerinizi şifresiz bir bağlantı üzerinden göndermez.';

  @override
  String get connectApiKeyLabel => 'API anahtarı';

  @override
  String get connectApiKeyHint => 'Anahtarınızı yapıştırın';

  @override
  String get connectKeyPrivacyNote =>
      'Anahtarınız bu cihazda kalır. Action onu seçtiğiniz sağlayıcı dışında hiçbir yere göndermez ve kaydettikten sonra size bir daha gösteremez.';

  @override
  String get connectModelLabel => 'Model';

  @override
  String get connectModelIdHint => 'Model kimliği';

  @override
  String get connectModelFreeTextNote =>
      'Sağlayıcılar model kimliklerini kullanımdan kaldırır ve yenilerini ekler. İstediğiniz kimlik listede yoksa buraya yazın.';

  @override
  String get connectAndTest => 'Bağlan ve test et';

  @override
  String get connectSaveWithoutTesting => 'Test etmeden kaydet';

  @override
  String get toolWarningFactsNotChecked =>
      'Action bunu asıl metinle karşılaştıramadı, bu yüzden içindeki tutarlar ve tarihler denetlenmedi.';

  @override
  String get toolTitleRewrite => 'Bu yazıyı iyileştir';

  @override
  String get toolDescriptionRewrite =>
      'Daha açık, daha kısa ya da daha resmî — bilgiler olduğu gibi korunur.';

  @override
  String get toolModeRewriteClearer => 'Daha açık';

  @override
  String get toolModeRewriteProfessional => 'Daha profesyonel';

  @override
  String get toolModeRewriteShorter => 'Daha kısa';

  @override
  String get toolModeRewritePersuasive => 'Daha ikna edici';

  @override
  String get toolModeRewriteSimpler => 'Daha yalın';

  @override
  String get toolModeRewriteStructured => 'Daha düzenli';

  @override
  String get toolModeRewriteGrammarOnly => 'Yalnızca dilbilgisi';

  @override
  String get toolSectionWhatChanged => 'Ne değişti';

  @override
  String get toolSectionNote => 'Not';

  @override
  String get toolSectionAlreadyClearBody =>
      'Bu zaten açıktı. Aşağıdaki değişiklikler küçük.';

  @override
  String get toolSectionImprovedText => 'İyileştirilmiş metin';

  @override
  String get toolTitleDraftReply => 'Bir yanıt taslağı yaz';

  @override
  String get toolDescriptionDraftReply =>
      'Düzenleyip kendiniz gönderebileceğiniz bir yanıt.';

  @override
  String get toolModeReplyProfessional => 'Profesyonel';

  @override
  String get toolModeReplyConcise => 'Kısa ve öz';

  @override
  String get toolModeReplyFriendly => 'Samimi';

  @override
  String get toolModeReplyFormal => 'Resmî';

  @override
  String get toolModeReplyClarification => 'Açıklama iste';

  @override
  String get toolModeReplyConfirmation => 'Alındığını bildir';

  @override
  String get toolModeReplyDispute => 'Buna itiraz et';

  @override
  String get toolSectionSubject => 'Konu';

  @override
  String get toolSectionDraftReply => 'Yanıt taslağı';

  @override
  String get toolSectionPlaceholders => 'Bunları sizin doldurmanız gerekiyor';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'Taslak — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'Bu bir taslak. Action hiçbir şey göndermez — okuyun, düzenleyin ve kendiniz gönderin.';

  @override
  String get toolTitleTranslate => 'Çevir';

  @override
  String get toolDescriptionTranslate =>
      'Başka bir dil; sayılar ve adlar olduğu gibi korunur.';

  @override
  String get toolSectionTranslation => 'Çeviri';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return '$from dilinden $to diline';
  }

  @override
  String get toolSectionKeptInOriginal => 'Asıl hâliyle bırakılanlar';

  @override
  String get toolWarningTranslationNotCertified =>
      'Anlamak için bir çeviri; yeminli çeviri değil.';

  @override
  String get toolTitleStructuredData => 'Tablo çıkar';

  @override
  String get toolDescriptionStructuredData =>
      'Kopyalayıp alabileceğiniz satırlar, alanlar ve sayılar.';

  @override
  String get toolSectionTable => 'Tablo';

  @override
  String get toolSectionFields => 'Alanlar';

  @override
  String get toolSectionTableCsv => 'Tablo (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'Bu tablonun sütun düzeni güvenilir biçimde okunamadı. Kullanmadan önce satırların hizalı olduğunu kontrol edin.';

  @override
  String get toolTitleDeadlineFinder => 'Son tarihleri bul';

  @override
  String get toolDescriptionDeadlineFinder =>
      'Ne yapılması gerekiyor, ne zamana kadar ve yapılmazsa ne oluyor.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count son tarih',
      one: '1 son tarih',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'Süresi gelen bir şey yok';

  @override
  String get toolSectionNothingDueBody =>
      'Action bu içerikte hiçbir son tarih ya da yükümlülük bulamadı.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'Siz seçmeden hiçbir şey zamanlanmaz. Hatırlatıcılar asla kendiliğinden kurulmaz.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'Yapılmazsa: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'Size gerekenler: $items';
  }

  @override
  String get moneyErrorEmpty => 'tutar girilmemiş';

  @override
  String get moneyErrorMalformed => 'tutar düz bir sayı değil';

  @override
  String get moneyErrorNegative => 'eksi bir tutar ödenecek bir meblağ olamaz';

  @override
  String get moneyErrorTooManyDecimals =>
      'para biriminin sahip olduğundan daha fazla ondalık basamak';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'para birimi kodu tanıdıklarımızdan biri değil';

  @override
  String get moneyErrorOutOfRange => 'tutar inandırıcı olmayacak kadar büyük';

  @override
  String get escalationOcrFailed => 'Bu yakalamada tanıma hiç çalıştırılamadı.';

  @override
  String get escalationNoTextRecognised =>
      'Bu bir belgeye benziyor ama hiç metin tanınmadı.';

  @override
  String get escalationThinText =>
      'Bu boyutta bir belgeye göre fazlasıyla az metin tanındı.';

  @override
  String get escalationLowLineConfidence =>
      'Tanıyıcı birkaç satırda düşük güven bildirdi.';

  @override
  String get escalationTableLikeLayout =>
      'Yerleşim bir tabloya benziyor ve satır satır okumak, hangi değerin hangi satıra ait olduğunu kaybediyor.';

  @override
  String get escalationFragmentedLayout =>
      'Metin çok sayıda küçücük parça hâlinde döndü, bu yüzden yapısı belirsiz.';

  @override
  String get escalationMalformedText =>
      'Tanınan metnin çoğu okunabilir sözcük ya da sayı değil.';

  @override
  String get escalationConflictingDates =>
      'Birden fazla tarih son tarih olarak sunulmuş.';

  @override
  String get escalationConflictingAmounts =>
      'Birden fazla tutar, ödenecek meblağ olarak sunulmuş.';

  @override
  String get escalationUnresolvedGrounding =>
      'Bazı değerlerin belge metninde nereden geldiği bulunamadı.';

  @override
  String get escalationInstructionLikeContent =>
      'Belge, uygulamaya verilmiş talimat gibi yazılmış metin içeriyor. Bu metin belge içeriği olarak ele alınır, asla talimat olarak değil.';

  @override
  String get providerFailureNetwork =>
      'Action hizmete ulaşamadı. Bağlantınızı kontrol edin.';

  @override
  String get providerFailureTimedOut =>
      'Hizmetin yanıt vermesi çok uzun sürdü.';

  @override
  String get providerFailureServiceUnavailable =>
      'Hizmet geçici olarak kullanılamıyor. Daha sonra yeniden deneyin.';

  @override
  String get providerFailureUnauthorized =>
      'Bu uygulamanın şu anda hizmeti kullanma yetkisi yok.';

  @override
  String get providerFailureBlocked => 'Hizmet bu belgeyi işlemeyi reddetti.';

  @override
  String get providerFailureUnknown =>
      'Action bu belgeyi okuyamadı. Yeniden denemek işe yarayabilir.';

  @override
  String get reviewBlockerTitle => 'Bu göreve bir başlık verin.';

  @override
  String get reviewBlockerDate =>
      'Hangi tarihin gerçek son tarih olduğunu seçin ya da boş bırakın.';

  @override
  String get reviewBlockerAmount =>
      'Hangi tutarın doğru olduğunu seçin ya da boş bırakın.';

  @override
  String get reviewBlockerStepTitle =>
      'Sakladığınız adımların bir başlığı olmalı.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'sayfa $page',
      one: 'sayfa 1',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'sayfa $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Yeniden yazılan metinde artık $values yok. Kullanmadan önce kontrol edin.',
      one:
          'Yeniden yazılan metinde artık $values yok. Kullanmadan önce kontrol edin.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Yeniden yazılan metinde artık $values ve $count tane daha yok. Kullanmadan önce kontrol edin.',
      one:
          'Yeniden yazılan metinde artık $values ve 1 tane daha yok. Kullanmadan önce kontrol edin.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'Ulaşıldı';

  @override
  String get goalNewSheetTitle => 'Neyin gerçekleşmesini istiyorsunuz?';

  @override
  String get goalNewSheetSubtitle =>
      'Bir cümle yeter. Ayrıntıları sonra ekleyebilirsiniz.';

  @override
  String get goalTitleHint => 'Araç sigortasını fazla ödeme yapmadan yenile.';

  @override
  String get goalCreateAction => 'Hedef oluştur';

  @override
  String get goalTitleSheetTitle => 'Ne istediğiniz';

  @override
  String get goalOutcomeSheetTitle => 'Bitmiş hâli neye benzer';

  @override
  String get goalContextSheetTitle => 'Şu anki durum';

  @override
  String get goalOutcomeHint => 'Araç sigortalı ve evraklar dosyalandı.';

  @override
  String get goalContextHint => 'İki teklifim var ve yenileme ayın 18\'inde.';

  @override
  String get goalWorkspaceTitle => 'Hedef';

  @override
  String get goalUnmarkReached => 'Ulaşıldı işaretini kaldır';

  @override
  String get goalMarkReached => 'Ulaşıldı olarak işaretle';

  @override
  String get goalNotFound => 'O hedef artık burada değil.';

  @override
  String get goalDeleteTitle => 'Bu hedef silinsin mi?';

  @override
  String get goalDeleteBody =>
      'Hedef bu cihazdan silinir. Ondan oluşturulan görevler tam olduğu gibi kalır.';

  @override
  String get goalOutcomeLabel => 'Bittiğinde neye benzeyecek';

  @override
  String get goalOutcomeEmpty =>
      'Henüz yazılmadı. Bitirmenin ne demek olduğunu söylediğinizde bir hedefi planlamak kolaylaşır.';

  @override
  String get goalContextLabel => 'Şu anki durum';

  @override
  String get goalContextEmpty =>
      'Henüz bir şey yazılmadı. Şimdiye kadar olanlar ve önünde duranlar.';

  @override
  String get goalTitleLabel => 'Ne istiyorsunuz';

  @override
  String get goalEditTooltip => 'Hedefi düzenle';

  @override
  String get goalToolsLabel => 'Action neler yapabilir';

  @override
  String get goalToolsNotReady =>
      'İstediğiniz şey hakkında biraz daha yazın, o zaman bu araçların üzerinde çalışacağı bir şey olur.';

  @override
  String get toolGoalOptimizerTitle => 'Bir hedefi keskinleştir';

  @override
  String get toolActionPlanTitle => 'Bir plan kur';

  @override
  String get resultFactUnconfirmed => 'Onaylanmamış';

  @override
  String get resultSuggestedSteps => 'Önerilen adımlar';

  @override
  String get resultSuggestedAction => 'Önerilen görev';

  @override
  String get resultWorthAsking => 'Sorulmaya değer';

  @override
  String get resultSuggestedDeadlines => 'Önerilen son tarihler';

  @override
  String get resultSuggestions => 'Öneriler';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count destekleyici alıntı',
      one: '1 destekleyici alıntı',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'Seçilen kaynaktan';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => 'Belgeniz hazırlanıyor';

  @override
  String get toolRunStageReading => 'Seçilen sayfalar okunuyor';

  @override
  String get toolRunStageAnalysing => 'Çözümleniyor';

  @override
  String get toolRunStageBuilding => 'Gözden geçirmeniz oluşturuluyor';

  @override
  String get toolRunStageDone => 'Tamamlandı';

  @override
  String get toolRunStageFailed => 'Bu bitmedi';

  @override
  String get toolRunStageCancelled => 'Durdurdunuz';

  @override
  String get toolRunFailureLocalCheckFailed => 'Bu denetlenemedi.';

  @override
  String get toolRunFailureProviderRetired =>
      'O yapay zekâ sağlayıcı bu sürümde artık kullanılamıyor.';

  @override
  String get toolRunFailureUnusableReply =>
      'O yanıt kullanılabilir bir biçimde dönmedi. Yeniden deneyin.';

  @override
  String get toolRunFailureQuestionRequired => 'Önce bir soru yazın.';

  @override
  String get toolRunFailureInputRequired =>
      'Bu aracın üzerinde çalışacağı bir şey seçin.';

  @override
  String get toolWarningReplyTruncated =>
      'Bu yanıt yarıda kesildi, bu yüzden eksik olabilir.';

  @override
  String get toolWarningNoSupportingQuotes =>
      'Modeliniz destekleyici hiçbir alıntı döndürmedi, bu yüzden buradaki hiçbir şeyin dayanağı yok. Buna göre hareket etmeden önce belgeyle karşılaştırın.';

  @override
  String get aiSettingsRemoveTitle => 'Bu bağlantı kaldırılsın mı?';

  @override
  String get aiSettingsRemoveBody =>
      'Action, API anahtarınızı bu cihazdan silecek ve yapay zekâ özelliklerini kullanmayı bırakacak. Sağlayıcınızdaki hesabınız bundan etkilenmez.';

  @override
  String get aiSettingsProviderLabel => 'Sağlayıcı';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'Kullandığınız kadarının ücretini sağlayıcınız alır. Action kendi başına hiçbir zaman istek göndermez.';

  @override
  String get aiSettingsConnectLabel => 'Bir yapay zekâ sağlayıcı bağla';

  @override
  String get aiSettingsConnectDescription =>
      'Kendi hesabınızı ve API anahtarınızı OpenAI, Anthropic, Google Gemini ya da uyumlu bir endpoint ile kullanın.';

  @override
  String get aiSettingsModelLabel => 'Model';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'API anahtarı';

  @override
  String get aiSettingsKeyStored => 'Bu cihazın güvenli deposunda tutulur.';

  @override
  String get aiSettingsKeyMissing =>
      'Bu cihazda anahtar bulunamadı. Bir tane eklemek için yeniden bağlanın.';

  @override
  String get aiSettingsTestLabel => 'Bağlantıyı test et';

  @override
  String get aiSettingsProviderUnavailable =>
      'O sağlayıcı bu sürümde kullanılamıyor.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'Bağlandı. $count model kullanılabilir.';
  }

  @override
  String get aiSettingsTestButton => 'Test et';

  @override
  String get aiSettingsChangeProvider => 'Sağlayıcıyı ya da modeli değiştir';

  @override
  String get aiSettingsRemoveKey => 'Anahtarı kaldır';

  @override
  String get aiSettingsSectionPrivacy => 'Gizlilik';

  @override
  String get aiSettingsWhatGetsSentLabel => 'Ne gönderiliyor';

  @override
  String get aiSettingsWhereItGoesLabel => 'Nereye gidiyor';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'Siz bir sağlayıcı bağlayana kadar hiçbir şey gönderilmez.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'Doğrudan $provider sağlayıcısına, kendi anahtarınızla gider. Action\'a ait hiçbir sunucudan geçmez.';
  }

  @override
  String get aiSettingsSectionData => 'Veriler';

  @override
  String get aiSettingsDataFootnote =>
      'Action hangi araçları kullandığınızı hatırlar, onları neyin üzerinde kullandığınızı asla.';

  @override
  String get aiSettingsRecentToolsLabel => 'Son kullanılan araçlar';

  @override
  String get aiSettingsRecentToolsNone => 'Yok';

  @override
  String get reminderNotificationTitle => 'Action hatırlatıcısı';

  @override
  String get reminderNotificationPrivateBody =>
      'Gözden geçirmeniz gereken bir şey var.';

  @override
  String get reminderChannelName => 'Action hatırlatıcıları';

  @override
  String get reminderChannelDescription =>
      'Görevleriniz için kendi kurduğunuz hatırlatıcılar.';

  @override
  String get onboardingStart => 'Action\'ı kullanmaya başla';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return '$total adımdan $current.';
  }

  @override
  String get onboardingCaptureTitle => 'Bilgiyi göreve dönüştürün';

  @override
  String get onboardingCaptureBody =>
      'Bir ekran görüntüsü, bir fotoğraf ya da size gönderilmiş bir metin ekleyin. Action onu okur ve sizden ne yapmanızın istendiğini çıkarır.';

  @override
  String get onboardingReviewTitle => 'Siz onaylamadan hiçbir şey kaydedilmez';

  @override
  String get onboardingReviewBody =>
      'Action neyi bulduğunu ve hangi sözcüklerden geldiğini gösterir. Yanlış olan neyse siz düzeltirsiniz. Siz onaylayana kadar bu bir öneridir — bir olgu değil, bir görev de değil.';

  @override
  String get onboardingTrackingTitle => 'Önemli olanı takip edin';

  @override
  String get onboardingTrackingBody =>
      'İlgi bekliyor, gecikmiş ya da yaklaşan ne varsa öne çıkarır. Her görev kendi sonraki adımını, ilerlemesini ve onun için kurduğunuz hatırlatıcıları saklar.';

  @override
  String get onboardingPrivacyBody => 'Başlamadan önce bilinmesi gerekenler:';

  @override
  String get onboardingPrivacyOnDevice =>
      'Görevleriniz, yakalamalarınız, hatırlatıcılarınız ve aramalarınız bu cihazda saklanır. Arama ve hatırlatıcılar bağlantı olmadan da çalışır.';

  @override
  String get onboardingPrivacySentToRead =>
      'Action\'dan bir şeyi okumasını istediğinizde, o içerik onu yorumlayan yapay zekâ hizmetine gönderilir.';

  @override
  String get onboardingPrivacyCloud =>
      'Onaylanmış bir görevin kısa bir kaydı — başlığı, tarihleri, tutarı ve önerilen adımı — bu cihaza ait anonim bir kimlik altında bulutta saklanabilir. Yakalamalarınız, adımlarınız ve hatırlatıcılarınız saklanmaz.';

  @override
  String get onboardingPrivacyNotBackup =>
      'Bu kayıt bir yedek değildir. Yeni bir cihaza hiçbir şeyi geri yükleyemez.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count engel',
      one: '1 engel',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'Daha basit olabilir';

  @override
  String get toolDescriptionGoalOptimizer =>
      'Ne eksik, önünü ne kesiyor, önce ne yapmalı.';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'Şundan sonra: $step';
  }

  @override
  String get toolSectionThePlan => 'Plan';

  @override
  String get toolDescriptionActionPlan =>
      'Görevlere dönüştürebileceğiniz, sıralanmış bir adımlar kümesi.';

  @override
  String get toolTitleSmartChecklist => 'Bir kontrol listesi çıkar';

  @override
  String get toolDescriptionSmartChecklist =>
      'Bunun sizden istediği her şey, sırasıyla.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count eksik ayrıntı',
      one: '1 eksik ayrıntı',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'Bunlar birbiriyle çelişiyor';

  @override
  String get toolTitleMissingInformation => 'Eksik olan ne';

  @override
  String get toolDescriptionMissingInformation =>
      'Boşluklar ve onlar hakkında ne sorulacağı.';

  @override
  String get aiAdapterTimedOut => 'Bu çok uzun sürdü ve durduruldu.';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'Yapay zekâ sağlayıcınıza kurulan güvenli bağlantı başarısız oldu.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action o modeli ya da endpoint adresini bulamadı.';

  @override
  String get aiAdapterRequestRejected =>
      'Yapay zekâ sağlayıcınız o isteği reddetti.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action bu cihazın güvenli deposunu açamadı.';

  @override
  String get aiAdapterEndpointMissing =>
      'Ayarlar\'da yapay zekâ endpoint adresinizi ekleyin.';

  @override
  String get aiAdapterReplyIncomplete => 'O yanıt eksikti. Yeniden deneyin.';

  @override
  String get aiAdapterContentDeclined =>
      'Sağlayıcınız o içeriği işlemeyi kabul etmedi.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'Bu, bir seferde $limit dosyadan fazla. Daha azını seçin.';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'O görüntülerden biri çözümlenemeyecek kadar büyük.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '“$filename” çözümlenemeyecek kadar büyük. Sınır $limit MB.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '“$filename” $count sayfa. Action bir seferde en çok $limit sayfa okur — bir aralık seçin.';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'Bu seçim tek bir istekte gönderilemeyecek kadar büyük.';

  @override
  String get toolRunNotAvailableTitle => 'O araç kullanılamıyor';

  @override
  String get toolRunNotAvailableMessage =>
      'Action\'ın daha yeni bir sürümünde kaldırılmış olabilir.';

  @override
  String get toolRunNoSourcesYet =>
      'Üzerinde çalışılacak bir şey yok. Bir şey yakalayın ya da aşağıya biraz metin yapıştırın.';

  @override
  String get toolRunChooseSourcesToCompare => 'Neyi karşılaştıracağınızı seçin';

  @override
  String get toolRunChooseSource => 'Bir kaynak seçin';

  @override
  String get toolRunQuestionLabel => 'Sorunuz';

  @override
  String get toolRunQuestionHint => 'Son tarih ne zaman?';

  @override
  String get toolRunFreeTextLabel => 'Ya da biraz metin yapıştırın';

  @override
  String get toolRunFreeTextHint => 'Buraya yapıştırın ya da yazın';

  @override
  String get toolRunModeLabel => 'Biçim';

  @override
  String get toolRunRunLocally => 'Bu cihazda denetle';

  @override
  String get toolRunRun => 'Çalıştır';

  @override
  String get toolRunStop => 'Durdur';

  @override
  String get toolRunRunAgain => 'Yeniden çalıştır';

  @override
  String get toolRunWorkingOn => 'Üzerinde çalışılan:';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'Bu $provider sağlayıcısına gönderilsin mi?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'Seçtiğiniz içerik, kendi API anahtarınızla işlenmek üzere $provider sağlayıcısına gönderilecek.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'Anahtarınız bu cihazda kalır. Action arka planda hiçbir şey göndermez, diğer görevlerinizi ya da kaynaklarınızı da göndermez.';

  @override
  String get toolRunScopeTitle => 'Bu çalışmadan önce';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$provider bağlantınız kullanılarak $count sayfa çözümlenecek.',
      one: '$provider bağlantınız kullanılarak 1 sayfa çözümlenecek.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$provider bağlantınız kullanılarak $count dosya çözümlenecek.',
      one: '$provider bağlantınız kullanılarak 1 dosya çözümlenecek.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'Seçtiğiniz metin $provider bağlantınıza gönderilecek.';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'Bu aracı kullanmak için bir yapay zekâ sağlayıcı bağlayın';

  @override
  String get toolRunNeedsProviderBody =>
      'Kendi sağlayıcı hesabınızı ve kendi API anahtarınızı kullanırsınız.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adımdan görev oluşturuldu.',
      one: '1 adımdan görev oluşturuldu.',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adım eklendi.',
      one: '1 adım eklendi.',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Görev oluştur · $count adım',
      one: 'Görev oluştur · 1 adım',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bu göreve ekle · $count adım',
      one: 'Bu göreve ekle · 1 adım',
    );
    return '$_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'Fotoğraf';

  @override
  String get sourceTypeLabelScreenshot => 'Ekran görüntüsü';

  @override
  String get sourceTypeLabelPastedText => 'Yapıştırılan not';

  @override
  String get sourceTypeLabelDocument => 'Belge';

  @override
  String get toolModeClearer => 'Daha anlaşılır';

  @override
  String get toolModeMoreProfessional => 'Daha profesyonel';

  @override
  String get toolModeShorter => 'Daha kısa';

  @override
  String get toolModeSimpler => 'Daha yalın';

  @override
  String get toolModeMoreStructured => 'Daha düzenli';

  @override
  String get toolModeMorePersuasive => 'Daha ikna edici';

  @override
  String get toolModeGrammarOnly => 'Yalnızca dilbilgisi';

  @override
  String get toolModeProfessional => 'Profesyonel';

  @override
  String get toolModeConcise => 'Özlü';

  @override
  String get toolModeFriendly => 'Samimi';

  @override
  String get toolModeFormal => 'Resmî';

  @override
  String get toolModeAskForClarification => 'Açıklama iste';

  @override
  String get toolModeConfirm => 'Teyit et';

  @override
  String get toolModeDispute => 'Buna itiraz et';

  @override
  String get toolModeQuick => 'Hızlı bakış';

  @override
  String get toolModeDetailed => 'Ayrıntılı';

  @override
  String get toolModeExecutive => 'Yönetici özeti';

  @override
  String get toolModeKeyPoints => 'Önemli noktalar';

  @override
  String get toolModeActionFocused => 'Göreve odaklı';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Alıntılanan $count ayrıntı seçtiğiniz şeyin içinde bulunamadı, bu yüzden belirsiz olarak işaretlendi.',
      one: 'Alıntılanan 1 ayrıntı seçtiğiniz şeyin içinde bulunamadı, bu yüzden belirsiz olarak işaretlendi.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action bu alıntıları dosyanın kendisiyle karşılaştırıp denetleyemedi, bu yüzden denetlenmediler.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gecikmiş · $count gün',
      one: 'Gecikmiş · 1 gün',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'Yarın son gün';

  @override
  String get triageBadgeReminderSoon => 'Hatırlatıcı yakında';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün gecikti',
      one: '1 gün gecikti',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status. $title';
  }

  @override
  String get triageExplanationDone => 'Bu bitti.';

  @override
  String get triageExplanationNothingPressing =>
      'Bu burada, çünkü onunla ilgili henüz acil bir şey yok.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'Bu ilgi bekliyor çünkü $reason.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'Bu daha aşağıda çünkü $reason.';
  }

  @override
  String get triageReasonOverdue => 'gecikmiş';

  @override
  String get triageReasonDeadlinePassed => 'son tarihi geçti';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gündür gecikmiş',
      one: 'bir gündür gecikmiş',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'bugün son gün';

  @override
  String get triageReasonCriticalDueSoon =>
      'siz kritik olarak işaretlediniz ve son tarihi yaklaştı';

  @override
  String get triageReasonAllStepsDone =>
      'bütün adımlar bitti — geriye yalnızca bitirmek kaldı';

  @override
  String get triageReasonDueTomorrow => 'yarın son gün';

  @override
  String get triageReasonReminderSoon =>
      'önümüzdeki bir gün içinde onun için bir hatırlatıcı kurdunuz';

  @override
  String get triageReasonDueWithinThreeDays => 'son tarihi üç gün içinde';

  @override
  String get triageReasonCriticalNoDeadline =>
      'siz kritik olarak işaretlediniz ve son tarihi yok';

  @override
  String get triageReasonDueWithinSevenDays => 'son tarihi bir hafta içinde';

  @override
  String get triageReasonImportant => 'siz önemli olarak işaretlediniz';

  @override
  String get triageReasonDueLater => 'son tarihi daha uzakta';

  @override
  String get triageReasonNoDeadline => 'son tarihi yok ve acil bir şey yok';

  @override
  String cardCompletedTooltip(String title) {
    return 'Tamamlandı: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'Bu belgeyi anla';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'Bunun ne olduğu, neyin önemli olduğu ve bu konuda ne yapılacağı.';

  @override
  String get toolSectionWhatThisIs => 'Bu ne';

  @override
  String get toolSectionWhatMatters => 'Önemli olan ne';

  @override
  String get toolSectionKeyDetails => 'Başlıca ayrıntılar';

  @override
  String get toolTitleAskDocument => 'Bir kaynak hakkında soru sor';

  @override
  String get toolDescriptionAskDocument =>
      'Yalnızca sizin seçtiğinize dayanan yanıtlar — ya da hiçbir yanıt.';

  @override
  String get toolSectionNoAnswer => 'Bu içerikte yanıt bulunamadı';

  @override
  String get toolSectionNoAnswerBody => 'Action bunu seçilen belgede bulamadı.';

  @override
  String get toolSectionAnswer => 'Yanıt';

  @override
  String get toolSectionFromTheDocument => 'Belgeden';

  @override
  String get toolWarningQuoteNotFound =>
      'Bu yanıtın dayandığı alıntı seçilen içerikte yok. Yanıtı güvenilmez sayın.';

  @override
  String get toolTitleSmartSummary => 'Özetle';

  @override
  String get toolDescriptionSmartSummary =>
      'Kısa hâli — ya da sizin yapmanız gerekeni değiştiren hâli.';

  @override
  String get toolSectionKeyPoints => 'Önemli noktalar';

  @override
  String get toolTitleCompareDocuments => 'Belgeleri karşılaştır';

  @override
  String get toolDescriptionCompareDocuments =>
      'Ne değişmiş, ne çelişiyor, ne eksik.';

  @override
  String get toolSectionWhatDiffers => 'Neler farklı';

  @override
  String get toolSectionConflicts => 'Çelişkiler';

  @override
  String get toolSectionOnlyInOne => 'Yalnızca birinde geçenler';

  @override
  String get toolSectionInCommon => 'Ortak olanlar';

  @override
  String get sensitiveKindEmail => 'E-posta adresi';

  @override
  String get sensitiveKindPhone => 'Telefon numarası';

  @override
  String get sensitiveKindPaymentCard => 'Ödeme kartı numarası';

  @override
  String get sensitiveKindIban => 'Banka hesabı (IBAN)';

  @override
  String get sensitiveKindNationalId => 'Ulusal kimlik numarası';

  @override
  String get sensitiveKindPostcode => 'Posta kodu';

  @override
  String get sensitiveKindAccountNumber => 'Hesap numarası';

  @override
  String get sensitiveKindReference => 'Referans numarası';

  @override
  String get sensitiveKindDateOfBirth => 'Doğum tarihi';

  @override
  String get sensitiveKindUrl => 'Web adresi';

  @override
  String get verdictVerifiedProvenance => 'Doğrulanmış köken bilgisi var';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'Bu dosya, denetlenen ve geçerli çıkan bir imza taşıyor.';

  @override
  String get verdictSignalsSynthetic =>
      'Yapay zekâ ile üretilmiş içerikle uyumlu işaretler';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'Bu dosya, üretken bir araçla yapıldığını söylüyor. Meta veri düzenlenebilir ya da kaldırılabilir; dolayısıyla bu, dosyanın iddiasıdır, kanıt değildir.';

  @override
  String get verdictSignalsEdited => 'Düzenlenmiş içerikle uyumlu işaretler';

  @override
  String get verdictSignalsEditedExplainer =>
      'Bu dosya, bir düzenleme yazılımından geçtiğini söylüyor. Bu, fotoğraflar için olağandır ve tek başına bir şeyin sahte olduğu anlamına gelmez.';

  @override
  String get verdictNoReliableProvenance =>
      'Güvenilir köken bilgisi bulunamadı';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'Bu dosyada köken bilgisi yok. Bu normaldir — çoğu hizmet bunu siler — ve hiçbir şeyin işareti değildir.';

  @override
  String get verdictInconclusive => 'Sonuç belirsiz';

  @override
  String get verdictInconclusiveExplainer =>
      'Burada, bunun nereden geldiğini söylemeye yetecek bilgi yok.';

  @override
  String get authenticitySignalCamera => 'Kamera';

  @override
  String get authenticitySignalSoftware => 'Yazılım';

  @override
  String get authenticitySignalDescription => 'Açıklama';

  @override
  String get authenticitySignalCopyright => 'Telif hakkı';

  @override
  String get authenticitySignalLocation => 'Konum';

  @override
  String get authenticitySignalLocationValue => 'Bu dosyada konum verisi var.';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'Denetlenmedi — bu sürümde imza doğrulayıcı yok.';

  @override
  String get authenticitySignalFile => 'Dosya';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'Görsel olarak okunamadı.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'Tanınan bir görsel biçimi değil.';

  @override
  String get authenticitySignalText => 'Metin';

  @override
  String get authenticitySignalTextValue =>
      'Tek başına metin, yapay zekâ kullanılıp kullanılmadığını güvenilir biçimde gösteremez. Action tahmin yürütmez.';

  @override
  String get fileTypePng => 'bir PNG görseli';

  @override
  String get fileTypeJpeg => 'bir JPEG görseli';

  @override
  String get fileTypeGif => 'bir GIF görseli';

  @override
  String get fileTypeWebp => 'bir WebP görseli';

  @override
  String get fileTypeWav => 'bir WAV kaydı';

  @override
  String get fileTypePdf => 'bir PDF belgesi';

  @override
  String get fileTypeHeic => 'bir HEIC görseli';

  @override
  String get fileTypeVideo => 'bir video dosyası';

  @override
  String get fileTypeTiff => 'bir TIFF görseli';

  @override
  String get fileTypeBitmap => 'bir bitmap görseli';

  @override
  String get fileTypeRtf => 'bir RTF belgesi';

  @override
  String get fileTypeZip => 'bir Zip arşivi';

  @override
  String get fileTypeGzip => 'bir gzip arşivi';

  @override
  String get fileTypeSevenZip => 'bir 7-Zip arşivi';

  @override
  String get fileTypeRar => 'bir RAR arşivi';

  @override
  String get fileTypeWindowsProgram => 'bir Windows programı';

  @override
  String get fileTypeLinuxProgram => 'bir Linux programı';

  @override
  String get fileTypePostScript => 'bir PostScript belgesi';

  @override
  String get fileTypeOgg => 'bir Ogg kaydı';

  @override
  String get fileTypeMp3 => 'bir MP3 kaydı';

  @override
  String get fileTypePlainText => 'düz metin';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'Bu dosyanın adı \".$extension\" ama içeriği $contents. Bu, iyi niyetli bir hata olabilir; aynı zamanda bir dosyanın beklediğinizden başka bir şeyle açılmasının da yoludur.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bayt',
      one: '1 bayt',
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
  String get credentialKindPrivateKey => 'Özel anahtar';

  @override
  String get credentialKindApiKey => 'API anahtarı';

  @override
  String get credentialKindConnectionString => 'Bağlantı dizesi';

  @override
  String get credentialKindAccessToken => 'Erişim belirteci';

  @override
  String get credentialKindAuthorizationHeader => 'Authorization başlığı';

  @override
  String get credentialKindPasswordOrKey => 'Parola ya da anahtar';

  @override
  String get credentialKindPossibleSecret => 'Olası gizli değer';

  @override
  String get credentialAdvicePrivateKey =>
      'Bunu paylaşmadan önce kaldırın ve anahtar çiftini değiştirin. Bir özel anahtar, bir kez görüldükten sonra bir daha güvenli hâle getirilemez.';

  @override
  String get credentialAdviceProviderApiKey =>
      'Bu anahtarı sağlayıcınızda iptal edin ve yenisini oluşturun. Belgeden kaldırmak onu devre dışı bırakmaz.';

  @override
  String get credentialAdviceConnectionString =>
      'Bu, hem bir parolayı hem de o parolanın açtığı adresi taşıyor. Bu zaten paylaşıldıysa parolayı değiştirin.';

  @override
  String get credentialAdviceJsonWebToken =>
      'Bunun gibi belirteçlerin süresi çoğu zaman dolar, ama her zaman değil. Ne zaman dolacağını bilmiyorsanız onu çalışır durumda sayın.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'Başlığın değerini kaldırın. Yapıştırılan istek kayıtları, çalışan bir belirtecin kazara paylaşılmasının en yaygın yollarından biridir.';

  @override
  String get credentialAdviceKeyedAssignment =>
      'Bunu bir ortam değişkenine ya da bir gizli değer deposuna taşıyın; dosya paylaşıldıysa değeri de değiştirin.';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action bunun ne olduğunu anlayamıyor. Paylaşmadan önce kontrol edin — bu, aynı ölçüde bir tanımlayıcı ya da bir sağlama toplamı da olabilir.';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic API anahtarı';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI proje anahtarı';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'OpenAI tarzı API anahtarı';

  @override
  String get credentialLabelGoogleApiKey => 'Google API anahtarı';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google OAuth belirteci';

  @override
  String get credentialLabelGitHubToken => 'GitHub belirteci';

  @override
  String get credentialLabelSlackToken => 'Slack belirteci';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS erişim anahtarı kimliği';

  @override
  String get credentialLabelGitLabToken => 'GitLab belirteci';

  @override
  String get credentialLabelNpmToken => 'npm belirteci';

  @override
  String get credentialLabelPassphrase => 'Parola cümlesi';

  @override
  String get credentialLabelPassword => 'Parola';

  @override
  String get credentialLabelRefreshToken => 'Yenileme belirteci';

  @override
  String get credentialLabelToken => 'Belirteç';

  @override
  String get credentialLabelClientSecret => 'İstemci gizli anahtarı';

  @override
  String get credentialLabelCredential => 'Kimlik bilgisi';

  @override
  String get credentialLabelSecret => 'Gizli değer';

  @override
  String get linkVerdictNoObviousSignals => 'Belirgin bir işaret yok';

  @override
  String get linkVerdictWorthChecking => 'Bakmaya değer';

  @override
  String get linkVerdictTreatWithCaution => 'Dikkatli yaklaşın';

  @override
  String get linkSummaryNoObviousSignals =>
      'Bu bağlantının yazılışında olağandışı bir şey yok. Bu, sayfanın güvenilir olduğunu bilmekle aynı şey değildir — bunu bekleyip beklemediğinize yalnızca siz karar verebilirsiniz.';

  @override
  String get linkSummaryWorthChecking =>
      'Bu bağlantıyla ilgili bir şey, onu açmadan önce bakmaya değer.';

  @override
  String get linkSummaryTreatWithCaution =>
      'Bu bağlantının yazılışıyla ilgili birkaç şey, onu açmadan önce kontrol etmeye değer.';

  @override
  String get linkSignalNotHttps => 'Şifreli değil';

  @override
  String get linkSignalNonWebScheme => 'Web bağlantısı değil';

  @override
  String get linkSignalEmbeddedCredentials => 'Bağlantıda parola';

  @override
  String get linkSignalMisleadingAuthority => 'Gizlenmiş gerçek adres';

  @override
  String get linkSignalIpLiteralHost => 'Sayısal adres';

  @override
  String get linkSignalPunycodeHost => 'Adda kodlanmış karakterler';

  @override
  String get linkSignalMixedScriptHost => 'Adda karışık alfabeler';

  @override
  String get linkSignalEncodedHost => 'Adda kaçış karakterleri';

  @override
  String get linkSignalUnusualPort => 'Olağandışı port';

  @override
  String get linkSignalDeepSubdomain => 'Adda çok sayıda parça';

  @override
  String get linkSignalPublicSuffixInSubdomain => 'Tanıdık ad yanlış yerde';

  @override
  String get linkSignalShortener => 'Kısaltılmış bağlantı';

  @override
  String get linkSignalExecutableTarget => 'Bir program indirir';

  @override
  String get linkSignalRedirectParameter => 'Sizi başka bir yere gönderir';

  @override
  String get linkSignalVeryLongUrl => 'Çok uzun';

  @override
  String get linkSignalUnparseable => 'Okunabilir bir bağlantı değil';

  @override
  String get linkDetailNotHttps =>
      'Bu bağlantı http kullanıyor; bu yüzden sayfaya yazdığınız her şey yolda okunabilir.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'Bu, bir web sayfası yerine \"$scheme:\" ile açılıyor. Başka bir uygulamadan bir şey yapmasını isteyebilir.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'Bu bağlantının içine bir kullanıcı adı ve parola yazılmış. Bağlantı nereye paylaşılırsa onlar da onunla birlikte gider.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'Tarayıcı, \"@\" işaretinden önceki her şeyi yok sayar. Asıl varış noktası \"$host\".';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'Bu, \"$host\" adresine gidiyor — bir ad değil, ham bir adres. Meşru siteler neredeyse her zaman bir ad kullanır.';
  }

  @override
  String get linkDetailPunycodeHost =>
      'Site adı, kodlanmış olarak saklanan Latin dışı karakterler içeriyor. Bu, birçok dil için normaldir ve aynı zamanda bir adın tanıdık bir ada benzetilmesinin de yoludur.';

  @override
  String get linkDetailMixedScriptHost =>
      'Site adı, Latin harfleriyle başka bir alfabeden gelen ve onlara aynı görünen harfleri karıştırıyor. Adı karakter karakter okuyun.';

  @override
  String get linkDetailEncodedHost =>
      'Site adı kaçış kodları içeriyor; oysa oraları onların yeri değil. Bunlar, adın aslında ne yazdığını gizleyebilir.';

  @override
  String linkDetailUnusualPort(String port) {
    return 'Bu, olağan port yerine $port portu üzerinden bağlanıyor. Bu, test sunucularında yaygın, herkese açık sitelerde olağandışıdır.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Adın $count parçası var. Siteyi kimin işlettiğine yalnızca son iki tanesi karar verir; geri kalanı herhangi bir şey olarak ayarlanabilir.',
      one:
          'Adın $count parçası var. Siteyi kimin işlettiğine yalnızca son iki tanesi karar verir; geri kalanı herhangi bir şey olarak ayarlanabilir.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'Bu ad, ortasında \".$suffix.\" içeriyor; bu da başlangıcını sitenin kendisi gibi gösteriyor. Site aslında \"$host\".';
  }

  @override
  String get linkDetailShortener =>
      'Bir kısaltma hizmeti asıl varış noktasını gizler. Bunun nereye gittiğini açmadan bilemezsiniz.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'Bu bağlantı \"$fileExtension\" ile bitiyor; yani okunacak bir sayfa değil, cihazınızda çalışabilecek bir şey indiriyor.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'Bu bağlantı, \"$parameter\" ayarında ikinci bir adres taşıyor; bu yüzden açmak sizi \"$host\" dışında bir yere götürebilir.';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'Uzun bağlantıların okunması daha zordur ve varış noktasını belirleyen kısım görüş alanının dışına itilebilir.';

  @override
  String get linkDetailUnparseable =>
      'Action bunu bir web adresi olarak okuyamadı. Bağlantıya benzemeyen bağlantılara karşı dikkatli olun.';

  @override
  String get toolTitleRedaction => 'Hassas ayrıntıları gizle';

  @override
  String get toolDescriptionRedaction =>
      'Paylaşılmaması gerekeni bulun ve bunların çıkarıldığı bir kopya oluşturun.';

  @override
  String get toolSectionRedactionNothingToScan => 'Taranacak bir şey yok';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'Bu araç metin okur. Bir not, yapıştırılmış bir mesaj ya da metni okunmuş bir yakalama seçin.';

  @override
  String get toolSectionRedactionNothingFound => 'Belirgin bir şey bulunamadı';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action bu metinde e-posta adresi, telefon numarası, kart numarası ya da referans numarası bulmadı.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gizlemeye değer $count şey',
      one: 'Gizlemeye değer 1 şey',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'Ayrıntıları çıkarılmış kopya';

  @override
  String get toolWarningRedactionCoverage =>
      'Bu, e-posta, telefon numarası ve hesap numarası gibi kalıpları bulur. Hassas olan her şeyi yakalamaz — paylaşmadan önce kopyayı okuyun.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action görsellerdeki ve PDF dosyalarındaki ayrıntıları çıkaramaz. Bir resimde bir şeyin üzerini örtmek aslını altında bırakır, bu yüzden bu seçenek sunulmuyor.';

  @override
  String get toolTitleAuthenticity => 'Bunun nereden geldiğini kontrol et';

  @override
  String get toolDescriptionAuthenticity =>
      'Bir dosyanın kendi kökeni hakkında ne beyan ettiği.';

  @override
  String get toolSectionAuthenticityNothingToInspect =>
      'İncelenecek bir şey yok';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'Bir görsel ya da bir metin seçin.';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'Bu dosyanın kendisi hakkında söyledikleri';

  @override
  String get toolSectionAuthenticityFileItself => 'Dosyanın kendisi';

  @override
  String get toolSectionFileContents => 'İçerik';

  @override
  String get toolSectionFileUnknownFormat =>
      'Action\'ın bildiği bir biçim değil';

  @override
  String get toolSectionFileSize => 'Boyut';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'Bu, bir dosyanın kendisi hakkında ne beyan ettiğini bildirir. Meta veri düzenlenebilir ya da silinebilir; dolayısıyla bunların hiçbiri kanıt değildir. Bunu kimseyi suçlamak için kullanmayın.';

  @override
  String get toolTitleCredentialScanner => 'Anahtar ve parola ara';

  @override
  String get toolDescriptionCredentialScanner =>
      'Bir şeyi paylaşmadan önce kimlik bilgilerini bulun.';

  @override
  String get toolSectionCredentialNothingToCheck =>
      'Kontrol edilecek bir şey yok';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'Bir metin yapıştırın ya da metni okunmuş bir yakalama seçin. Bu araç yalnızca metin okur.';

  @override
  String get toolSectionCredentialNoneFound => 'Kimlik bilgisi bulunamadı';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action bu metinde API anahtarı, özel anahtar, belirteç ya da parola biçiminde bir şey bulamadı.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kimlik bilgisi bulundu',
      one: '1 kimlik bilgisi bulundu',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gizli değer olabilecek $count şey',
      one: 'Gizli değer olabilecek 1 şey',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'Kimlik bilgileri çıkarılmış kopya';

  @override
  String get toolWarningCredentialRevoke =>
      'Bir anahtarı belgeden kaldırmak onu devre dışı bırakmaz. Bunlardan biri zaten paylaşıldıysa onu sağlayıcınızda iptal edin ve yenisini oluşturun.';

  @override
  String get toolWarningCredentialCoverage =>
      'Bu, tanınabilir bir biçimi olan kimlik bilgilerini bulur. Bir cümlenin içine yazılmış bir parola bulunmaz; bu yüzden metni de okuyun.';

  @override
  String get toolTitleLinkInspector => 'Bir bağlantıyı incele';

  @override
  String get toolDescriptionLinkInspector =>
      'Bir adresin, siz açmadan önce ele verdikleri.';

  @override
  String get toolSectionLinkNoneFound => 'Bağlantı bulunamadı';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'Bir bağlantı yapıştırın ya da bir tane içeren bir yakalama seçin.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bu metindeki $count bağlantı',
      one: 'Bu metindeki bağlantı',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'Okunamadı';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary. $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'Bunların yazılışında olağandışı bir şey yok';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'Bu, sayfaların güvenilir olduğunu bilmekle aynı şey değildir. Bunları bekleyip beklemediğinize yalnızca siz karar verebilirsiniz.';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action yalnızca adresi okur. Bağlantıyı açmaz, siteyi sorgulamaz ve herhangi bir itibar hizmetine bakmaz — bunları yapmak, gezindiğiniz yerleri bir başkasına göndermek olurdu.';

  @override
  String get toolWarningLinkNoSignals =>
      'Hiçbir işaret taşımayan bir bağlantı yine de zararlı olabilir. Bu, bir adresin yazılışındaki sorunları bulur; bu da adresin nereye gittiği hakkında bilinmesi gereken her şey değildir.';

  @override
  String get toolSectionObjective => 'İstediğiniz şey';

  @override
  String get toolSectionCurrentState => 'Gelinen nokta';

  @override
  String get toolSectionRecommendedNextStep => 'Önerilen sonraki adım';

  @override
  String get toolSectionCredentialAdvice => 'Ne yapmalısınız';

  @override
  String get toolSectionSummary => 'Özet';

  @override
  String get toolDetailSeparator => ' · ';
}
