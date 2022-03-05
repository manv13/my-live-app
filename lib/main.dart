import 'package:flutter/material.dart';
import 'package:liveapp/auth/otp_varify.dart';
import 'package:liveapp/auth/sign_in.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:liveapp/onboardingpages/Firstpage.dart';
import 'package:liveapp/pages/all_products.dart';
import 'package:liveapp/pages/cart.dart';
import 'package:liveapp/pages/filter.dart';
import 'package:liveapp/pages/home_screen.dart';
import 'package:liveapp/pages/main_page.dart';
import 'package:liveapp/pages/my_profile.dart';
import 'package:liveapp/pages/show_filter.dart';
import 'package:liveapp/pages/view_product.dart';
import 'package:liveapp/widgets/drawer.dart';

import 'pages/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: ThemeColor().themeColor),
        ),
        home: BottomNavigationPage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
