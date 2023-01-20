import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({
    super.key,
    required this.currentPage,
    required this.length,
  });

  final int currentPage;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Question $currentPage', style: AppTextStyles.body),
              Text('of $length', style: AppTextStyles.body),
            ],
          ),
          const SizedBox(height: 16),
          ProgressIndicatorWidget(value: currentPage / length),
        ],
      ),
    );
  }
}
