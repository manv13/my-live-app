import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:liveapp/pages/show_filter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterPage extends StatefulWidget {
  int filterValue = 0;
  int sizeValue = 0;

  int cutomerratingValue = 0;
  FilterPage(
      {Key? key,
      required this.filterValue,
      required this.sizeValue,
      required this.cutomerratingValue});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool switchValue = false;
  SfRangeValues _values = SfRangeValues(0.0, 1000.0);
  List<String> filtersList = [
    'Category',
    'Colors',
    'Brands',
    'Customer Ratings',
    'Discount',
    'Size',
    'Offers',
    'Availablity'
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.cutomerratingValue = 0;
                            widget.filterValue = 0;
                            widget.sizeValue = 0;
                          });
                        },
                        child: Text(
                          "Clear",
                          style: GoogleFonts.aclonica(
                              color: widget.filterValue > 0 ||
                                      widget.sizeValue > 0 ||
                                      widget.cutomerratingValue > 0
                                  ? Colors.black
                                  : Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white30,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "min price",
                                    style: GoogleFonts.aclonica(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                  Text(
                                    _values.start.toStringAsFixed(2).toString(),
                                    style: GoogleFonts.aclonica(
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "max price",
                                    style: GoogleFonts.aclonica(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                  Text(
                                    _values.end.toStringAsFixed(2).toString(),
                                    style: GoogleFonts.aclonica(
                                        color: Colors.black),
                                  )
                                ],
                              )
                            ]),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        SfRangeSlider(
                          min: 0.0,
                          max: 1000.0,
                          values: _values,
                          interval: 250,
                          showLabels: true,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (SfRangeValues values) {
                            setState(() {
                              _values = values;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: filtersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.white38,
                          width: screenWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (index == 5) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShowFilterPage(
                                                            index: index,
                                                          )));
                                            } else if (index == 1) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShowFilterPage(
                                                            index: index,
                                                          )));
                                            } else if (index == 3) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShowFilterPage(
                                                            index: index,
                                                          )));
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                filtersList[index],
                                                style: GoogleFonts.aclonica(),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              index == 1 &&
                                                      widget.filterValue > 0
                                                  ? buildNotification(
                                                      widget.filterValue
                                                          .toString(),
                                                    )
                                                  : index == 5 &&
                                                          widget.sizeValue > 0
                                                      ? buildNotification(
                                                          widget.sizeValue
                                                              .toString(),
                                                        )
                                                      : index == 3 &&
                                                              widget.cutomerratingValue >
                                                                  0
                                                          ? buildNotification(widget
                                                              .cutomerratingValue
                                                              .toString())
                                                          : index == 7
                                                              ? buildAvailablitySwitch()
                                                              : Container()
                                            ],
                                          ),
                                        ),
                                        index == 0
                                            ? Text(
                                                "Footwear",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 12),
                                              )
                                            : index == 2
                                                ? Text(
                                                    "Choose your favourite brand",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                  )
                                                : Container()
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                Divider(
                                  thickness: 0.2,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
              ],
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
                      Text("34567 Results",
                          style: GoogleFonts.aclonica(fontSize: 17)),
                      Container(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.06,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                            splashColor: Colors.white,
                            color: ThemeColor().themeColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text("Apply",
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

  Widget buildNotification(String value) {
    return Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ThemeColor().themeColor,
        ),
        child: Center(
            child: Text(
          value,
          style: TextStyle(
            color: Colors.white,
          ),
        )));
  }

  Widget buildAvailablitySwitch() {
    return Row(
      children: [
        Switch(
            activeColor: ThemeColor().themeColor,
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = !switchValue;
              });
            }),
        SizedBox(
          width: 5,
        ),
        switchValue
            ? Text(
                "include out of stock",
                style: GoogleFonts.aclonica(color: Colors.grey.shade500),
              )
            : Container()
      ],
    );
  }
}
