import 'dart:convert';

class UserModel {
  UserModel({
    required this.name,
    required this.photoUrl,
    this.score = 0,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  final String name;
  final String photoUrl;
  final int score;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
    };
  }

  String toJson() => json.encode(toMap());
}
