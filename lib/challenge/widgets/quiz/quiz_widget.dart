import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/core.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(title, style: AppTextStyles.heading),
          ),
          SizedBox(height: 24),
          AnswerWidget(
            isRight: true,
            isSelected: true,
            title: 'Enables the creation of applications natively compiled',
          ),
          AnswerWidget(
            isRight: false,
            isSelected: true,
            title: 'Enables the creation of applications natively compiled',
          ),
          AnswerWidget(
            title: 'Enables the creation of applications natively compiled',
          ),
          AnswerWidget(
            title: 'Enables the creation of applications natively compiled',
          ),
        ],
      ),
    );
  }
}