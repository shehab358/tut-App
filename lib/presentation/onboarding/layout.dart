import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/presentation/onboarding/onboarding_screen.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnboardingLayout extends StatelessWidget {
  const OnboardingLayout({super.key, required this.sliderObject});

  final SliderObject sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(sliderObject.image),
      ],
    );
  }
}
