import 'package:explora_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({super.key});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreenBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: Image.asset('assets/onboardingpicture1.png'),
          )),
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 100.0),
            child: Container(
              width: 250,
              child: Text(
                "Explore the world easily",
                style: GoogleFonts.montserrat(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 170.0),
            child: Text(
              "To your desire",
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingWidget1 extends StatefulWidget {
  const OnBoardingWidget1({super.key});

  @override
  State<OnBoardingWidget1> createState() => _OnBoardingWidget1State();
}

class _OnBoardingWidget1State extends State<OnBoardingWidget1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreenBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/onboardingpicture.png')),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: Container(
              width: 290,
              child: Text(
                "Reach the unknown spot",
                style: GoogleFonts.montserrat(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 110.0),
            child: Text(
              "To your destination",
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoarding3 extends StatefulWidget {
  const OnBoarding3({super.key});

  @override
  State<OnBoarding3> createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreenBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/onboardingpicture3.png')),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: Container(
              width: 290,
              child: Text(
                "Make connects with explora",
                style: GoogleFonts.montserrat(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 120.0),
            child: Text(
              "To your dream trip",
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
