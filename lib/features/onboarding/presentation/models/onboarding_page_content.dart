import 'package:flutter/material.dart';
import 'package:plant_app/gen/assets.gen.dart';

enum OnboardingPageType { getStarted, slide }

enum OnboardingSlideVariant { page1, page2 }

final class OnboardingPageContent {
  const OnboardingPageContent({
    required this.type,
    required this.image,
    this.imageFit = BoxFit.contain,
    this.slideVariant,
  });

  final OnboardingPageType type;
  final AssetGenImage image;
  final BoxFit imageFit;
  final OnboardingSlideVariant? slideVariant;

  static final pages = [
    OnboardingPageContent(
      type: OnboardingPageType.getStarted,
      image: Assets.images.onboarding.getStarted,
    ),
    OnboardingPageContent(
      type: OnboardingPageType.slide,
      image: Assets.images.onboarding.onboarding1,

      slideVariant: OnboardingSlideVariant.page1,
    ),
    OnboardingPageContent(
      type: OnboardingPageType.slide,
      image: Assets.images.onboarding.onboarding2,
      imageFit: BoxFit.fitWidth,
      slideVariant: OnboardingSlideVariant.page2,
    ),
  ];
}
