import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Question 04', style: AppTextStyles.body),
              Text('of 10', style: AppTextStyles.body),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: 0.4),
        ],
      ),
    );
  }
}