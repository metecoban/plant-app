import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/network/app_image_cache_manager.dart';

class PlantImage extends StatelessWidget {
  const PlantImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    super.key,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      cacheManager: AppImageCacheManager.instance,
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, _) => ColoredBox(
        color: context.appColors.homeBackground,
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: context.appColors.primary.withValues(alpha: 0.6),
            ),
          ),
        ),
      ),
      errorWidget: (_, _, _) => ColoredBox(
        color: context.appColors.homeBackground,
        child: Icon(
          Icons.local_florist_outlined,
          color: context.appColors.subText.withValues(alpha: 0.5),
          size: (width ?? height ?? 24) * 0.4,
        ),
      ),
    );

    if (borderRadius == null) {
      return image;
    }

    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}
