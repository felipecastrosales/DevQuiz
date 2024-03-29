import 'dart:convert';

import 'answer_model.dart';

class QuestionModel {
  QuestionModel({
    required this.title,
    required this.answers,
  }) : assert(
          answers.length == 4,
        );

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      answers: List<AnswerModel>.from(
        map['answers']?.map(
          (answer) => AnswerModel.fromMap(answer),
        ),
      ),
    );
  }

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  final String title;
  final List<AnswerModel> answers;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((answer) => answer.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
