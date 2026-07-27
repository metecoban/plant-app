import 'package:plant_app/features/onboarding/presentation/cubit/onboarding_status.dart';
import 'package:plant_app/features/onboarding/presentation/models/onboarding_page_content.dart';

class OnboardingState {
  const OnboardingState({
    this.pageIndex = 0,
    this.status = OnboardingStatus.initial,
  });

  final int pageIndex;
  final OnboardingStatus status;

  int get pageCount => OnboardingPageContent.pages.length;

  bool get isLastPage => pageIndex >= pageCount - 1;

  bool get showPageIndicator => pageIndex > 0;

  int get pageIndicatorActiveIndex => pageIndex - 1;

  bool get showSkip => pageIndex > 0;

  OnboardingState copyWith({int? pageIndex, OnboardingStatus? status}) {
    return OnboardingState(
      pageIndex: pageIndex ?? this.pageIndex,
      status: status ?? this.status,
    );
  }
}
