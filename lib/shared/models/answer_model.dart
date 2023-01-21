import 'dart:convert';

class AnswerModel {
  AnswerModel({
    required this.title,
    this.isRight = false,
  });

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));
  final String title;
  final bool isRight;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  String toJson() => json.encode(toMap());
}
