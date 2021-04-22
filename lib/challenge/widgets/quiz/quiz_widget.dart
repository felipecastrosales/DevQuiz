import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChanged;
  const QuizWidget({Key? key, required this.question, required this.onChanged})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.question.title, style: AppTextStyles.heading),
          ),
          SizedBox(height: 20),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answer(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: () {
                indexSelected = i;
                widget.onChanged();
                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((value) => widget.onChanged());
              },
            ),
        ],
      ),
    );
  }
}
