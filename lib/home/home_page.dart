import 'package:flutter/material.dart';

import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
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
                mainAxisSpacing:16,
                crossAxisCount: 2,
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
