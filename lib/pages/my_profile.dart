import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/auth/sign_in.dart';
import 'package:liveapp/constant/constant_data.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  List<String> accountList = [
    'Track My Order',
    'Rate Our app',
    'Change Language',
    'Terms Of Use',
    'Privacy Policy',
    'Terms Of Sales',
    'Trust Pay Policy',
    'Report Abuse & Takedown Policy',
    'Follow us on twitter',
    'Help Center'
  ];

  List<String> images = [
    'assets/images/location.png',
    'assets/images/rate.png',
    'assets/images/changelanguage.png',
    'assets/images/document.png',
    'assets/images/document.png',
    'assets/images/document.png',
    'assets/images/document.png',
    'assets/images/document.png',
    'assets/images/twitter.png',
    'assets/images/help.png'
  ];
  List<Color> iconColors = [
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.blue,
    Colors.red
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.white12),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Row(
                children: [
                  Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/defaultprofile.png'),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome!",
                          style: GoogleFonts.aclonica(
                              color: Colors.grey.shade800, fontSize: 18)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignINPage()));
                        },
                        child: Text("Login/SignUp!",
                            style: GoogleFonts.aclonica(
                                color: Colors.grey, fontSize: 12)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: accountList.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildCard(
                      accountList[index], images[index], iconColors[index]);
                }),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01)
      ],
    );
  }

  Widget buildCard(String titles, String image, Color iconColors) {
    return Card(
      elevation: 0,
      color: Colors.white12,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      image,
                      color: iconColors,
                    )),
                SizedBox(
                  width: 5,
                ),
                Text(
                  titles,
                  style: GoogleFonts.aclonica(),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
