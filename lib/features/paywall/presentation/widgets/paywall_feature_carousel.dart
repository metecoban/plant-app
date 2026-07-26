import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_radius.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/features/paywall/presentation/models/paywall_feature_content.dart';
import 'package:plant_app/features/paywall/presentation/theme/paywall_theme_extensions.dart';

class PaywallFeatureCarousel extends StatelessWidget {
  const PaywallFeatureCarousel({super.key});

  static const _height = 132.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth =
            (AppSpacing.contentWidth(constraints.maxWidth) - AppSpacing.compact) /
            2;

        return SizedBox(
          height: _height,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: AppSpacing.horizontalPadding,
            itemCount: PaywallFeatureContent.items.length,
            separatorBuilder: (_, _) =>
                const SizedBox(width: AppSpacing.compact),
            itemBuilder: (context, index) {
              return _PaywallFeatureCard(
                feature: PaywallFeatureContent.items[index],
                width: cardWidth,
              );
            },
          ),
        );
      },
    );
  }
}

class _PaywallFeatureCard extends StatelessWidget {
  const _PaywallFeatureCard({
    required this.feature,
    required this.width,
  });

  final PaywallFeatureContent feature;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(AppSpacing.item),
      decoration: BoxDecoration(
        color: AppPalette.darkSurface,
        borderRadius: BorderRadius.circular(AppRadius.r16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          feature.icon.svg(
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(
              AppPalette.darkMainText,
              BlendMode.srcIn,
            ),
          ),
          const Spacer(),
          Text(feature.title, style: context.paywallTitleStyle),
          Text(feature.subtitle, style: context.paywallSubtitleStyle),
        ],
      ),
    );
  }
}
