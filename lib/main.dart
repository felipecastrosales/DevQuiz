import 'package:flutter/material.dart';

import 'package:devquiz/splash/splash_page.dart';

void main() {
  runApp(
    const DevQuizApp(),
  );
}

class DevQuizApp extends StatelessWidget {
  const DevQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DevQuiz',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
