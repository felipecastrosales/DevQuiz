import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:devquiz/core/app_colors.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  LevelButtonWidget({Key? key, required this.label})
      : assert(['Easy', 'Middle', 'Hard', 'Expert'].contains(label)),
        super(key: key);

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

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']! ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(BorderSide(
          color: borderColor)),
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
