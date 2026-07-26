import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_image_model.freezed.dart';
part 'plant_image_model.g.dart';

@freezed
abstract class PlantImageModel with _$PlantImageModel {
  const factory PlantImageModel({
    required String url,
  }) = _PlantImageModel;

  factory PlantImageModel.fromJson(Map<String, dynamic> json) =>
      _$PlantImageModelFromJson(json);
}
