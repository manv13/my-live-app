import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/auth/sign_in.dart';
import 'package:liveapp/constant/constant_data.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify({Key? key}) : super(key: key);

  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor().scafoldBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    "OTP",
                    style: TextStyle(
                        fontFamily: 'fantancy',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Lottie.asset(
                  'assets/lotti_files/otp2.json',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Verification Code",
                    style: GoogleFonts.aclonica(
                        fontSize: 22, color: Colors.black, letterSpacing: 1))
              ]),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 3,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("We have sent verification code to phone number",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.6,
                          fontSize: 15)),
                  SizedBox(height: 3),
                  Text("mentioned below",
                      style: TextStyle(
                          letterSpacing: 0.6,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w500,
                          fontSize: 15)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("+91 1010101010",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18)),
                  SizedBox(
                    width: 15,
                  ),
                  buildEditNumber()
                ],
              ),
              SizedBox(
                height: 20,
              ),
              buildOtpTextFields(),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                // ignore: deprecated_member_use
                child: RaisedButton(
                    splashColor: Colors.white.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: ThemeColor().themeColor,
                    onPressed: () {},
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "verify",
                        style: GoogleFonts.aclonica(
                            color: Colors.white, fontSize: 15),
                      ),
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditNumber() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignINPage()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: ThemeColor().themeColor.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }

  Widget buildOtpTextFields() {
    return OTPTextField(
      keyboardType: TextInputType.number,
      outlineBorderRadius: 15,
      length: 4,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 60,
      style: TextStyle(
        fontSize: 17,
        color: Colors.black,
      ),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }
}
