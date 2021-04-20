import 'package:flutter/material.dart';

import 'package:devquiz/challenge/challenge_page.dart';
// import 'package:devquiz/splash/splash_page.dart';
//import 'package:devquiz/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevQuiz',
      debugShowCheckedModeBanner: false,
      home: ChallengePage(),
    );
  }
}
