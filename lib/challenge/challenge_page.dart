import 'package:flutter/material.dart';

import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';

import 'challenge_controller.dart';
import 'widgets/next_button/next_button_widget.dart';
import 'widgets/question_indicator/question_indicator_widget.dart';
import 'widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({
    super.key,
    required this.questions,
    required this.title,
  });

  final List<QuestionModel> questions;
  final String title;

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  int get questionsLength => widget.questions.length;

  @override
  initState() {
    pageController.addListener(() {
      controller.currentPage = (pageController.page?.toInt() ?? 0) + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < questionsLength) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  void onSelected(bool value) {
    if (value) {
      controller.quantityAnswer++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: questionsLength,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (question) => QuizWidget(
                question: question,
                onSelected: onSelected,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (value < questionsLength)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: 'Skip',
                      onTap: nextPage,
                    ),
                  ),
                if (value == questionsLength)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: 'Confirm',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              title: widget.title,
                              length: questionsLength,
                              result: controller.quantityAnswer,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
