import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/theme_manager.dart';

class TutApp extends StatefulWidget {
  const TutApp({super.key});

  @override
  State<TutApp> createState() => _TutAppState();
}

class _TutAppState extends State<TutApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(),
    );
  }
}
