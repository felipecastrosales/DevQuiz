import 'package:devquiz/shared/enums/level_enum.dart';

extension LevelExtension on Level {
  String get levelStringMapping =>
      {
        Level.easy: 'easy',
        Level.middle: 'middle',
        Level.hard: 'hard',
        Level.expert: 'expert',
      }[this] ??
      '';
}
