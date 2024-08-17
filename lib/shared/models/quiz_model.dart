import 'dart:convert';

import 'package:devquiz/shared/enums/level_enum.dart';
import 'package:devquiz/shared/extensions/level_string_extension.dart';

import 'question_model.dart';

class QuizModel {
  QuizModel({
    required this.title,
    required this.image,
    required this.level,
    required this.questions,
    this.questionAnswered = 0,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
        map['questions']?.map(
          (question) => QuestionModel.fromMap(question),
        ),
      ),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map['level'].toString().levelMapping,
    );
  }

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  final String title;
  final String image;
  final Level level;
  final List<QuestionModel> questions;
  final int questionAnswered;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((question) => question.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.name,
    };
  }

  String toJson() => json.encode(toMap());
}
