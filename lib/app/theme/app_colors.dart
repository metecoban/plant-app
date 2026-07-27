import 'package:flutter/material.dart';

/// Raw palette values from the Figma design system.
final class AppPalette {
  const AppPalette._();

  static const primary = Color(0xFF28AF6E);
  static const secondary = Color(0xFF597165);

  static const mainText = Color(0xFF13231B);
  static const subText = Color(0xB213231B);

  static const onboardingBackground = Color(0xFFFDFFFE);
  static const paywallBackground = Color(0xFF101E17);
  static const homeBackground = Color(0xFFFBFAFA);

  static const surface = Color(0xFFFFFFFF);
  static const error = Color(0xFFE74C3C);
  static const success = Color(0xFF28AF6E);

  static const darkBackground = Color(0xFF101E17);
  static const darkSurface = Color(0xFF1A2B23);
  static const darkMainText = Color(0xFFFDFFFE);
  static const darkSubText = Color(0xB2FDFFFE);
  static const darkHomeBackground = Color(0xFF151F1A);
  static const darkOnboardingBackground = Color(0xFF121F19);
  static const darkPaywallBackground = Color(0xFF0A1410);

  static const paywallBorderUnselected = Color(0x33FFFFFF);
  static const paywallCloseBackground = Color(0x66101814);
}

enum AppBackground { standard, onboarding, home, paywall }

@immutable
final class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.mainText,
    required this.subText,
    required this.error,
    required this.success,
    required this.onboardingBackground,
    required this.paywallBackground,
    required this.homeBackground,
  });

  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color mainText;
  final Color subText;
  final Color error;
  final Color success;
  final Color onboardingBackground;
  final Color paywallBackground;
  final Color homeBackground;

  static const light = AppColors(
    primary: AppPalette.primary,
    secondary: AppPalette.secondary,
    background: AppPalette.homeBackground,
    surface: AppPalette.surface,
    mainText: AppPalette.mainText,
    subText: AppPalette.subText,
    error: AppPalette.error,
    success: AppPalette.success,
    onboardingBackground: AppPalette.onboardingBackground,
    paywallBackground: AppPalette.paywallBackground,
    homeBackground: AppPalette.homeBackground,
  );

  static const dark = AppColors(
    primary: AppPalette.primary,
    secondary: AppPalette.secondary,
    background: AppPalette.darkBackground,
    surface: AppPalette.darkSurface,
    mainText: AppPalette.darkMainText,
    subText: AppPalette.darkSubText,
    error: AppPalette.error,
    success: AppPalette.success,
    onboardingBackground: AppPalette.darkOnboardingBackground,
    paywallBackground: AppPalette.darkPaywallBackground,
    homeBackground: AppPalette.darkHomeBackground,
  );

  Color backgroundFor(AppBackground type) => switch (type) {
    AppBackground.standard => background,
    AppBackground.onboarding => onboardingBackground,
    AppBackground.home => homeBackground,
    AppBackground.paywall => paywallBackground,
  };

  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? mainText,
    Color? subText,
    Color? error,
    Color? success,
    Color? onboardingBackground,
    Color? paywallBackground,
    Color? homeBackground,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      mainText: mainText ?? this.mainText,
      subText: subText ?? this.subText,
      error: error ?? this.error,
      success: success ?? this.success,
      onboardingBackground: onboardingBackground ?? this.onboardingBackground,
      paywallBackground: paywallBackground ?? this.paywallBackground,
      homeBackground: homeBackground ?? this.homeBackground,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      mainText: Color.lerp(mainText, other.mainText, t)!,
      subText: Color.lerp(subText, other.subText, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      onboardingBackground: Color.lerp(
        onboardingBackground,
        other.onboardingBackground,
        t,
      )!,
      paywallBackground: Color.lerp(
        paywallBackground,
        other.paywallBackground,
        t,
      )!,
      homeBackground: Color.lerp(homeBackground, other.homeBackground, t)!,
    );
  }
}
