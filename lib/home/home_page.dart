import 'package:devquiz/challenge/challenge_page.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';

import 'home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
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
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 32,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    LevelButtonWidget(label: 'Easy'),
                    SizedBox(width: 10),
                    LevelButtonWidget(label: 'Middle'),
                    SizedBox(width: 10),
                    LevelButtonWidget(label: 'Hard'),
                    SizedBox(width: 10),
                    LevelButtonWidget(label: 'Expert'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!.map(
                    (e) => QuizCardWidget(
                      title: e.title,
                      completed: '${e.questionAnswered}/${e.questions.length}',
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ChallengePage(
                            title: e.title,
                            questions: e.questions, 
                          ),
                        ));
                      },
                      percent: e.questionAnswered / e.questions.length, 
                      image: e.image,
                    ),
                  ).toList(),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
