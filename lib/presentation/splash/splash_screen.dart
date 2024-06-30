import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/constant_manager.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
Timer? _timer;

_startDelay(){
  _timer = Timer(const Duration(seconds: ConstantManager.splashDelay), _goNext);
}

_goNext (){
  Navigator.pushReplacementNamed(context, Routes.onBoarding);
}

@override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Image.asset(ImageAssets.splashLogo),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}