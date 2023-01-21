import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:devquiz/core/app_colors.dart';

class LevelButtonWidget extends StatelessWidget {
  LevelButtonWidget({
    super.key,
    required this.label,
  }) : assert(
          [
            'Easy',
            'Middle',
            'Hard',
            'Expert',
          ].contains(label),
        );

  final String label;

  final config = {
    'Easy': {
      'color': AppColors.levelButtonEasy,
      'borderColor': AppColors.levelButtonBorderEasy,
      'fontColor': AppColors.levelButtonTextEasy,
    },
    'Middle': {
      'color': AppColors.levelButtonMiddle,
      'borderColor': AppColors.levelButtonBorderMiddle,
      'fontColor': AppColors.levelButtonTextMiddle,
    },
    'Hard': {
      'color': AppColors.levelButtonHard,
      'borderColor': AppColors.levelButtonBorderHard,
      'fontColor': AppColors.levelButtonTextHard,
    },
    'Expert': {
      'color': AppColors.levelButtonExpert,
      'borderColor': AppColors.levelButtonBorderExpert,
      'fontColor': AppColors.levelButtonTextExpert,
    },
  };

  Color get color => config[label]?['color'] ?? AppColors.levelButtonEasy;
  Color get borderColor =>
      config[label]?['borderColor'] ?? AppColors.levelButtonBorderEasy;
  Color get fontColor =>
      config[label]?['fontColor'] ?? AppColors.levelButtonTextEasy;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(
          BorderSide(color: borderColor),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
