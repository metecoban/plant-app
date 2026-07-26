import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/di/injection.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/core/presentation/base_view.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_cubit.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_cubit.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_state.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_status.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_close_button.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_feature_carousel.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_footer.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_plans_section.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_title_section.dart';
import 'package:plant_app/gen/assets.gen.dart';

@RoutePage()
class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  static const _heroHeightFactor = 0.5;

  @override
  Widget build(BuildContext context) {
    return BaseView<PaywallCubit, PaywallState>(
      create: (_) => getIt<PaywallCubit>(),
      listener: (context, state) {
        if (state.status != PaywallStatus.completed) {
          return;
        }

        context.read<AppFlowCubit>().completePaywall();
      },
      builder: (context, state) {
        final cubit = context.read<PaywallCubit>();
        final heroHeight =
            MediaQuery.sizeOf(context).height * _heroHeightFactor;

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          child: PopScope(
            canPop: false,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const ColoredBox(color: AppPalette.paywallBackground),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: heroHeight,
                  child: ClipRect(
                    child: Image(
                      image: Assets.images.paywall.provider(),
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            AppSpacing.horizontal,
                            AppSpacing.compact,
                            AppSpacing.horizontal,
                            0,
                          ),
                          child: PaywallCloseButton(onPressed: cubit.dismiss),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Spacer(flex: 2),
                              const PaywallTitleSection(),
                              const SizedBox(height: AppSpacing.section),
                              const PaywallFeatureCarousel(),
                              const SizedBox(height: AppSpacing.section),
                              PaywallPlansSection(
                                selectedPlan: state.selectedPlan,
                                onPlanSelected: cubit.selectPlan,
                              ),
                              const SizedBox(height: AppSpacing.section),
                            ],
                          ),
                        ),
                        PaywallFooter(onSubscribePressed: cubit.subscribe),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
