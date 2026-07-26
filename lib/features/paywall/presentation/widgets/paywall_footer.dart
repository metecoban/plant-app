import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/features/paywall/presentation/theme/paywall_theme_extensions.dart';
import 'package:plant_app/shared/widgets/app_button.dart';

class PaywallFooter extends StatelessWidget {
  const PaywallFooter({
    required this.onSubscribePressed,
    super.key,
  });

  final VoidCallback onSubscribePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.horizontalPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            label: t.paywall.ctaButton,
            onPressed: onSubscribePressed,
          ),
          const SizedBox(height: AppSpacing.item),
          SizedBox(
            height: AppSpacing.secondaryRowHeight,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                t.paywall.disclaimer,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.paywallSubtitleStyle?.copyWith(
                  fontSize: AppSpacing.footnote,
                  height: 1.3,
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppSpacing.item,
            width: double.infinity,
            child: Center(child: _PaywallLinksRow(style: context.paywallSubtitleStyle)),
          ),
        ],
      ),
    );
  }
}

class _PaywallLinksRow extends StatelessWidget {
  const _PaywallLinksRow({required this.style});

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final linkStyle = style?.copyWith(
      fontSize: 11,
      height: 1.2,
      decoration: TextDecoration.underline,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _PaywallLink(label: t.paywall.terms, style: linkStyle),
        _LinkSeparator(style: style),
        _PaywallLink(label: t.paywall.privacy, style: linkStyle),
        _LinkSeparator(style: style),
        _PaywallLink(label: t.paywall.restore, style: linkStyle),
      ],
    );
  }
}

class _PaywallLink extends StatelessWidget {
  const _PaywallLink({
    required this.label,
    required this.style,
  });

  final String label;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(label, style: style),
    );
  }
}

class _LinkSeparator extends StatelessWidget {
  const _LinkSeparator({required this.style});

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.compact),
      child: Text(
        '•',
        style: style?.copyWith(fontSize: 11, height: 1.2),
      ),
    );
  }
}
