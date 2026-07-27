import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';

class PaywallCloseButton extends StatelessWidget {
  const PaywallCloseButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        color: AppPalette.paywallCloseBackground,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: const SizedBox(
            width: 36,
            height: 36,
            child: Icon(Icons.close, size: 20, color: AppPalette.darkMainText),
          ),
        ),
      ),
    );
  }
}
