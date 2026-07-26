import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/shared/widgets/app_button.dart';

class CommonErrorView extends StatelessWidget {
  const CommonErrorView({this.title, this.message, this.onRetry, super.key});

  final String? title;
  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.85),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 48,
                  color: context.appColors.error,
                ),
                const SizedBox(height: AppSpacing.item),
                Text(
                  title ?? t.common.errorTitle,
                  style: context.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.compact),
                Text(
                  message ?? t.common.errorMessage,
                  style: context.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                if (onRetry != null) ...[
                  const SizedBox(height: AppSpacing.section),
                  AppButton(
                    label: t.common.retry,
                    onPressed: onRetry,
                    expand: false,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
