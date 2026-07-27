///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Plant App'
	String get appTitle => 'Plant App';

	late final Translations$common$en common = Translations$common$en._(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en._(_root);
	late final Translations$paywall$en paywall = Translations$paywall$en._(_root);
	late final Translations$home$en home = Translations$home$en._(_root);
	late final Translations$profile$en profile = Translations$profile$en._(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Something went wrong'
	String get errorTitle => 'Something went wrong';

	/// en: 'Please try again later.'
	String get errorMessage => 'Please try again later.';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Nothing here yet'
	String get emptyTitle => 'Nothing here yet';

	/// en: 'Check back later.'
	String get emptyMessage => 'Check back later.';
}

// Path: onboarding
class Translations$onboarding$en {
	Translations$onboarding$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome to '
	String get getStartedTitlePrefix => 'Welcome to ';

	/// en: 'PlantApp'
	String get getStartedTitleHighlight => 'PlantApp';

	/// en: 'Identify more than 3000+ plants and 88% accuracy.'
	String get getStartedSubtitle => 'Identify more than 3000+ plants and 88% accuracy.';

	/// en: 'Get Started'
	String get getStartedButton => 'Get Started';

	/// en: 'By tapping next, you are agreeing to PlantID '
	String get getStartedTermsPrefix => 'By tapping next, you are agreeing to PlantID ';

	/// en: 'Terms of Use'
	String get termsOfUse => 'Terms of Use';

	/// en: ' & '
	String get getStartedTermsConnector => ' & ';

	/// en: 'Privacy Policy'
	String get privacyPolicy => 'Privacy Policy';

	/// en: '.'
	String get getStartedTermsSuffix => '.';

	/// en: 'Take a photo to '
	String get page1TitlePrefix => 'Take a photo to ';

	/// en: 'identify'
	String get page1TitleHighlight => 'identify';

	/// en: ' the plant!'
	String get page1TitleSuffix => '\nthe plant!';

	/// en: 'Get plant '
	String get page2TitlePrefix => 'Get plant ';

	/// en: 'care guides'
	String get page2TitleHighlight => 'care guides';

	/// en: 'Continue'
	String get continueButton => 'Continue';

	/// en: 'Skip'
	String get skip => 'Skip';
}

// Path: paywall
class Translations$paywall$en {
	Translations$paywall$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'PlantApp'
	String get titleApp => 'PlantApp';

	/// en: ' Premium'
	String get titlePremium => ' Premium';

	/// en: 'Access All Features'
	String get subtitle => 'Access All Features';

	/// en: 'Unlimited'
	String get feature1Title => 'Unlimited';

	/// en: 'Plant Identify'
	String get feature1Subtitle => 'Plant Identify';

	/// en: 'Faster'
	String get feature2Title => 'Faster';

	/// en: 'Process'
	String get feature2Subtitle => 'Process';

	/// en: '1 Month'
	String get planMonthlyTitle => '1 Month';

	/// en: '\$2.99/month, auto renewable'
	String get planMonthlySubtitle => '\$2.99/month, auto renewable';

	/// en: '1 Year'
	String get planYearlyTitle => '1 Year';

	/// en: 'First 3 days free, then \$529,99/year'
	String get planYearlySubtitle => 'First 3 days free, then \$529,99/year';

	/// en: 'Save 50%'
	String get planYearlyBadge => 'Save 50%';

	/// en: 'Try free for 3 days'
	String get ctaButton => 'Try free for 3 days';

	/// en: 'After a 3-day trial period you will be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable'
	String get disclaimer => 'After a 3-day trial period you will be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable';

	/// en: 'Terms'
	String get terms => 'Terms';

	/// en: 'Privacy'
	String get privacy => 'Privacy';

	/// en: 'Restore'
	String get restore => 'Restore';
}

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi, plant lover!'
	String get greeting => 'Hi, plant lover!';

	/// en: 'Good Morning!'
	String get goodMorning => 'Good Morning!';

	/// en: 'Good Afternoon!'
	String get goodAfternoon => 'Good Afternoon!';

	/// en: 'Good Evening!'
	String get goodEvening => 'Good Evening!';

	/// en: 'Search for plants'
	String get searchHint => 'Search for plants';

	/// en: 'FREE Premium Available'
	String get premiumTitle => 'FREE Premium Available';

	/// en: 'Tap to upgrade your account!'
	String get premiumSubtitle => 'Tap to upgrade your account!';

	/// en: 'Home'
	String get navHome => 'Home';

	/// en: 'Diagnose'
	String get navDiagnose => 'Diagnose';

	/// en: 'My Garden'
	String get navMyGarden => 'My Garden';

	/// en: 'Profile'
	String get navProfile => 'Profile';

	/// en: 'Scan'
	String get navScan => 'Scan';

	/// en: 'No content available yet.'
	String get emptyMessage => 'No content available yet.';
}

// Path: profile
class Translations$profile$en {
	Translations$profile$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dark theme'
	String get darkTheme => 'Dark theme';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'English'
	String get languageEn => 'English';

	/// en: 'Turkish'
	String get languageTr => 'Turkish';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appTitle' => 'Plant App',
			'common.loading' => 'Loading...',
			'common.errorTitle' => 'Something went wrong',
			'common.errorMessage' => 'Please try again later.',
			'common.retry' => 'Retry',
			'common.emptyTitle' => 'Nothing here yet',
			'common.emptyMessage' => 'Check back later.',
			'onboarding.getStartedTitlePrefix' => 'Welcome to ',
			'onboarding.getStartedTitleHighlight' => 'PlantApp',
			'onboarding.getStartedSubtitle' => 'Identify more than 3000+ plants and 88% accuracy.',
			'onboarding.getStartedButton' => 'Get Started',
			'onboarding.getStartedTermsPrefix' => 'By tapping next, you are agreeing to PlantID ',
			'onboarding.termsOfUse' => 'Terms of Use',
			'onboarding.getStartedTermsConnector' => ' & ',
			'onboarding.privacyPolicy' => 'Privacy Policy',
			'onboarding.getStartedTermsSuffix' => '.',
			'onboarding.page1TitlePrefix' => 'Take a photo to ',
			'onboarding.page1TitleHighlight' => 'identify',
			'onboarding.page1TitleSuffix' => '\nthe plant!',
			'onboarding.page2TitlePrefix' => 'Get plant ',
			'onboarding.page2TitleHighlight' => 'care guides',
			'onboarding.continueButton' => 'Continue',
			'onboarding.skip' => 'Skip',
			'paywall.titleApp' => 'PlantApp',
			'paywall.titlePremium' => ' Premium',
			'paywall.subtitle' => 'Access All Features',
			'paywall.feature1Title' => 'Unlimited',
			'paywall.feature1Subtitle' => 'Plant Identify',
			'paywall.feature2Title' => 'Faster',
			'paywall.feature2Subtitle' => 'Process',
			'paywall.planMonthlyTitle' => '1 Month',
			'paywall.planMonthlySubtitle' => '\$2.99/month, auto renewable',
			'paywall.planYearlyTitle' => '1 Year',
			'paywall.planYearlySubtitle' => 'First 3 days free, then \$529,99/year',
			'paywall.planYearlyBadge' => 'Save 50%',
			'paywall.ctaButton' => 'Try free for 3 days',
			'paywall.disclaimer' => 'After a 3-day trial period you will be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable',
			'paywall.terms' => 'Terms',
			'paywall.privacy' => 'Privacy',
			'paywall.restore' => 'Restore',
			'home.greeting' => 'Hi, plant lover!',
			'home.goodMorning' => 'Good Morning!',
			'home.goodAfternoon' => 'Good Afternoon!',
			'home.goodEvening' => 'Good Evening!',
			'home.searchHint' => 'Search for plants',
			'home.premiumTitle' => 'FREE Premium Available',
			'home.premiumSubtitle' => 'Tap to upgrade your account!',
			'home.navHome' => 'Home',
			'home.navDiagnose' => 'Diagnose',
			'home.navMyGarden' => 'My Garden',
			'home.navProfile' => 'Profile',
			'home.navScan' => 'Scan',
			'home.emptyMessage' => 'No content available yet.',
			'profile.darkTheme' => 'Dark theme',
			'profile.language' => 'Language',
			'profile.languageEn' => 'English',
			'profile.languageTr' => 'Turkish',
			_ => null,
		};
	}
}
