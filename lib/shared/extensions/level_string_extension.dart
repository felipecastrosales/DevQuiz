import 'package:devquiz/shared/enums/level_enum.dart';

extension LevelStringExtension on String {
  Level get levelMapping =>
      {
        'easy': Level.easy,
        'middle': Level.middle,
        'hard': Level.hard,
        'expert': Level.expert
      }[this] ??
      Level.easy;
}
