import 'package:flutter/material.dart';
import 'onBoardingOne.dart';
import 'onBoardingTwo.dart';
import 'onBoardingThree.dart';
import '../HomePage.dart';

class OnBoardingWrapper extends StatefulWidget {
  const OnBoardingWrapper({super.key});

  @override
  State<OnBoardingWrapper> createState() => _OnBoardingWrapperState();
}

class _OnBoardingWrapperState extends State<OnBoardingWrapper> {
  final PageController _controller = PageController();

  void _onSkip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          // 👇 When user swipes past the last page, go to HomePage
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }
        },
        children: const [OnBoardingOne(), OnBoardingTwo(), OnBoardingThree()],
      ),
    );
  }
}
