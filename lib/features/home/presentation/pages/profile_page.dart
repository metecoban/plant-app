import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/settings/language_picker_sheet.dart';
import 'package:plant_app/app/settings/theme_cubit.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/i18n/strings.g.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    final currentLocale = LocaleSettings.currentLocale;

    return ColoredBox(
      color: context.appColors.homeBackground,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontal,
          vertical: AppSpacing.section,
        ),
        children: [
          Center(
            child: Text(
              t.home.navProfile,
              textAlign: TextAlign.center,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.appColors.mainText,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.section),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              t.profile.darkTheme,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.appColors.mainText,
              ),
            ),
            value: isDark,
            onChanged: (value) {
              context.read<ThemeCubit>().setThemeMode(
                value ? ThemeMode.dark : ThemeMode.light,
              );
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              t.profile.language,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.appColors.mainText,
              ),
            ),
            subtitle: Text(
              currentLocale == AppLocale.tr
                  ? t.profile.languageTr
                  : t.profile.languageEn,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.appColors.subText,
              ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: context.appColors.subText,
            ),
            onTap: () => LanguagePickerSheet.show(context),
          ),
        ],
      ),
    );
  }
}
