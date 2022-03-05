import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/auth/sign_in.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:liveapp/widgets/curve.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final controller = CarouselController();
  int activeIndex = 0;
  List onboardingImages = [
    'assets/lotti_files/onboarding1.json',
    'assets/lotti_files/onboarding3.json',
    'assets/lotti_files/onboarding4.json',
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeColor().scafoldBackground,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Lottie.asset('assets/lotti_files/onboarding2.json')),
                Text("Shopping",
                    style:
                        GoogleFonts.aclonica(color: Colors.black, fontSize: 16))
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignINPage()));
              },
              child: Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    color: ThemeColor().scafoldBackground),
                child: Center(
                  child: Text(
                    "Skip",
                    style:
                        GoogleFonts.aclonica(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            // child: Lottie.asset('assets/lotti_files/onboarding1.json'),

            child: Column(
              children: [
                CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: onboardingImages.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    child: Lottie.asset('${onboardingImages[itemIndex]}'),
                  ),
                  options: CarouselOptions(
                      height: 300,
                      initialPage: 0,
                      // autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                          print(index);
                        });
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.previousPage();
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.8),
                            borderRadius: BorderRadius.circular(30),
                            color: ThemeColor().scafoldBackground),
                        child: Center(
                          child: Text(
                            "Previous",
                            style: GoogleFonts.aclonica(
                                color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    buildIndicator(),
                    InkWell(
                      onTap: () {
                        controller.nextPage();
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.8),
                            borderRadius: BorderRadius.circular(30),
                            color: ThemeColor().scafoldBackground),
                        child: Center(
                          child: Text(
                            "Next",
                            style: GoogleFonts.aclonica(
                                color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                activeIndex == 0
                    ? builldPageInfo(
                        "Welcome to Shooping",
                        "It's a long easteblished fact that a reader will",
                        "distracted by a readavble content of page when",
                        "looking at it's layout")
                    : activeIndex == 1
                        ? builldPageInfo(
                            "Buy from anyWhere",
                            "It's a long easteblished fact that a reader will",
                            "distracted by a readavble content of page when",
                            "looking at it's layout")
                        : activeIndex == 2
                            ? builldPageInfo(
                                "Door to door delivery",
                                "It's a long easteblished fact that a reader will",
                                "distracted by a readavble content of page when",
                                "looking at it's layout")
                            : Container(),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  child: RaisedButton(
                      splashColor: Colors.white.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: ThemeColor().themeColor,
                      onPressed: () {
                        if (activeIndex == 0 || activeIndex == 1) {
                          controller.nextPage();
                        }
                      },
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            activeIndex == 0
                                ? "Start"
                                : activeIndex == 1
                                    ? "Continue"
                                    : "Let's begin",
                            style: GoogleFonts.aclonica(
                                color: Colors.white, fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget builldPageInfo(
      String title, String text1, String text2, String text3) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.aclonica(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: GoogleFonts.aclonica(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.3,
                fontSize: 13,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text2,
              style: GoogleFonts.aclonica(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.3,
                fontSize: 13,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text3,
              style: GoogleFonts.aclonica(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.3,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: onboardingImages.length,
      effect: JumpingDotEffect(
          radius: 7.0,
          dotWidth: 15.0,
          dotHeight: 10.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          dotColor: Colors.black,
          activeDotColor: Colors.black),
    );
  }
}
