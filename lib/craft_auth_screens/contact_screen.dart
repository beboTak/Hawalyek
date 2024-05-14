import 'package:firstapp/auth_screen/signin_screen.dart';

import 'package:firstapp/craft_auth_screens/information_screen.dart';
import 'package:flutter/material.dart';
import '../auth_screen/login_screen.dart';
import 'data_screen.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = "contact_screen";
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff4c3f7a),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
              // Handle back button press
            },
          ),
          elevation: 0,
        ),
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
                      color: Color(0xff4c3f7a),
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
                              color: Color(0xff4c3f7a),
                              fontSize: 25), // Set the font size of the text
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe2dcdc),
                        hintText: 'ادخل كلمة السر',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe2dcdc),
                        hintText: 'تأكيد كلمة السر',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 46.0),
                    child: Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        style: ButtonStyle(alignment: Alignment.topRight),
                        onPressed: () {},
                        child: const Text(
                          "عرض كلمة المرور",
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                      // Handle sign-in logic
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff4c3f7a),
                      shape: const StadiumBorder(),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 125, vertical: 10),
                    ),
                    child: const Text('انشاء'),
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