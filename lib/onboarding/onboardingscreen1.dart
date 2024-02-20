import 'package:explora_app/Widget/onboardingWidget.dart';
import 'package:explora_app/screens/Authentication/login.dart';
import 'package:explora_app/screens/HomePage.dart';
import 'package:explora_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreenBackgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              OnBoardingWidget(),
              OnBoardingWidget1(),
              OnBoarding3(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment(-0.80, 0.80),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const JumpingDotEffect(
                    dotWidth: 20,
                    dotHeight: 5,
                    verticalOffset: 5,
                    dotColor: secondaryColor,
                    activeDotColor: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Padding(
                padding: EdgeInsets.only(top: 635.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (onLastPage) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginForm(),
                        ),
                      );
                    } else {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                      child:
                      Text("next");
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  label: Text(""),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Set the button background color
                    onPrimary: Colors.white, // Set the text color
                    elevation: 8, // Set the elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
