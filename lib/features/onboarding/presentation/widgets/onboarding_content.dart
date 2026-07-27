import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/features/onboarding/presentation/models/onboarding_page_content.dart';
import 'package:plant_app/gen/assets.gen.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({required this.page, super.key});

  final OnboardingPageContent page;

  @override
  Widget build(BuildContext context) {
    return switch (page.type) {
      OnboardingPageType.getStarted => _GetStartedHeader(),
      OnboardingPageType.slide => _SlideHeader(variant: page.slideVariant!),
    };
  }
}

class _GetStartedHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.item),
        RichText(
          text: TextSpan(
            style: context.textTheme.headlineLarge,
            children: [
              TextSpan(text: t.onboarding.getStartedTitlePrefix),
              TextSpan(
                text: t.onboarding.getStartedTitleHighlight,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.compact),
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.horizontal),
          child: Text(
            t.onboarding.getStartedSubtitle,
            style: context.textTheme.bodyMedium?.copyWith(
              color: colors.subText,
            ),
          ),
        ),
      ],
    );
  }
}

class _SlideHeader extends StatelessWidget {
  const _SlideHeader({required this.variant});

  final OnboardingSlideVariant variant;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      OnboardingSlideVariant.page1 => _BrushTitle(
        prefix: t.onboarding.page1TitlePrefix,
        highlight: t.onboarding.page1TitleHighlight,
        suffix: t.onboarding.page1TitleSuffix,
      ),
      OnboardingSlideVariant.page2 => _BrushTitle(
        prefix: t.onboarding.page2TitlePrefix,
        highlight: t.onboarding.page2TitleHighlight,
      ),
    };
  }
}

class _BrushTitle extends StatelessWidget {
  const _BrushTitle({
    required this.prefix,
    required this.highlight,
    this.suffix = '',
  });

  final String prefix;
  final String highlight;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    final baseStyle = context.textTheme.headlineLarge;
    final highlightStyle = baseStyle?.copyWith(fontWeight: FontWeight.w700);

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.item),
      child: RichText(
        text: TextSpan(
          style: baseStyle,
          children: [
            TextSpan(text: prefix),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(highlight, style: highlightStyle),

                  const SizedBox(height: 4),
                  _BrushUnderline(text: highlight, style: highlightStyle),
                ],
              ),
            ),
            if (suffix.isNotEmpty) TextSpan(text: suffix),
          ],
        ),
      ),
    );
  }
}

class _BrushUnderline extends StatelessWidget {
  const _BrushUnderline({required this.text, required this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textScaler = MediaQuery.textScalerOf(context);
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: Directionality.of(context),
      textScaler: textScaler,
      maxLines: 1,
    )..layout();

    return Assets.images.onboarding.brush.image(
      width: textPainter.width + 32,
      fit: BoxFit.fill,
    );
  }
}
