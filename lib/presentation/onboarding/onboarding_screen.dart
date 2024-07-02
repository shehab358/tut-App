import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/presentation/onboarding/layout.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/constant_manager.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<SliderObject> _getSliderData() => [
        SliderObject(
          image: ImageAssets.onboardingLogo1,
          subTitle: StringsManager.onBoardingsubTitle1,
          title: StringsManager.onBoardingTitle1,
        ),
        SliderObject(
          image: ImageAssets.onboardingLogo2,
          subTitle: StringsManager.onBoardingsubTitle2,
          title: StringsManager.onBoardingTitle2,
        ),
        SliderObject(
          image: ImageAssets.onboardingLogo3,
          subTitle: StringsManager.onBoardingsubTitle3,
          title: StringsManager.onBoardingTitle3,
        ),
        SliderObject(
          image: ImageAssets.onboardingLogo4,
          subTitle: StringsManager.onBoardingsubTitle4,
          title: StringsManager.onBoardingTitle4,
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        itemBuilder: (context, index) => OnboardingLayout(
          sliderObject: _list[index],
        ),
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.loginRoute,
                  );
                },
                child: Text(
                  StringsManager.skip,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            getBottomSheetWidget()
          ],
        ),
      ),
    );
  }

  Widget getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(
              AppPadding.p14,
            ),
            child: GestureDetector(
              onTap: () => _pageController.animateToPage(
                duration: const Duration(
                  milliseconds: ConstantManager.sliderAnimationTime,
                ),
                curve: Curves.bounceInOut,
                getPreviousIndex(),
              ),
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssets.leftArrow,
                ),
              ),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: EdgeInsets.all(
                    AppPadding.p8,
                  ),
                  child: getCircle(i),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(
              AppPadding.p14,
            ),
            child: GestureDetector(
              onTap: () => _pageController.animateToPage(
                duration: const Duration(
                  milliseconds: ConstantManager.sliderAnimationTime,
                ),
                curve: Curves.bounceInOut,
                getNextIndex(),
              ),
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssets.rightArrow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(
        ImageAssets.hollowCircle,
      );
    } else {
      return SvgPicture.asset(
        ImageAssets.solidCircle,
      );
    }
  }

  int getPreviousIndex() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  int getNextIndex() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == 4) {
      nextIndex = 0;
    }
    return nextIndex;
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject({
    required this.image,
    required this.subTitle,
    required this.title,
  });
}
