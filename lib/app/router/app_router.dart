import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/app/router/route_names.dart';
import 'package:plant_app/features/app_flow/presentation/pages/splash_page.dart';
import 'package:plant_app/features/home/presentation/pages/home_page.dart';
import 'package:plant_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:plant_app/features/paywall/presentation/pages/paywall_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@singleton
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: RouteNames.splash,
          initial: true,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          path: RouteNames.onboarding,
        ),
        AutoRoute(
          page: PaywallRoute.page,
          path: RouteNames.paywall,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: RouteNames.home,
        ),
      ];
}
