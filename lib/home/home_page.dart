import 'package:flutter/material.dart';

import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';

import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      final labels = ['Easy', 'Middle', 'Hard', 'Expert'];

      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 32,
              child: ListView.separated(
                itemCount: labels.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return LevelButtonWidget(label: labels[index]);
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: controller.quizzes?.map(
                      (quiz) {
                        final questionAnswered = quiz.questionAnswered;
                        final questionLength = quiz.questions.length;
                        final percent = questionAnswered / questionLength;
                        final title = quiz.title;
                        final image = quiz.image;
                        final questions = quiz.questions;
                        final completed = '$questionAnswered/$questionLength';

                        return QuizCardWidget(
                          image: image,
                          title: title,
                          percent: percent,
                          completed: completed,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(
                                  title: title,
                                  questions: questions,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList() ??
                    [],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.darkGreen,
            ),
          ),
        ),
      );
    }
  }
}
