import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({Key? key, required this.value})
      : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
