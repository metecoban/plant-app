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

	late final Translations$common$en common = Translations$common$en.internal(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en.internal(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en.internal(this._root);

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
	Translations$onboarding$en.internal(this._root);

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
			_ => null,
		};
	}
}
