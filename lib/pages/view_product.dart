import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:liveapp/pages/cart.dart';

import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewproductPage extends StatefulWidget {
  int? index;
  List productImages;
  String producName;
  String productMrp;
  String discouuntprice;
  String rating;
  String category;

  ViewproductPage(
      {Key? key,
      this.index,
      required this.productImages,
      required this.producName,
      required this.discouuntprice,
      required this.productMrp,
      required this.rating,
      required this.category});

  @override
  _ViewproductPageState createState() => _ViewproductPageState();
}

class _ViewproductPageState extends State<ViewproductPage> {
  ScrollController? _scrollController;
  String sizeValue = '';
  int selectedImg = 0;
  int selectedColor = 0;
  List relatedproducts = [];
  List<String> detailsTitle = [
    'Color',
    'Shoe Weight',
    'Price',
    'Company Name',
    'Company Name',
  ];
  List<String> detailssValues = [
    'White',
    'Light Weight',
    '499',
    'Shah impex',
    'Shah impex',
  ];
  List<Color> productColors = [
    Color(0xFF1B5E20),
    Color(0xFFD50000),
    Color(0xFF212121),
    Color(0xFF01579B),
  ];
  List<String> optionimage = [
    'assets/images/option2.jpg',
    'assets/images/option1.jpg',
    'assets/images/option3.jpg',
    'assets/images/option4.jpg'
  ];
  List<String> sizes = [];
  int? discount;

  fetchData() async {
    var temp = DefaultAssetBundle.of(context)
        .loadString('assets/loadjson/storedata.json');
    List newData = json.decode(await temp);
    for (int i = 0; i < newData.length; i++) {
      if (widget.category.toString().toLowerCase() ==
          newData[i]['category'].toString().toLowerCase()) {
        relatedproducts.add(newData[i]);
        print(relatedproducts);
      }
    }

    setState(() {});
  }

  _calculateDiscount() {
    discount =
        ((int.parse(widget.discouuntprice) / int.parse(widget.productMrp)) *
                100)
            .round();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    if (widget.category.toString().toLowerCase() ==
            "Clothes".toString().toLowerCase() ||
        widget.category.toString().toLowerCase() ==
            "Pants".toString().toLowerCase()) {
      setState(() {
        sizes.addAll(['S', 'M', 'L', 'XL']);
        sizeValue = sizes[0];
      });
    } else if (widget.category.toString().toLowerCase() ==
        "Shoes".toString().toLowerCase()) {
      setState(() {
        // sizes.addAll(['5UK', '6UK', '7UK', '8UK', '9UK']);
        sizes = ['5UK', '6UK', '7UK', '8UK', '9UK'];
        sizeValue = sizes[0];
      });
    } else {
      setState(() {
        sizes.addAll(['']);
      });
    }
    print(sizes);
    _calculateDiscount();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController!.offset >= 40) {
            // _showBackToTopButton = true; // show the back-to-top button
          } else {
            // _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController!.dispose(); // dispose the controller
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController!.animateTo(0,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ThemeColor().scafoldBackground,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(Icons.share),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Hero(
                      tag: "${widget.index}",
                      child: Image.asset(
                        widget.productImages[selectedImg],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  buildIndicator(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                          optionimage.length,
                          (index) =>
                              optionImage(index, widget.productImages[index]))
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(widget.producName,
                                style: GoogleFonts.aclonica()),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
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
                                Text(widget.discouuntprice,
                                    style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 0.3,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Column(
                              children: [
                                Text("₹${widget.productMrp}",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        decoration:
                                            TextDecoration.lineThrough)),
                              ],
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Column(
                              children: [
                                Text("$discount% OFF",
                                    style: GoogleFonts.aclonica(
                                        color: ThemeColor().themeColor,
                                        fontSize: 18)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Row(
                          children: [
                            Container(
                              width: screenWidth * 0.6,
                              height: screenHeight * 0.04,
                              decoration: BoxDecoration(
                                  color: ThemeColor().themeColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              child: Center(
                                  child: Text("True price, No hidden charges!",
                                      style: GoogleFonts.aclonica(
                                          color: Colors.white, fontSize: 12))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text("(inclusive of all taxes)",
                                style: GoogleFonts.aclonica(
                                    color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 18,
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
                                Text("${widget.rating} star",
                                    style: GoogleFonts.aclonica())
                              ],
                            ),
                            Container(
                                height: screenHeight * 0.03,
                                decoration: BoxDecoration(
                                    color: ThemeColor().themeColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: Center(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    "In stock",
                                    style: GoogleFonts.aclonica(
                                        color: Colors.white),
                                  ),
                                ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.05,
                    color: ThemeColor().themeColor.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lotti_files/delivery.json',
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Text(
                          "Free delivery on order above ₹400!",
                          style: GoogleFonts.aclonica(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Size : ", style: GoogleFonts.aclonica()),
                            buildSizedDropDown(),
                          ],
                        ),
                        buildSelectColor()
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          "Delivery in 6-10 days",
                          style: GoogleFonts.aclonica(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  buildReturnCard(),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  buildProductDetailsCard(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: detailsTitle.length > 4
                        ? Row(
                            children: [
                              Text(
                                "See more",
                                style: GoogleFonts.aclonica(color: Colors.blue),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.blue,
                                size: 13,
                              )
                            ],
                          )
                        : Container(),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.07,
                    color: Colors.grey.shade500.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        "Related Products :",
                        style: GoogleFonts.aclonica(fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: relatedproducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                print(index);
                                _scrollToTop();
                              },
                              child: buildRelatedPoductCard(
                                  index,
                                  relatedproducts[index]['main_image'],
                                  relatedproducts[index]['title'],
                                  relatedproducts[index]['mrp'],
                                  relatedproducts[index]['price'],
                                  relatedproducts[index]['rating']));
                        }),
                  ),
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.1,
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: screenWidth * 0.5,
                        height: screenHeight * 0.06,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: ThemeColor().themeColor),
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_cart,
                                      color: ThemeColor().themeColor),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("Add to Cart",
                                      style: GoogleFonts.aclonica(
                                          color: ThemeColor().themeColor)),
                                ],
                              ),
                            )),
                      ),
                      Container(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.06,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                            splashColor: Colors.white,
                            color: ThemeColor().themeColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text("Buy Now",
                                  style: GoogleFonts.aclonica(
                                    color: Colors.white,
                                  )),
                            )),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRelatedPoductCard(int index, String image, String title,
      String mrp, String disPrice, String rating) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          color: Colors.white12,
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: Colors.black)),
              child: Hero(
                tag: "image_1$index",
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 2,
                ),
                // Container(
                //   width: 80,
                //   height: 1,
                //   decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(10)),
                // )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewproductPage(
                                    productImages: [],
                                    producName: '',
                                    discouuntprice: '',
                                    productMrp: '',
                                    rating: '',
                                    category: '',
                                  )));
                    },
                    child: Text("Shoes for men",
                        style: GoogleFonts.aclonica(
                            color: Colors.grey.shade800,
                            fontSize: 13,
                            fontWeight: FontWeight.w200)),
                  ),
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
                        width: 3,
                      ),
                      Column(
                        children: [
                          Text(disPrice,
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
                          Text("₹$mrp",
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
                          Text("50% OFF",
                              style: GoogleFonts.aclonica(
                                  color: ThemeColor().themeColor,
                                  fontSize: 16)),
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
                  )
                ],
              ),
            )
          ]),
        ),
        Positioned(
          right: 20,
          top: 20,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Icon(Icons.favorite_border),
          ),
        )
      ],
    );
  }

  Widget optionImage(int i, String images) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedImg = i;
        });
      },
      child: Container(
          height: 40,
          width: 50,
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              border: selectedImg == i
                  ? Border.all(
                      style: BorderStyle.solid,
                      color: ThemeColor().themeColor,
                      width: 1.5)
                  : Border.all(
                      style: BorderStyle.solid, color: Colors.grey, width: 1.3),
              borderRadius: BorderRadius.circular(5)),
          child: Image.asset(
            widget.productImages[i],
            fit: BoxFit.fill,
          )),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: selectedImg,
      count: optionimage.length,
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

  Widget buildSizedDropDown() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.black)),
        child: Center(
          child: DropdownButton<String>(
            value: sizeValue,
            icon: const Icon(Icons.expand_more),
            iconSize: 24,
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                sizeValue = newValue!;
              });
            },
            items: sizes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ));
  }

  Widget buildSelectColor() {
    return Container(
      width: 150,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.black)),
      child: Center(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedColor = index;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.06,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedColor == index
                            ? productColors[index]
                            : productColors[index].withOpacity(0.5)),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget buildReturnCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.2,
      color: ThemeColor().scafoldBackground.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("We Offer", style: GoogleFonts.aclonica())],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.09,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Image.asset(
                          "assets/images/quality.png",
                          color: ThemeColor().themeColor,
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      "Great Quality \nat Best Price",
                      style: TextStyle(color: Colors.black),
                    )
                  ]),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.09,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Image.asset(
                          "assets/images/return.png",
                          color: ThemeColor().themeColor,
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      "7 Days Easy \nreturns",
                      style: TextStyle(color: Colors.black),
                    )
                  ]),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.09,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Image.asset(
                          "assets/images/payment.png",
                          color: ThemeColor().themeColor,
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      "100% payment \nProtection",
                      style: TextStyle(color: Colors.black),
                    )
                  ]),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }

  Widget buildProductDetailsCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text("Products Details",
                  style: GoogleFonts.aclonica(fontSize: 18)),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: detailsTitle.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 4),
                      child: Text(detailsTitle[index],
                          style: GoogleFonts.aclonica(
                              color: Colors.grey, fontSize: 13)),
                    );
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: detailssValues.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 4),
                      child: Text(': ${detailssValues[index]}',
                          style: GoogleFonts.aclonica(fontSize: 15)),
                    );
                  }),
            )
          ]),
        ],
      ),
    );
  }
}
