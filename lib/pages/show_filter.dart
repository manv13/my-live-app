import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:liveapp/pages/filter.dart';

class ShowFilterPage extends StatefulWidget {
  int index = 0;
  ShowFilterPage({Key? key, required this.index});

  @override
  _ShowFilterPageState createState() => _ShowFilterPageState();
}

class _ShowFilterPageState extends State<ShowFilterPage> {
  String searchTerm = '';
  int selectedColor = 0;
  List<Color> colors = [
    Colors.black,
    Colors.yellow,
    Colors.red,
    Colors.white30,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.orange
  ];
  List<String> colorNames = [
    "Black",
    "Yellow",
    "Red",
    "White",
    "Green",
    "Blue",
    "Pink",
    "Orange"
  ];

  List<bool> checkBox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return widget.index == 5
        ? SizeFilter()
        : widget.index == 3
            ? CustomerRatingFilter()
            : SafeArea(
                child: Scaffold(
                  backgroundColor: ThemeColor().scafoldBackground,
                  body: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(Icons.arrow_back)),
                                  Text('Selected ($selectedColor)',
                                      style: GoogleFonts.aclonica())
                                ]),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey.shade400.withOpacity(0.2)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: TextFormField(
                                    cursorColor: ThemeColor().themeColor,
                                    onChanged: (value) {
                                      setState(() {
                                        searchTerm = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      focusColor: ThemeColor().themeColor,
                                      border: InputBorder.none,
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          // setState(() {
                                          //   showSearch = false;
                                          // });
                                          print(searchTerm);
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
                            Expanded(
                              child: ListView.builder(
                                  itemCount: colors.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: colorNames[index]
                                              .toString()
                                              .toLowerCase()
                                              .contains(
                                                  searchTerm.toLowerCase())
                                          ? Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 60,
                                              color: Colors.white30,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: colors[
                                                                      index],
                                                                  shape: BoxShape
                                                                      .circle),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(colorNames[index],
                                                            style: GoogleFonts
                                                                .aclonica())
                                                      ],
                                                    ),
                                                    Checkbox(
                                                        activeColor:
                                                            ThemeColor()
                                                                .themeColor,
                                                        value: checkBox[index],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            checkBox[index] =
                                                                !checkBox[
                                                                    index];
                                                            selectedColor = checkBox
                                                                .where((item) =>
                                                                    item ==
                                                                    true)
                                                                .length;
                                                          });
                                                        })
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    );
                                  }),
                            ),
                            SizedBox(height: screenHeight * 0.1)
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
                                              width: 1,
                                              color: ThemeColor().themeColor),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FilterPage(
                                                      filterValue: 0,
                                                      sizeValue: 0,
                                                      cutomerratingValue: 0,
                                                    )));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1, vertical: 5),
                                        child: Text("Cancel",
                                            style: GoogleFonts.aclonica(
                                                color:
                                                    ThemeColor().themeColor)),
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
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FilterPage(
                                                      filterValue:
                                                          selectedColor,
                                                      sizeValue: 0,
                                                      cutomerratingValue: 0,
                                                    )));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text("Done",
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
}

class SizeFilter extends StatefulWidget {
  const SizeFilter({Key? key}) : super(key: key);

  @override
  _SizeFilterState createState() => _SizeFilterState();
}

class _SizeFilterState extends State<SizeFilter> {
  int selectedSize = 0;
  List<String> sizeNames = [
    "2XL",
    "2XS",
    "3XL",
    "4XL",
    "5XL",
    "6XL",
    "7XL",
    "Free",
    "L",
    "M",
    "S",
    "XL",
    "XS"
  ];
  List<bool> checkBox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor().scafoldBackground,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back)),
                        Text('Selected ($selectedSize)',
                            style: GoogleFonts.aclonica())
                      ]),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: sizeNames.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                color: Colors.white30,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(sizeNames[index],
                                              style: GoogleFonts.aclonica())
                                        ],
                                      ),
                                      Checkbox(
                                          activeColor: ThemeColor().themeColor,
                                          value: checkBox[index],
                                          onChanged: (value) {
                                            setState(() {
                                              checkBox[index] =
                                                  !checkBox[index];
                                              selectedSize = checkBox
                                                  .where((item) => item == true)
                                                  .length;
                                            });
                                          })
                                    ],
                                  ),
                                ),
                              ));
                        }),
                  ),
                  SizedBox(height: screenHeight * 0.1)
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
                                      builder: (context) => FilterPage(
                                            filterValue: 0,
                                            sizeValue: 0,
                                            cutomerratingValue: 0,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 5),
                              child: Text("Cancel",
                                  style: GoogleFonts.aclonica(
                                      color: ThemeColor().themeColor)),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FilterPage(
                                            sizeValue: selectedSize,
                                            filterValue: 0,
                                            cutomerratingValue: 0,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text("Done",
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
}

class CustomerRatingFilter extends StatefulWidget {
  const CustomerRatingFilter({Key? key}) : super(key: key);

  @override
  _CustomerRatingFilterState createState() => _CustomerRatingFilterState();
}

class _CustomerRatingFilterState extends State<CustomerRatingFilter> {
  int selectedRating = 0;
  List<String> titles = [
    '4 star & above',
    '3 star & above',
    '2 star & above',
    '1 star & above'
  ];

  List<bool> checkBoxes = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor().scafoldBackground,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back)),
                        Text('Selected ($selectedRating)',
                            style: GoogleFonts.aclonica())
                      ]),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: titles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                color: Colors.white30,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(titles[index],
                                              style: GoogleFonts.aclonica())
                                        ],
                                      ),
                                      Checkbox(
                                          activeColor: ThemeColor().themeColor,
                                          value: checkBoxes[index],
                                          onChanged: (value) {
                                            setState(() {
                                              checkBoxes[index] =
                                                  !checkBoxes[index];
                                              selectedRating = checkBoxes
                                                  .where((item) => item == true)
                                                  .length;
                                            });
                                          })
                                    ],
                                  ),
                                ),
                              ));
                        }),
                  ),
                  SizedBox(height: screenHeight * 0.1)
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
                                      builder: (context) => FilterPage(
                                            filterValue: 0,
                                            sizeValue: 0,
                                            cutomerratingValue: 0,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 5),
                              child: Text("Cancel",
                                  style: GoogleFonts.aclonica(
                                      color: ThemeColor().themeColor)),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FilterPage(
                                          sizeValue: 0,
                                          filterValue: 0,
                                          cutomerratingValue: selectedRating)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text("Done",
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
}
