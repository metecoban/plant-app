import 'package:flutter/material.dart';
import 'package:plant_app/app/di/injection.dart';
import 'package:plant_app/app/settings/app_settings_repository.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/i18n/strings.g.dart';

class LanguagePickerSheet extends StatelessWidget {
  const LanguagePickerSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => const LanguagePickerSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = LocaleSettings.currentLocale;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppSpacing.horizontal,
          right: AppSpacing.horizontal,
          bottom: AppSpacing.section,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              t.profile.selectLanguage,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.appColors.mainText,
              ),
            ),
            const SizedBox(height: AppSpacing.compact),
            _LanguageOption(
              code: 'EN',
              label: t.profile.languageEn,
              isSelected: currentLocale == AppLocale.en,
              onTap: () => _selectLocale(context, AppLocale.en),
            ),
            _LanguageOption(
              code: 'TR',
              label: t.profile.languageTr,
              isSelected: currentLocale == AppLocale.tr,
              onTap: () => _selectLocale(context, AppLocale.tr),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectLocale(BuildContext context, AppLocale locale) async {
    final repository = getIt<AppSettingsRepository>();
    await repository.saveLocale(locale);
    await LocaleSettings.setLocale(locale);

    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.code,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String code;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: Text(
        code,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.appColors.mainText,
          fontWeight: FontWeight.w600,
        ),
      ),
      title: Text(
        label,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.appColors.mainText,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppPalette.primary)
          : null,
    );
  }
}
