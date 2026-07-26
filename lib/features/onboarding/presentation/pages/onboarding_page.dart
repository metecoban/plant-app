import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/di/injection.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/presentation/base_view.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_cubit.dart';
import 'package:plant_app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:plant_app/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:plant_app/features/onboarding/presentation/cubit/onboarding_status.dart';
import 'package:plant_app/features/onboarding/presentation/models/onboarding_page_content.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_actions.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_page_body.dart';
import 'package:plant_app/gen/assets.gen.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardingCubit, OnboardingState>(
      create: (_) => getIt<OnboardingCubit>(),
      listener: (context, state) {
        if (state.status != OnboardingStatus.completed) {
          return;
        }

        context.read<AppFlowCubit>().completeOnboarding();
      },
      builder: (context, state) => const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listenWhen: (previous, current) =>
          previous.pageIndex != current.pageIndex,
      listener: (context, state) {
        _pageController.animateToPage(
          state.pageIndex,
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeInOut,
        );
      },
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.appColors.backgroundFor(
                  AppBackground.onboarding,
                ),
                image: DecorationImage(
                  image: Assets.images.onboarding.background.provider(),
                  fit: BoxFit.cover,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: state.pageCount,
                          onPageChanged: context
                              .read<OnboardingCubit>()
                              .onPageChanged,
                          itemBuilder: (context, index) {
                            final page = OnboardingPageContent.pages[index];

                            return OnboardingPageBody(page: page);
                          },
                        ),
                      ),
                      OnboardingActions(
                        pageIndex: state.pageIndex,
                        pageCount: state.pageCount,
                        pageIndicatorActiveIndex:
                            state.pageIndicatorActiveIndex,
                        onPrimaryPressed: context.read<OnboardingCubit>().next,
                        onSkipPressed: context.read<OnboardingCubit>().skip,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
