import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:food_app/signin_register_screens/login_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider<OnBoardState>(
      create: (_) => OnBoardState(),
      child: Scaffold(
        body: OnBoard(
          pageController: _pageController,

          // Either Provide onSkip Callback or skipButton Widget to handle skip state
          onSkip: () {
            print('skipped');
          },
          // Either Provide onDone Callback or nextButton Widget to handle done state
          onDone: () {
            print('done tapped');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => login_screen()),
            );
          },
          onBoardData: onBoardData,
          titleStyles: const TextStyle(
            color: Color.fromRGBO(1, 15, 7, 1),
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
          ),
          descriptionStyles: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(134, 134, 134, 1),
          ),
          pageIndicatorStyle: const PageIndicatorStyle(
            width: 100,
            inactiveColor: Color.fromRGBO(252, 186, 24, 1),
            activeColor: Color.fromRGBO(252, 186, 24, 1),
            inactiveSize: Size(8, 8),
            activeSize: Size(12, 12),
          ),
          // Either Provide onSkip Callback or skipButton Widget to handle skip state
          skipButton: TextButton(
            onPressed: () {
              // print('skipped');
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
          ),
          // Either Provide onDone Callback or nextButton Widget to handle done state
          nextButton: Consumer<OnBoardState>(
            builder: (BuildContext context, OnBoardState state, Widget? child) {
              return InkWell(
                onTap: () => _onNextTap(state),
                child: Container(
                  width: 330,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(252, 186, 24, 1),
                  ),
                  child: Text(
                    state.isLastPage ? "Done" : "Get Started",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      // print("done");
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "All your favorites",
    description:
        "Order from the best local restaurants with\neasy, on-demand delivery.",
    imgUrl: "images/onboarding1.png",
  ),
  const OnBoardModel(
    title: "Free delivery offers",
    description:
        "Free delivery for new customers via Apple Pay and others payment methods.",
    imgUrl: 'images/onboarding2.png',
  ),
  const OnBoardModel(
    title: "Choose your food",
    description:
        "Easily find your type of food craving and you’ll get delivery in wide range.",
    imgUrl: 'images/onboarding3.png',
  ),
];
