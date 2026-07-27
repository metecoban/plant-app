import 'package:flutter/material.dart';

enum AppButtonVariant { primary, secondary, text }

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.expand = true,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;
    final child = isLoading
        ? const SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(label);

    final button = switch (variant) {
      AppButtonVariant.primary => FilledButton(
        onPressed: isDisabled ? null : onPressed,
        child: child,
      ),
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        child: child,
      ),
      AppButtonVariant.text => TextButton(
        onPressed: isDisabled ? null : onPressed,
        child: child,
      ),
    };

    if (!expand) {
      return button;
    }

    return SizedBox(width: double.infinity, child: button);
  }
}
