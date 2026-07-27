// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlantModel _$PlantModelFromJson(Map<String, dynamic> json) => _PlantModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  title: json['title'] as String,
  rank: (json['rank'] as num).toInt(),
  image: PlantImageModel.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlantModelToJson(_PlantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'rank': instance.rank,
      'image': instance.image,
    };
