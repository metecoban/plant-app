import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required int id,
    required String title,
    required String subtitle,
    @JsonKey(name: 'image_uri') required String imageUri,
    required String uri,
    required int order,
  }) = _QuestionModel;

  const QuestionModel._();

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Question toEntity() {
    return Question(
      id: id,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUri,
      linkUrl: uri,
      order: order,
    );
  }
}
