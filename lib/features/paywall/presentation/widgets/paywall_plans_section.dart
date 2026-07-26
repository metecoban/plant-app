import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_radius.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_plan.dart';
import 'package:plant_app/features/paywall/presentation/theme/paywall_theme_extensions.dart';

class PaywallPlansSection extends StatelessWidget {
  const PaywallPlansSection({
    required this.selectedPlan,
    required this.onPlanSelected,
    super.key,
  });

  final PaywallPlan selectedPlan;
  final ValueChanged<PaywallPlan> onPlanSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.horizontalPadding,
      child: Column(
        children: [
          PaywallPlanOption(
            title: t.paywall.planMonthlyTitle,
            subtitle: t.paywall.planMonthlySubtitle,
            isSelected: selectedPlan == PaywallPlan.monthly,
            onTap: () => onPlanSelected(PaywallPlan.monthly),
          ),
          PaywallPlanOption(
            title: t.paywall.planYearlyTitle,
            subtitle: t.paywall.planYearlySubtitle,
            badge: t.paywall.planYearlyBadge,
            isSelected: selectedPlan == PaywallPlan.yearly,
            onTap: () => onPlanSelected(PaywallPlan.yearly),
          ),
        ],
      ),
    );
  }
}

class PaywallPlanOption extends StatelessWidget {
  const PaywallPlanOption({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
    this.badge,
    super.key,
  });

  final String title;
  final String subtitle;
  final String? badge;
  final bool isSelected;
  final VoidCallback onTap;

  static const _badgeTopSpacing = 12.0;
  static const _verticalPadding = 14.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: badge != null ? _badgeTopSpacing : 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Material(
            color: AppPalette.darkSurface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r14),
              side: BorderSide(
                color: isSelected
                    ? AppPalette.primary
                    : AppPalette.paywallBorderUnselected,
                width: isSelected ? 1.5 : 1,
              ),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(AppRadius.r14),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.item,
                  vertical: _verticalPadding,
                ),
                child: Row(
                  children: [
                    _PlanRadio(isSelected: isSelected),
                    const SizedBox(width: AppSpacing.item),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: context.paywallTitleStyle),
                          Text(subtitle, style: context.paywallSubtitleStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (badge != null)
            Positioned(
              top: 0,
              right: 0,
              child: _PaywallPlanBadge(label: badge!),
            ),
        ],
      ),
    );
  }
}

class _PaywallPlanBadge extends StatelessWidget {
  const _PaywallPlanBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: const BoxDecoration(
        color: AppPalette.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppRadius.r14),
          bottomLeft: Radius.circular(AppRadius.r14),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _PlanRadio extends StatelessWidget {
  const _PlanRadio({required this.isSelected});

  final bool isSelected;

  static const _size = 22.0;
  static const _dotSize = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppPalette.primary : AppPalette.darkSubText,
          width: 1.5,
        ),
        color: isSelected ? AppPalette.primary : Colors.transparent,
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: _dotSize,
                height: _dotSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            )
          : null,
    );
  }
}
