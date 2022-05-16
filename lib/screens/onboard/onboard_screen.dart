import 'package:blind_side/screens/onboard/onboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnBoardScreen extends ConsumerStatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  OnBoardScreenState createState() => OnBoardScreenState();
}

class OnBoardScreenState extends ConsumerState<OnBoardScreen> {
  void onSubmitDone(BuildContext context) {
    // When user pressed skip/done button we'll finally set onboardCount integer
    // After that onboard state is done we'll go to homepage.
    ref.read(onboardNotifierProvider.notifier).hasOnboarded();
    GoRouter.of(context).go("/");
  }

// Create a private index to track image index
  int _currentImgIndex = 0;

// Create list with images to use while onboarding
  // #2
  final onBoardScreenImages = [
    "assets/onboard/1.png",
    "assets/onboard/2.png",
    "assets/onboard/3.png",
    "assets/onboard/4.png",
    "assets/onboard/5.png",
  ];

// Function to display next image in the list when next button  is clicked
  void nextImage() {
    if (_currentImgIndex < onBoardScreenImages.length - 1) {
      setState(() => _currentImgIndex += 1);
    }
  }

// Function to display previous image in the list when previous button  is clicked
  void prevImage() {
    if (_currentImgIndex > 0) {
      setState(() => _currentImgIndex -= 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 255, 160, 160),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Animated switcher class to animated between images
              // #4
              AnimatedSwitcher(
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeOut,
                transitionBuilder: ((child, animation) =>
                    ScaleTransition(scale: animation, child: child)),
                duration: const Duration(milliseconds: 800),
                child: Image.asset(
                  onBoardScreenImages[_currentImgIndex],
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  // Key is needed since widget type is same i.e Image
                  key: ValueKey<int>(_currentImgIndex),
                ),
              ),
              // Container to that contains set butotns
              // #5
              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      // Change visibility by currentImgIndex
                      onPressed: prevImage,
                      icon: _currentImgIndex == 0
                          ? const Icon(null)
                          : const Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      // Change visibility by currentImgIndex
                      onPressed:
                          _currentImgIndex == onBoardScreenImages.length - 1
                              ? () => onSubmitDone(context)
                              : nextImage,
                      icon: _currentImgIndex == onBoardScreenImages.length - 1
                          ? const Icon(Icons.done)
                          : const Icon(Icons.arrow_forward),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
