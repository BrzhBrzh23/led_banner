import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/constants/gradient_text.dart';
import 'package:led_banner/home/app_home.dart';
import 'onboardingcontent.dart';
import 'onboard_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/purple_background.jpeg'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Center(
            child: Stack(
              children: [
                PageView.builder(
                    itemCount: onboard_data.length,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return OnBoardingContent(
                        image: onboard_data[index].image,
                        title: onboard_data[index].title,
                        description: onboard_data[index].description,
                      );
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: TextButton(
                        onPressed: () {
                          if (_pageController.page == 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppHome()));
                          } else {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          }
                        },
                        child: GradientText(
                          'CONTINUE',
                          style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(99, 226, 255, 1),
                            Color.fromRGBO(176, 102, 254, 1)
                          ]),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
