import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_radius.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';
import 'package:plant_app/features/home/presentation/widgets/plant_image.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({required this.plant, super.key});

  final Plant plant;

  static const _imageSizeFactor = 1.02;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize = constraints.maxWidth * _imageSizeFactor;

        return Container(
          decoration: BoxDecoration(
            color: AppPalette.surface,
            borderRadius: BorderRadius.circular(AppRadius.r12),
            border: Border.all(
              color: AppPalette.subText.withValues(alpha: 0.08),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Positioned(
                right: -2,
                bottom: -2,
                child: PlantImage(
                  imageUrl: plant.imageUrl,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.item),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    plant.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.labelLarge?.copyWith(
                      fontSize: 15,
                      height: 1.3,
                      color: AppPalette.mainText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
