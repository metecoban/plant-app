import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_plan.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_state.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_status.dart';

@injectable
class PaywallCubit extends Cubit<PaywallState> {
  PaywallCubit() : super(const PaywallState());

  void selectPlan(PaywallPlan plan) {
    if (plan == state.selectedPlan) {
      return;
    }

    emit(state.copyWith(selectedPlan: plan));
  }

  void subscribe() {
    emit(state.copyWith(status: PaywallStatus.completed));
  }

  void dismiss() {
    emit(state.copyWith(status: PaywallStatus.completed));
  }
}
