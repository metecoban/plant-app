import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plant_app/features/home/data/models/category/plant_model.dart';

part 'categories_response_model.freezed.dart';
part 'categories_response_model.g.dart';

@freezed
abstract class CategoriesResponseModel with _$CategoriesResponseModel {
  const factory CategoriesResponseModel({
    required List<PlantModel> data,
  }) = _CategoriesResponseModel;

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
}
