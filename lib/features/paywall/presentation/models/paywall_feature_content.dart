import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/gen/assets.gen.dart';

final class PaywallFeatureContent {
  const PaywallFeatureContent({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final SvgGenImage icon;
  final String title;
  final String subtitle;

  static List<PaywallFeatureContent> get items => [
    PaywallFeatureContent(
      icon: Assets.icons.paywall.scanner,
      title: t.paywall.feature1Title,
      subtitle: t.paywall.feature1Subtitle,
    ),
    PaywallFeatureContent(
      icon: Assets.icons.paywall.speedometer,
      title: t.paywall.feature2Title,
      subtitle: t.paywall.feature2Subtitle,
    ),
    PaywallFeatureContent(
      icon: Assets.icons.paywall.speedometer,
      title: t.paywall.feature2Title,
      subtitle: t.paywall.feature2Subtitle,
    ),
  ];
}
