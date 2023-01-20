import 'dart:convert';

import 'question_model.dart';

enum Level { easy, middle, hard, expert }

extension LevelStringExtension on String {
  Level get parse => {
        'easy': Level.easy,
        'middle': Level.middle,
        'hard': Level.hard,
        'expert': Level.expert
      }[this]!;
}

extension LevelExtension on Level {
  String get parse => {
        Level.easy: 'easy',
        Level.middle: 'middle',
        Level.hard: 'hard',
        Level.expert: 'expert',
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
