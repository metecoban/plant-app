import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';
import 'package:plant_app/features/home/presentation/widgets/plant_card.dart';

class PlantList extends StatelessWidget {
  const PlantList({required this.plants, super.key});

  final List<Plant> plants;

  static const _crossAxisCount = 2;
  static const _mainAxisSpacing = AppSpacing.compact;
  static const _crossAxisSpacing = AppSpacing.compact;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.horizontal,
        AppSpacing.section,
        AppSpacing.horizontal,
        AppSpacing.section,
      ),
      sliver: SliverGrid.builder(
        itemCount: plants.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount,
          mainAxisSpacing: _mainAxisSpacing,
          crossAxisSpacing: _crossAxisSpacing,
        ),
        itemBuilder: (context, index) {
          return PlantCard(plant: plants[index]);
        },
      ),
    );
  }
}
