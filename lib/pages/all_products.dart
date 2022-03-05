import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:liveapp/pages/filter.dart';
import 'package:liveapp/pages/home_screen.dart';
import 'package:liveapp/pages/view_product.dart';
import 'package:page_transition/page_transition.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts>
    with TickerProviderStateMixin {
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )..repeat(
  //     reverse: false,
  //   );
  // late final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.fastOutSlowIn,
  // );
  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }
  AnimationController? _controller;
  Animation<double>? _animation;

  // _showPopUp() {
  //   setState(() {
  //     if (disablePopUp == false) {
  //       showMore = true;
  //     }
  //   });
  //   _controller = AnimationController(
  //       duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
  //   _animation =
  //       CurvedAnimation(parent: _controller!, curve: Curves.bounceInOut);

  //   _controller!.forward();
  // }

  @override
  dispose() {
    _controller!.dispose();
    super.dispose();
  }

  bool disablePopUp = false;
  bool showSearch = false;
  int activeIndex = 0;
  bool showMore = false;
  TextEditingController _search = TextEditingController();
  String _searchTerm = '';
  bool switchlowtoHigh = false;
  bool switchhightoLow = false;
  List<String> images = [];
  List rowData = [];
  List displayData = [];
  List categoryData = [];
  var searchValue;

  searchProduct(value) {
    displayData.clear();
    if (value == "" || value == null) {
      for (int i = 0; i < newData.length; i++) {
        displayData.add(newData[i]);
      }
    } else {
      for (int i = 0; i < newData.length; i++) {
        if (newData[i]['title']
            .toString()
            .toLowerCase()
            .contains(value.toString().toLowerCase())) {
          displayData.add(newData[i]);
        }
      }
    }
    setState(() {});
  }

  List<String> categoryNames = [
    'All',
    'Shoes',
    'Clothes',
    'Pants',
    'Bag',
    'Watches',
    'Electronics',
    'kids',
    'Toys',
  ];
  // Future _priceHighToLow() async {
  //   print("price hight to low");

  //   String jsonString =
  //       await rootBundle.loadString("assets/loadjson/storedata.json");
  //   List jsonResponse = jsonDecode(jsonString);
  //   jsonResponse
  //       .sort((b, a) => int.parse(a['price']).compareTo(int.parse(b['price'])));
  // }

  // _priceLowToHigh() {
  //   print("price low to high");
  // }

  // _onStartScroll(ScrollMetrics metrics) {
  //   setState(() {
  //     showMore = false;
  //   });
  // }

  // _onUpdateScroll(ScrollMetrics metrics) {
  //   setState(() {
  //     showMore = false;
  //   });
  // }

  // _onEndScroll(ScrollMetrics metrics) async {
  //   await Future.delayed(const Duration(seconds: 3), () {
  //     _showPopUp();
  //   });
  // }

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  var newData;
  fetchData() async {
    var temp = DefaultAssetBundle.of(context)
        .loadString('assets/loadjson/storedata.json');
    newData = json.decode(await temp);
    for (int i = 0; i < newData.length; i++) {
      rowData.add(newData[i]);
      displayData.add(newData[i]);
      Product.product.add(newData[i]);
    }
    setState(() {});
  }

  _filterByCategory(value) async {
    setState(() {
      categoryData.clear();
    });

    var temp = DefaultAssetBundle.of(context)
        .loadString('assets/loadjson/storedata.json');
    newData = json.decode(await temp);

    if (value == "All" || activeIndex == 0) {
      setState(() {
        categoryData.addAll(newData);
      });
    } else {
      for (int i = 0; i < newData.length; i++) {
        if (newData[i]['category']
            .toString()
            .toLowerCase()
            .contains(value.toString().toLowerCase())) {
          setState(() {
            categoryData.add(newData[i]);
          });
        }
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor().scafoldBackground,
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: showSearch
                      ? buildSearchBar(context)
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(Icons.arrow_back)),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        showSearch = true;
                                      });
                                    },
                                    child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade400
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Icon(Icons.search))),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()));
                                    },
                                    child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade400
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Icon(Icons.home_outlined))),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade400
                                            .withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Icon(Icons.favorite_border)),
                                SizedBox(
                                  width: 10,
                                ),
                                Badge(
                                    badgeColor: ThemeColor().themeColor,
                                    badgeContent: Text(
                                      "2",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                    child: Icon(Icons.shopping_cart_outlined)),
                              ],
                            )
                          ],
                        ),
                ),
                SizedBox(
                  height: 50,
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height * 0.1,

                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  activeIndex = index;
                                });
                                _filterByCategory(categoryNames[index]);
                              },
                              child: buildChips(categoryNames[index], index)),
                        );
                      }),
                ),
                displayData.length == 0
                    ? Container(
                        child: Image.asset(
                          'assets/images/notfound.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: categoryData.isEmpty
                                ? displayData.length
                                : categoryData.length,
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                            ),
                            itemBuilder: (context, index) {
                              categoryData.isEmpty
                                  ? displayData
                                  : displayData = categoryData;
                              switchhightoLow
                                  ? displayData.sort((b, a) =>
                                      int.parse(a['price']) // accending order
                                          .compareTo(int.parse(b['price'])))
                                  // ignore: unnecessary_statements
                                  : displayData;
                              switchlowtoHigh
                                  ? displayData.sort((a, b) =>
                                      int.parse(a['price']) // decending order
                                          .compareTo(int.parse(b['price'])))
                                  // ignore: unnecessary_statements
                                  : displayData;

                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      images.clear();
                                      images.addAll([
                                        displayData[index]['main_image'],
                                        displayData[index]['option_image1'],
                                        displayData[index]['option_image2'],
                                        displayData[index]['option_image3']
                                      ]);
                                    });
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            duration:
                                                Duration(microseconds: 500),
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: ViewproductPage(
                                              index: index,
                                              productImages: images,
                                              producName: displayData[index]
                                                  ['title'],
                                              productMrp: displayData[index]
                                                  ['mrp'],
                                              discouuntprice: displayData[index]
                                                  ['price'],
                                              rating: displayData[index]
                                                  ['rating'],
                                              category: displayData[index]
                                                  ['category'],
                                            )));
                                  },
                                  child: buildPoductCard(
                                      index,
                                      displayData[index]['title'],
                                      displayData[index]['price'],
                                      displayData[index]['mrp'],
                                      displayData[index]['rating'],
                                      displayData[index]['main_image']));
                            }),
                      )

                // Expanded(
                //   child: NotificationListener<ScrollNotification>(
                //     // onNotification: (scrollNotification) {
                //     //   if (scrollNotification is ScrollStartNotification) {
                //     //     _onStartScroll(scrollNotification.metrics);
                //     //   } else if (scrollNotification
                //     //       is ScrollUpdateNotification) {
                //     //     _onUpdateScroll(scrollNotification.metrics);
                //     //   } else if (scrollNotification is ScrollEndNotification) {
                //     //     _onEndScroll(scrollNotification.metrics);
                //     //   }
                //     //   return true;
                //     // },
                //     child: FutureBuilder(
                //       future: DefaultAssetBundle.of(context)
                //           .loadString('assets/loadjson/storedata.json'),
                //       builder: (BuildContext context,
                //           AsyncSnapshot<String> snapshot) {
                //         List newData = json.decode(snapshot.data.toString());
                //         rowData = newData;
                //         switchhightoLow
                //             ? newData.sort((b, a) =>
                //                 int.parse(a['price']) // accending order
                //                     .compareTo(int.parse(b['price'])))
                //             // ignore: unnecessary_statements
                //             : newData;
                //         switchlowtoHigh
                //             ? newData.sort((a, b) =>
                //                 int.parse(a['price']) // decending order
                //                     .compareTo(int.parse(b['price'])))
                //             // ignore: unnecessary_statements
                //             : newData;

                //         return   },
                //     ),
                //   ),
                // )
              ],
            ),
            Positioned(
                bottom: 100,
                left: 100,
                child: showMore
                    ? ScaleTransition(
                        scale: _animation!,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: ThemeColor().themeColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_downward,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Explore more",
                                      style: GoogleFonts.aclonica(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  disablePopUp = true;
                                  showMore = false;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                size: 28,
                              ),
                            )
                          ],
                        ),
                      )
                    : Container()),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  color: Colors.white24,
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 10, left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Sort By:",
                                                  style:
                                                      GoogleFonts.aclonica()),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 0.3,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, bottom: 10, top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              // ignore: deprecated_member_use
                                              RaisedButton(
                                                  splashColor: Colors.white,
                                                  color: switchhightoLow ||
                                                          switchlowtoHigh
                                                      ? ThemeColor().themeColor
                                                      : Colors.grey,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  onPressed: () {
                                                    // switchhightoLow
                                                    //     ? _priceHighToLow()
                                                    //     : _priceLowToHigh();

                                                    Navigator.of(context).pop();
                                                    this.setState(() {});
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: Text("Apply",
                                                        style: GoogleFonts
                                                            .aclonica(
                                                          color: switchhightoLow ||
                                                                  switchlowtoHigh
                                                              ? Colors.white
                                                              : Colors.black,
                                                        )),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 5, right: 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Price low to high",
                                                      style: GoogleFonts.aclonica(
                                                          color: switchlowtoHigh
                                                              ? Colors.black
                                                              : Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Switch(
                                                        activeColor:
                                                            ThemeColor()
                                                                .themeColor,
                                                        value: switchlowtoHigh,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            if (switchhightoLow ==
                                                                false) {
                                                              switchlowtoHigh =
                                                                  !switchlowtoHigh;
                                                            }
                                                          });
                                                        })
                                                  ]),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Price high to low",
                                                      style: GoogleFonts.aclonica(
                                                          color: switchhightoLow
                                                              ? Colors.black
                                                              : Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Switch(
                                                        activeColor:
                                                            ThemeColor()
                                                                .themeColor,
                                                        value: switchhightoLow,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            if (switchlowtoHigh ==
                                                                false) {
                                                              switchhightoLow =
                                                                  !switchhightoLow;
                                                            }
                                                          });
                                                        })
                                                  ])
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.sort),
                          SizedBox(
                            width: 3,
                          ),
                          Text("Sort", style: GoogleFonts.aclonica())
                        ],
                      ),
                    ),
                    Container(
                      height: 25,
                      child:
                          VerticalDivider(thickness: 0.8, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                duration: Duration(milliseconds: 800),
                                child: FilterPage(
                                    filterValue: 0,
                                    sizeValue: 0,
                                    cutomerratingValue: 0)));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.filter),
                          SizedBox(
                            width: 3,
                          ),
                          Text("Filter", style: GoogleFonts.aclonica())
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar(cnxt) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(cnxt).size.width * 0.7,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              color: Colors.grey.shade400.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextFormField(
                cursorColor: ThemeColor().themeColor,
                controller: _search,
                decoration: InputDecoration(
                  focusColor: ThemeColor().themeColor,
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        showSearch = false;
                        _searchTerm = '';
                        activeIndex = 0;
                      });
                    },
                    child: Icon(
                      Icons.close,
                    ),
                  ),
                  hintText: "Search",
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            // // searchProduct("shoe");
            // var t = displayData;
            searchProduct(_search.text);
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: ThemeColor().themeColor),
            child: Center(child: Icon(Icons.search, color: Colors.white)),
          ),
        )
      ],
    );
  }

  Widget buildChips(String name, int i) {
    return Chip(
        backgroundColor: activeIndex == i
            ? ThemeColor().themeColor.withOpacity(0.9)
            : ThemeColor().scafoldBackground,
        label: Text(name,
            style: GoogleFonts.aclonica(
                color: activeIndex == i ? Colors.white : Colors.black,
                letterSpacing: 1,
                fontSize: 13)));
  }

  Widget buildPoductCard(int index, String title, String price,
      String diCountPrice, String rating, String image) {
    int discount = ((int.parse(price) / int.parse(diCountPrice)) * 100).round();

    return Stack(
      children: [
        Card(
          elevation: 0,
          color: Colors.white,
          child: Column(children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Hero(
                tag: "image_1$index",
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  width: 80,
                  height: 1,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.aclonica(
                          color: Colors.grey.shade800,
                          fontSize: 13,
                          fontWeight: FontWeight.w200)),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("₹"),
                        ],
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Column(
                        children: [
                          Text(price,
                              style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Column(
                        children: [
                          Text("₹$diCountPrice",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Column(
                        children: [
                          Text("$discount% OFF",
                              style: GoogleFonts.aclonica(
                                  color: ThemeColor().themeColor,
                                  fontSize: 14)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: MediaQuery.of(context).size.height * 0.03,
                        decoration: BoxDecoration(
                            color: ThemeColor().themeColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Icon(
                            Icons.star,
                            color: Colors.grey.shade300,
                            size: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text("$rating star", style: GoogleFonts.aclonica())
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            )
          ]),
        ),
        Positioned(
          right: 10,
          top: 20,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15)),
            child: Icon(Icons.favorite_border),
          ),
        )
      ],
    );
  }
}
