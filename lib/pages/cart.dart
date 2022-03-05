import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:lottie/lottie.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> images = [
    'assets/images/option2.jpg',
    'assets/images/option2.jpg',
    'assets/images/option2.jpg',
    'assets/images/option2.jpg',
    'assets/images/option2.jpg',
    'assets/images/option2.jpg',
    'assets/images/option2.jpg'
  ];

  List<int> quantityt = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < images.length; i++) {
      quantityt.add(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor().scafoldBackground,
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      Text("My Cart (${images.length})",
                          style: GoogleFonts.aclonica())
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                buildMessage(),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white30,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          width: screenWidth * 0.4,
                                          height: screenHeight * 0.2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 0.3,
                                                  color: Colors.black)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              images[index],
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                      SizedBox(
                                        height: screenHeight * 0.01,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Campus Men's Patrik \nRunning Shoes",
                                              style: GoogleFonts.aclonica()),
                                          SizedBox(
                                            height: screenHeight * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              Text("size: ",
                                                  style: GoogleFonts.aclonica(
                                                      color: Colors.grey)),
                                              Text(
                                                "8UK",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.01,
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
                                                  Text("499",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          letterSpacing: 0.3,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                children: [
                                                  Text("50% OFF",
                                                      style:
                                                          GoogleFonts.aclonica(
                                                              color: ThemeColor()
                                                                  .themeColor,
                                                              fontSize: 16)),
                                                ],
                                              )
                                            ],
                                          ),
                                          Text("MRP ₹999",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  decoration: TextDecoration
                                                      .lineThrough)),
                                          SizedBox(
                                            height: screenHeight * 0.01,
                                          ),
                                          Text("(inclusive of all taxes)",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 0.1,
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (quantityt[index] < 2) {
                                                    setState(() {
                                                      quantityt[index] = 1;
                                                    });
                                                  } else {
                                                    quantityt[index]--;
                                                  }
                                                });
                                              },
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Icon(Icons.remove),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              quantityt[index].toString(),
                                              style: GoogleFonts.aclonica(),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  quantityt[index]++;
                                                });
                                              },
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Icon(Icons.add),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              size: 16,
                                              color: Colors.grey.shade700,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text("remove",
                                                style: GoogleFonts.aclonica(
                                                  color: Colors.grey.shade700,
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Amount payable",
                                style: GoogleFonts.aclonica()),
                            Text("₹499",
                                style: GoogleFonts.aclonica(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                          ]),
                    ),
                    // ignore: deprecated_member_use
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, left: 40, right: 40, bottom: 10),
                      child: RaisedButton(
                        splashColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: ThemeColor().themeColor,
                        onPressed: () {},
                        child: Center(
                            child: Text(
                          "Continue to Buy",
                          style: GoogleFonts.aclonica(color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMessage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      color: ThemeColor().themeColor.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lotti_files/delivery.json',
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Text(
            "Your order is eligible for free delivery!",
            style: GoogleFonts.aclonica(color: Colors.green),
          )
        ],
      ),
    );
  }
}
