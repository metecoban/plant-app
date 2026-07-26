import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_cubit.dart';
import 'package:plant_app/shared/widgets/app_button.dart';
import 'package:plant_app/shared/widgets/common_scaffold.dart';

@RoutePage()
class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundType: AppBackground.paywall,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Paywall',
            style: context.textTheme.headlineLarge?.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          AppButton(
            label: 'Continue',
            onPressed: () => context.read<AppFlowCubit>().completePaywall(),
          ),
        ],
      ),
    );
  }
}
