import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/auth/otp_varify.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:shimmer/shimmer.dart';

class SignINPage extends StatefulWidget {
  const SignINPage({Key? key}) : super(key: key);

  @override
  _SignINPageState createState() => _SignINPageState();
}

class _SignINPageState extends State<SignINPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();

  _login() async {
    if (_formKey.currentState!.validate()) {
      print("sent");
    }
  }

  _showToasts(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ThemeColor().themeColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor().scafoldBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 2,
                  color: Colors.white.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.black,
                          highlightColor: Colors.white.withOpacity(0.6),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontFamily: 'fantancy',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              buildLoginText(),
              SizedBox(
                height: 50,
              ),
              buildLoginCard(),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account? ",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  ),
                  Text("Sign Up",
                      style: GoogleFonts.aclonica(
                          fontSize: 15, color: ThemeColor().themeColor))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Card(
        elevation: 1,
        color: Colors.white.withOpacity(0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            _showToasts("Please provide phone number");
                            return '';
                          } else if (input.length != 10) {
                            _showToasts("Please provide valid phone number");
                            return '';
                          }
                        },
                        controller: phoneNumber,
                        keyboardType: TextInputType.phone,
                        cursorColor: ThemeColor().themeColor,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: ThemeColor().themeColor,
                            ),
                            hintText: "Enter your phone number")),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              // ignore: deprecated_member_use
              child: RaisedButton(
                  splashColor: Colors.white.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: ThemeColor().themeColor,
                  onPressed: () {
                    // _login();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OtpVerify()));
                  },
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "Request OTP",
                      style: GoogleFonts.aclonica(
                          color: Colors.white, fontSize: 12),
                    ),
                  ))),
            )
          ],
        ),
      ),
    );
  }

  Widget buildLoginText() {
    return Column(children: [
      Text(
        "Sign In",
        style: GoogleFonts.aclonica(
            fontSize: 32, color: Colors.black, fontWeight: FontWeight.w500),
      ),
      SizedBox(
        height: 10,
      ),
      Text("with you phone number",
          style: GoogleFonts.aclonica(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500))
    ]);
  }
}
