import 'package:firstapp/auth_screen/signup_screen.dart';
import 'package:firstapp/craft_auth_screens/location_screen.dart';
import 'package:flutter/material.dart';

class signinScreen extends StatelessWidget {

  static const routeName ="signin_screen";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff4c3f7a),
                    ),
                    child: Image.asset(
                      'image/sign.png',
                      fit: BoxFit.contain,
                      height: 230,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25, // Set the radius of the circular image
                          backgroundImage:
                          AssetImage("image/logo2.png"), // URL of the image
                        ),
                        SizedBox(
                            width:
                            10), // Add some space between the image and text
                        Text(
                          'حواليك', // Text to display
                          style: TextStyle(
                              color: Color(0xff362639),
                              fontSize: 25), // Set the font size of the text
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe2dcdc),
                        hintText: 'ادخل رقم الهاتف',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe2dcdc),
                        hintText: 'ادخل كلمة السر',
                        prefixIcon: const Icon(Icons.lock),

                        border: OutlineInputBorder(
                          //30
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {

                   // Handle forgot password logic
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 35.0),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: const Text(
                          'هل نسيت كلمة السر؟',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle sign-in logic
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: const Color(0xff4c3f7a),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 125, vertical: 10),
                    ),
                    child: const Text('تسجيل الدخول'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);// Handle sign-in logic
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xff4c3f7a),
                      backgroundColor: Colors.white,//Color(0xff4c3f7a),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 125, vertical: 10),
                    ),
                    child: const Text('انشاء حساب'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
