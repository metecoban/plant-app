import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/features/onboarding/presentation/models/onboarding_page_content.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_content.dart';

abstract final class OnboardingLayout {
  static const headerHeight = 116.0;
}

class OnboardingPageBody extends StatelessWidget {
  const OnboardingPageBody({required this.page, super.key});

  final OnboardingPageContent page;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Align(
          child: page.image.image(fit: page.imageFit, width: double.infinity),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.horizontal,
            ),
            child: SizedBox(
              height: OnboardingLayout.headerHeight,
              child: Align(
                alignment: Alignment.topLeft,
                child: OnboardingContent(page: page),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
