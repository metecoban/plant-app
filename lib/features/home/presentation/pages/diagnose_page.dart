import 'package:flutter/material.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/features/home/presentation/widgets/home_tab_placeholder.dart';

class DiagnosePage extends StatelessWidget {
  const DiagnosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeTabPlaceholder(title: t.home.navDiagnose);
  }
}
