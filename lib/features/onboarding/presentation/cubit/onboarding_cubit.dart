import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:plant_app/features/onboarding/presentation/cubit/onboarding_status.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  void onPageChanged(int index) {
    if (index == state.pageIndex) {
      return;
    }

    emit(state.copyWith(pageIndex: index));
  }

  void next() {
    if (state.isLastPage) {
      emit(state.copyWith(status: OnboardingStatus.completed));
      return;
    }

    emit(state.copyWith(pageIndex: state.pageIndex + 1));
  }

  void skip() {
    emit(state.copyWith(status: OnboardingStatus.completed));
  }
}
