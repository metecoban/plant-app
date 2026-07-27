import 'package:plant_app/features/home/data/models/category/plant_image_model.dart';
import 'package:plant_app/features/home/data/models/category/plant_model.dart';
import 'package:plant_app/features/home/data/models/question/question_model.dart';

const sampleQuestionModel = QuestionModel(
  id: 1,
  title: 'How to identify plants?',
  subtitle: 'Learn more',
  imageUri: 'https://example.com/q.jpg',
  uri: 'https://example.com',
  order: 2,
);

const sampleQuestionModelTwo = QuestionModel(
  id: 2,
  title: 'Care guides',
  subtitle: 'Tips',
  imageUri: 'https://example.com/q2.jpg',
  uri: 'https://example.com/2',
  order: 1,
);

const samplePlantModel = PlantModel(
  id: 10,
  name: 'fern',
  title: 'Edible Plants',
  rank: 2,
  image: PlantImageModel(url: 'https://example.com/p.jpg'),
);

const samplePlantModelTwo = PlantModel(
  id: 11,
  name: 'rose',
  title: 'Flowers',
  rank: 1,
  image: PlantImageModel(url: 'https://example.com/p2.jpg'),
);

final sampleQuestion = sampleQuestionModel.toEntity();

final samplePlant = samplePlantModel.toEntity();
