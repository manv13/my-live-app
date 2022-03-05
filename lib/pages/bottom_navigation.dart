import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:liveapp/pages/cart.dart';
import 'package:liveapp/pages/home_screen.dart';
import 'package:liveapp/pages/main_page.dart';
import 'package:liveapp/pages/my_profile.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: activeIndex == 4
          ? AppBar(
              elevation: 0,
              backgroundColor: ThemeColor().scafoldBackground,
              leading: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              title: Text("My Account",
                  style: GoogleFonts.aclonica(color: Colors.black)),
            )
          : null,
      backgroundColor: ThemeColor().scafoldBackground,
      body: activeIndex == 2
          ? HomeScreen()
          : activeIndex == 3
              ? CartPage()
              : activeIndex == 4
                  ? MyProfilePage()
                  : Container(),
      bottomNavigationBar: ConvexAppBar(
        height: 45,
        backgroundColor: ThemeColor().themeColor,
        items: [
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.shopping_bag, title: 'Cart'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: 2, //optional, default as 0
        onTap: (int index) => {
          if (index == 0)
            {print("index $index")}
          else if (index == 1)
            {print("index $index")}
          else if (index == 2)
            {
              this.setState(() {
                activeIndex = 2;
              })
            }
          else if (index == 3)
            {
              this.setState(() {
                activeIndex = 3;
              })
            }
          else if (index == 4)
            {
              this.setState(() {
                activeIndex = 4;
              })
            }
        },
      ),
    );
  }
}
