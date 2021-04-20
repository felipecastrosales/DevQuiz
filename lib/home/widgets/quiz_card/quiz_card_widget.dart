import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      border: Border.fromBorderSide(
        BorderSide(color: AppColors.border)),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(height: 14),
            Text('State \nManagement', style: AppTextStyles.heading15),
            SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  flex: 1, child: Text('3/10', style: AppTextStyles.body11),
                ),
                Expanded(
                  flex: 4, child: ProgressIndicatorWidget(value: 0.3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}