///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsTr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsTr _root = this; // ignore: unused_field

	@override 
	TranslationsTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTr(meta: meta ?? this.$meta);

	// Translations
	@override String get appTitle => 'Bitki Uygulaması';
	@override late final _Translations$common$tr common = _Translations$common$tr._(_root);
	@override late final _Translations$onboarding$tr onboarding = _Translations$onboarding$tr._(_root);
	@override late final _Translations$paywall$tr paywall = _Translations$paywall$tr._(_root);
}

// Path: common
class _Translations$common$tr extends Translations$common$en {
	_Translations$common$tr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Yükleniyor...';
	@override String get errorTitle => 'Bir sorun oluştu';
	@override String get errorMessage => 'Lütfen daha sonra tekrar deneyin.';
	@override String get retry => 'Tekrar Dene';
	@override String get emptyTitle => 'Henüz bir şey yok';
	@override String get emptyMessage => 'Daha sonra tekrar kontrol edin.';
}

// Path: onboarding
class _Translations$onboarding$tr extends Translations$onboarding$en {
	_Translations$onboarding$tr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get getStartedTitlePrefix => 'Hoş geldiniz ';
	@override String get getStartedTitleHighlight => 'PlantApp';
	@override String get getStartedSubtitle => '3000+ bitkiyi %88 doğrulukla tanıyın.';
	@override String get getStartedButton => 'Başlayın';
	@override String get getStartedTermsPrefix => 'Devam ederek PlantID ';
	@override String get termsOfUse => 'Kullanım Koşulları';
	@override String get getStartedTermsConnector => ' ve ';
	@override String get privacyPolicy => 'Gizlilik Politikası';
	@override String get getStartedTermsSuffix => '\'nı kabul etmiş olursunuz.';
	@override String get page1TitlePrefix => 'Bitkiyi ';
	@override String get page1TitleHighlight => 'tanımak';
	@override String get page1TitleSuffix => ' için\nfotoğraf çekin!';
	@override String get page2TitlePrefix => 'Bitki ';
	@override String get page2TitleHighlight => 'bakım rehberlerine';
	@override String get continueButton => 'Devam Et';
	@override String get skip => 'Atla';
}

// Path: paywall
class _Translations$paywall$tr extends Translations$paywall$en {
	_Translations$paywall$tr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get titleApp => 'PlantApp';
	@override String get titlePremium => ' Premium';
	@override String get subtitle => 'Tüm Özelliklere Erişin';
	@override String get feature1Title => 'Sınırsız';
	@override String get feature1Subtitle => 'Bitki Tanıma';
	@override String get feature2Title => 'Daha Hızlı';
	@override String get feature2Subtitle => 'İşlem';
	@override String get planMonthlyTitle => '1 Ay';
	@override String get planMonthlySubtitle => '₺99,99/ay, otomatik yenilenir';
	@override String get planYearlyTitle => '1 Yıl';
	@override String get planYearlySubtitle => 'İlk 3 gün ücretsiz, sonra ₺274,99/yıl';
	@override String get planYearlyBadge => '%50 Tasarruf';
	@override String get ctaButton => '3 gün ücretsiz dene';
	@override String get disclaimer => '3 günlük deneme süresinin ardından, deneme süresi dolmadan iptal etmediğiniz sürece yıllık ₺274,99 ücretlendirilirsiniz. Yıllık Abonelik Otomatik Yenilenir';
	@override String get terms => 'Koşullar';
	@override String get privacy => 'Gizlilik';
	@override String get restore => 'Geri Yükle';
}

/// The flat map containing all translations for locale <tr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appTitle' => 'Bitki Uygulaması',
			'common.loading' => 'Yükleniyor...',
			'common.errorTitle' => 'Bir sorun oluştu',
			'common.errorMessage' => 'Lütfen daha sonra tekrar deneyin.',
			'common.retry' => 'Tekrar Dene',
			'common.emptyTitle' => 'Henüz bir şey yok',
			'common.emptyMessage' => 'Daha sonra tekrar kontrol edin.',
			'onboarding.getStartedTitlePrefix' => 'Hoş geldiniz ',
			'onboarding.getStartedTitleHighlight' => 'PlantApp',
			'onboarding.getStartedSubtitle' => '3000+ bitkiyi %88 doğrulukla tanıyın.',
			'onboarding.getStartedButton' => 'Başlayın',
			'onboarding.getStartedTermsPrefix' => 'Devam ederek PlantID ',
			'onboarding.termsOfUse' => 'Kullanım Koşulları',
			'onboarding.getStartedTermsConnector' => ' ve ',
			'onboarding.privacyPolicy' => 'Gizlilik Politikası',
			'onboarding.getStartedTermsSuffix' => '\'nı kabul etmiş olursunuz.',
			'onboarding.page1TitlePrefix' => 'Bitkiyi ',
			'onboarding.page1TitleHighlight' => 'tanımak',
			'onboarding.page1TitleSuffix' => ' için\nfotoğraf çekin!',
			'onboarding.page2TitlePrefix' => 'Bitki ',
			'onboarding.page2TitleHighlight' => 'bakım rehberlerine',
			'onboarding.continueButton' => 'Devam Et',
			'onboarding.skip' => 'Atla',
			'paywall.titleApp' => 'PlantApp',
			'paywall.titlePremium' => ' Premium',
			'paywall.subtitle' => 'Tüm Özelliklere Erişin',
			'paywall.feature1Title' => 'Sınırsız',
			'paywall.feature1Subtitle' => 'Bitki Tanıma',
			'paywall.feature2Title' => 'Daha Hızlı',
			'paywall.feature2Subtitle' => 'İşlem',
			'paywall.planMonthlyTitle' => '1 Ay',
			'paywall.planMonthlySubtitle' => '₺99,99/ay, otomatik yenilenir',
			'paywall.planYearlyTitle' => '1 Yıl',
			'paywall.planYearlySubtitle' => 'İlk 3 gün ücretsiz, sonra ₺274,99/yıl',
			'paywall.planYearlyBadge' => '%50 Tasarruf',
			'paywall.ctaButton' => '3 gün ücretsiz dene',
			'paywall.disclaimer' => '3 günlük deneme süresinin ardından, deneme süresi dolmadan iptal etmediğiniz sürece yıllık ₺274,99 ücretlendirilirsiniz. Yıllık Abonelik Otomatik Yenilenir',
			'paywall.terms' => 'Koşullar',
			'paywall.privacy' => 'Gizlilik',
			'paywall.restore' => 'Geri Yükle',
			_ => null,
		};
	}
}
