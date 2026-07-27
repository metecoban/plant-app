import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/router/app_router.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_cubit.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_state.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_status.dart';

class AppFlowListener extends StatelessWidget {
  const AppFlowListener({
    required this.appRouter,
    required this.child,
    super.key,
  });

  final AppRouter appRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppFlowCubit, AppFlowState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) => _navigateForStatus(state.status),
      child: child,
    );
  }

  void _navigateForStatus(AppFlowStatus status) {
    switch (status) {
      case AppFlowStatus.onboardingRequired:
        appRouter.replaceAll([const OnboardingRoute()]);
      case AppFlowStatus.paywallRequired:
        appRouter.replaceAll([const PaywallRoute()]);
      case AppFlowStatus.home:
        appRouter.replaceAll([const HomeRoute()]);
      case AppFlowStatus.initial:
      case AppFlowStatus.loading:
      case AppFlowStatus.failure:
        return;
    }
  }
}
