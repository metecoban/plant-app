import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/features/onboarding/presentation/models/onboarding_page_content.dart';
import 'package:plant_app/shared/widgets/app_button.dart';

abstract final class OnboardingFooterLayout {
  static const secondaryRowHeight = 36.0;
}

class OnboardingActions extends StatelessWidget {
  const OnboardingActions({
    required this.pageIndex,
    required this.pageCount,
    required this.pageIndicatorActiveIndex,
    required this.onPrimaryPressed,
    required this.onSkipPressed,
    super.key,
  });

  final int pageIndex;
  final int pageCount;
  final int pageIndicatorActiveIndex;
  final VoidCallback onPrimaryPressed;
  final VoidCallback onSkipPressed;

  @override
  Widget build(BuildContext context) {
    final page = OnboardingPageContent.pages[pageIndex];
    final isGetStarted = page.type == OnboardingPageType.getStarted;
    final primaryLabel = isGetStarted
        ? t.onboarding.getStartedButton
        : t.onboarding.continueButton;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.horizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(label: primaryLabel, onPressed: onPrimaryPressed),
          const SizedBox(height: AppSpacing.section),
          SizedBox(
            height: OnboardingFooterLayout.secondaryRowHeight,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topCenter,
              child: isGetStarted
                  ? const _TermsText()
                  : _PageIndicator(
                      count: pageCount,
                      activeIndex: pageIndicatorActiveIndex,
                    ),
            ),
          ),
          const SizedBox(height: AppSpacing.item),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.count, required this.activeIndex});

  final int count;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 8 : 6,
          height: isActive ? 8 : 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? colors.mainText
                : colors.subText.withValues(alpha: 0.3),
          ),
        );
      }),
    );
  }
}

class _TermsText extends StatelessWidget {
  const _TermsText();

  @override
  Widget build(BuildContext context) {
    final linkStyle = context.textTheme.bodySmall?.copyWith(
      color: context.appColors.subText,
      decoration: TextDecoration.underline,
    );
    final baseStyle = context.textTheme.bodySmall?.copyWith(
      color: context.appColors.subText,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.footer),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: baseStyle,
          children: [
            TextSpan(text: t.onboarding.getStartedTermsPrefix),
            TextSpan(text: t.onboarding.termsOfUse, style: linkStyle),
            TextSpan(text: t.onboarding.getStartedTermsConnector),
            TextSpan(text: t.onboarding.privacyPolicy, style: linkStyle),
            TextSpan(text: t.onboarding.getStartedTermsSuffix),
          ],
        ),
      ),
    );
  }
}
