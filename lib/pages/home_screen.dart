import 'dart:math';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:liveapp/pages/all_products.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final controller = CarouselController();
  late AnimationController animationController;
  int activeIndex = 0;
  List<String> categoryImages = [
    'assets/images/men.png',
    'assets/images/women.png',
    'assets/images/kids.png',
    'assets/images/health.png',
    'assets/images/automotives.png',
    'assets/images/beauty.png',
    'assets/images/electronics.png',
    'assets/images/fitness.png'
  ];
  List<String> categoryNames = [
    'Men',
    'Women',
    'Kids',
    'Health',
    'Automotives',
    'Beauty & Care',
    'Electronics',
    'Sports & Fitness'
  ];

  List<String> sampleImages = [
    'assets/images/picture1.jpg',
    'assets/images/picture2.jpg',
    'assets/images/picture3.jpg',
    'assets/images/picture4.jpg',
    'assets/images/picture5.jpg',
    'assets/images/picture6.jpg'
  ];
  double value = 0;
  bool showBottomNavigationBar = true;
  _animateIcon() {
    if (value == 0) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animationController.forward();
  }

  // _onStartScroll(ScrollMetrics metrics) {
  //   setState(() {
  //     showBottomNavigationBar = false;
  //     print("knvbhfv");
  //   });
  // }

  // // _onUpdateScroll(ScrollMetrics metrics) {
  // //   setState(() {
  // //     showMore = false;
  // //   });
  // // }

  // _onEndScroll(ScrollMetrics metrics) {
  //   setState(() {
  //     showBottomNavigationBar = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // we will make drawer here........................
        TweenAnimationBuilder(
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    value == 0 ? value = 1 : value = 0;
                                    _animateIcon();
                                  });
                                },
                                child: AnimatedIcon(
                                  icon: AnimatedIcons.close_menu,
                                  progress: animationController,
                                )),
                            Badge(
                              badgeColor: ThemeColor().themeColor,
                              badgeContent: Text(
                                "2",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AllProducts()));
                                },
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.shade400.withOpacity(0.2)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: TextFormField(
                              cursorColor: ThemeColor().themeColor,
                              decoration: InputDecoration(
                                focusColor: ThemeColor().themeColor,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                                hintText: "Search",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      buildCategoryCard(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      buildCaursel(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      buildInstructionCard(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllProducts()));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.asset(
                              'assets/images/offer.jpg',
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text("Products You May Like",
                                    style: GoogleFonts.aclonica(fontSize: 15)),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 6,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return buildProductYouMayLike();
                                }),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("best Sellers",
                                      style:
                                          GoogleFonts.aclonica(fontSize: 16)),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AllProducts()));
                                    },
                                    child: Text("View All",
                                        style: GoogleFonts.aclonica(
                                            color: ThemeColor().themeColor)),
                                  )
                                ]),
                          ),
                          Container(
                            // color: Colors.grey,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: 4,
                                itemBuilder: (BuildContext context, int index) {
                                  return buildBestSellers();
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      )
                      // Text(
                      //   "Comming Soon!",
                      //   style: TextStyle(fontSize: 50),
                      // ),
                      // SizedBox(
                      //   height: 32,
                      // ),
                    ],
                  ),
                ),
              ));
            }),
        // GestureDetector(
        //   onHorizontalDragUpdate: (e) {
        //     if (e.delta.dx > 0) {
        //       setState(() {
        //         value = 1;
        //       });
        //     } else {
        //       setState(() {
        //         value = 0;
        //       });
        //     }
        //   },
        // )
      ],
    );
  }

  Widget buildCategoryCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.grey.shade400.withOpacity(0.2),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome!",
                      style: GoogleFonts.aclonica(
                          color: Colors.black, fontSize: 19),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Latest deals only for you!",
                      style: GoogleFonts.aclonica(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/snowman.png',
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categoryImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400.withOpacity(0.1),
                              border: Border.all(
                                width: 2,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 40),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: Image.asset(categoryImages[index]),
                            ),
                          ),
                        ),
                        Positioned(
                            child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              color: ThemeColor().themeColor),
                          child: Center(
                            child: Text(categoryNames[index],
                                style: GoogleFonts.aclonica(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11)),
                          ),
                        ))
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget buildProductYouMayLike() {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/bag.jpg'),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          "Women Bag",
          style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }

  Widget buildInstructionCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration:
          BoxDecoration(color: ThemeColor().themeColor.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(children: [
            Container(
              width: 40,
              height: 40,
              child: Lottie.asset('assets/lotti_files/cashondelivery.json'),
            ),
            SizedBox(
              width: 5,
            ),
            Text("Cash on \ndelivery", style: TextStyle(color: Colors.black)),
            Container(
              height: 30,
              child: VerticalDivider(
                thickness: 0.5,
                color: Colors.black,
              ),
            )
          ]),
          Row(children: [
            Container(
              width: 40,
              height: 40,
              child: Lottie.asset('assets/lotti_files/returns.json'),
            ),
            SizedBox(
              width: 5,
            ),
            Text("Easy & free \nreturn", style: TextStyle(color: Colors.black)),
            Container(
              height: 30,
              child: VerticalDivider(
                thickness: 0.5,
                color: Colors.black,
              ),
            )
          ]),
          Row(children: [
            Container(
              width: 40,
              height: 40,
              child: Lottie.asset('assets/lotti_files/discount.json'),
            ),
            SizedBox(
              width: 5,
            ),
            Text("Lowest \nprice", style: TextStyle(color: Colors.black)),
          ])
        ],
      ),
    );
  }

  Widget buildBestSellers() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Opacity(
                    opacity: 0.9,
                    child: Image.asset('assets/images/brownbg.jpg',
                        fit: BoxFit.fill))),
          ),
        ),
        Positioned(
          left: 20,
          top: 10,
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset(
                    'assets/images/kurta.jpg',
                  )),
            ],
          ),
        ),
        Positioned(
            bottom: 15,
            left: 15,
            child: Row(
              children: [
                Text("Jackets under",
                    style: GoogleFonts.aclonica(
                        color: Colors.white, fontSize: 12)),
                SizedBox(
                  width: 3,
                ),
                Text("₹1299",
                    style: GoogleFonts.aclonica(
                        color: Colors.white, fontSize: 17)),
              ],
            ))
      ],
    );
  }

  Widget buildCaursel() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade400.withOpacity(0.1),
          child: Column(
            children: [
              CarouselSlider.builder(
                carouselController: controller,
                itemCount: sampleImages.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  child: Image.asset(sampleImages[itemIndex]),
                ),
                options: CarouselOptions(
                    height: 300,
                    initialPage: 0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                        print(index);
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: buildIndicator(),
              )
            ],
          ),
        ),
        Positioned(
          right: 10,
          bottom: 60,
          child: Container(
            width: 120,
            height: 170,
            decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
                  child: Text(
                    "Casual Shoes",
                    style:
                        GoogleFonts.aclonica(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 1,
                      width: 60,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  height: 1,
                  width: 120,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 2,
                ),
                Column(
                  children: [
                    Container(
                      height: 1,
                      width: 60,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("STARTING",
                    style: GoogleFonts.aclonica(
                        fontSize: 10, color: Colors.white70)),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("₹", style: GoogleFonts.aclonica(color: Colors.white)),
                    Text("599",
                        style: GoogleFonts.aclonica(
                            fontSize: 25, color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 90,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      "shop now",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: sampleImages.length,
      effect: JumpingDotEffect(
          radius: 4.0,
          dotWidth: 10.0,
          dotHeight: 7.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          dotColor: Colors.black,
          activeDotColor: Colors.black),
    );
  }
}
