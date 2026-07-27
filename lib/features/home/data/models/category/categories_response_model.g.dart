// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesResponseModel _$CategoriesResponseModelFromJson(
  Map<String, dynamic> json,
) => _CategoriesResponseModel(
  data: (json['data'] as List<dynamic>)
      .map((e) => PlantModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoriesResponseModelToJson(
  _CategoriesResponseModel instance,
) => <String, dynamic>{'data': instance.data};
