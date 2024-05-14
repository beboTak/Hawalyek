import 'package:flutter/material.dart';
import 'data_screen.dart';

class LocationCScreen extends StatelessWidget {
  static const routeName = "location_complete_screen";

  const LocationCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
              // Handle back button press
            },
          ),
          backgroundColor: Colors.white,
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
                          radius: 25,
                          backgroundImage: AssetImage("image/logo2.png"),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'حواليك',
                          style: TextStyle(
                            color: Color(0xff4c3f7a),
                            fontSize: 25,
                          ),
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
                        hintText: 'ادخل اسم الشارع',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(DataScreen.routeName);
                      // Handle sign-in logic
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff4c3f7a),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 125,
                        vertical: 10,
                      ),
                    ),
                    child: const Text('التالي'),
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