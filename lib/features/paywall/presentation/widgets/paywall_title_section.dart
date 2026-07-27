import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/features/paywall/presentation/theme/paywall_theme_extensions.dart';
import 'package:plant_app/gen/assets.gen.dart';

class PaywallTitleSection extends StatelessWidget {
  const PaywallTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.images.home.header.svg(height: 32),
              Text(
                t.paywall.titlePremium,
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 28,
                  height: 1.2,
                  fontWeight: FontWeight.w400,
                  color: AppPalette.darkMainText,
                ),
              ),
            ],
          ),
          Text(
            t.paywall.subtitle,
            style: context.paywallSubtitleStyle?.copyWith(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
