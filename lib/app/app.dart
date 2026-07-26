import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plant_app/app/di/injection.dart';
import 'package:plant_app/app/router/app_router.dart';
import 'package:plant_app/app/theme/app_theme.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_cubit.dart';
import 'package:plant_app/features/app_flow/presentation/widgets/app_flow_listener.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return BlocProvider(
      create: (_) => getIt<AppFlowCubit>()..loadFlow(),
      child: AppFlowListener(
        appRouter: appRouter,
        child: MaterialApp.router(
          title: 'Plant App',
          theme: AppTheme.light,
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          routerConfig: appRouter.config(),
        ),
      ),
    );
  }
}
