import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    super.key,
    required this.question,
    required this.onSelected,
  });

  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(widget.question.title, style: AppTextStyles.heading),
        ),
        const SizedBox(height: 20),
        for (var i = 0; i < widget.question.answers.length; i++)
          AnswerWidget(
            answer: answer(i),
            isSelected: indexSelected == i,
            disabled: indexSelected != -1,
            onTap: (value) {
              indexSelected = i;
              setState(() {});
              Future.delayed(
                const Duration(seconds: 1),
              ).then(
                (_) => widget.onSelected(value),
              );
            },
          ),
      ],
    );
  }
}
