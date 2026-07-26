import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/shared/widgets/app_button.dart';

class CommonEmptyView extends StatelessWidget {
  const CommonEmptyView({
    this.title,
    this.message,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final String? title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;

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
                  Icons.inbox_outlined,
                  size: 48,
                  color: context.appColors.subText,
                ),
                const SizedBox(height: AppSpacing.item),
                Text(
                  title ?? t.common.emptyTitle,
                  style: context.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.compact),
                Text(
                  message ?? t.common.emptyMessage,
                  style: context.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                if (onAction != null && actionLabel != null) ...[
                  const SizedBox(height: AppSpacing.section),
                  AppButton(
                    label: actionLabel!,
                    onPressed: onAction,
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
