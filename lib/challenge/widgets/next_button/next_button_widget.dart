import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  });

  const NextButtonWidget.green({
    super.key,
    required this.label,
    required this.onTap,
  })  : backgroundColor = AppColors.darkGreen,
        fontColor = AppColors.white,
        borderColor = AppColors.green;

  const NextButtonWidget.purple({
    super.key,
    required this.label,
    required this.onTap,
  })  : backgroundColor = AppColors.purple,
        fontColor = AppColors.white,
        borderColor = AppColors.green;

  const NextButtonWidget.white({
    super.key,
    required this.label,
    required this.onTap,
  })  : backgroundColor = AppColors.white,
        fontColor = AppColors.grey,
        borderColor = AppColors.border;

  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            (backgroundColor),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: WidgetStateProperty.all(
            BorderSide(color: borderColor),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
