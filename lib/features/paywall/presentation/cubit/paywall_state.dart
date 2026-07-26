import 'package:plant_app/features/paywall/presentation/cubit/paywall_plan.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_status.dart';

class PaywallState {
  const PaywallState({
    this.selectedPlan = PaywallPlan.yearly,
    this.status = PaywallStatus.initial,
  });

  final PaywallPlan selectedPlan;
  final PaywallStatus status;

  PaywallState copyWith({
    PaywallPlan? selectedPlan,
    PaywallStatus? status,
  }) {
    return PaywallState(
      selectedPlan: selectedPlan ?? this.selectedPlan,
      status: status ?? this.status,
    );
  }
}
