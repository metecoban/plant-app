import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plant_app/features/home/data/models/category/plant_image_model.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';

part 'plant_model.freezed.dart';
part 'plant_model.g.dart';

@freezed
abstract class PlantModel with _$PlantModel {
  const factory PlantModel({
    required int id,
    required String name,
    required String title,
    required int rank,
    required PlantImageModel image,
  }) = _PlantModel;

  const PlantModel._();

  factory PlantModel.fromJson(Map<String, dynamic> json) =>
      _$PlantModelFromJson(json);

  Plant toEntity() {
    return Plant(
      id: id,
      name: name,
      title: title,
      rank: rank,
      imageUrl: image.url,
    );
  }
}
