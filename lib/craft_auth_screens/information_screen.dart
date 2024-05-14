import 'package:firstapp/craft_auth_screens/validation_code.dart';
import 'package:flutter/material.dart';

import 'location_screen.dart';

class InformationScreen extends StatefulWidget {
  static const routeName = "user_screen";

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  String _selectedGender = 'ذكر';
  List<String> _genders = ['ذكر', 'أنثى'];

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
                          radius: 25,
                          backgroundImage:
                          AssetImage("image/logo2.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
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
                        hintText: 'ادخل الإسم الأول',
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe2dcdc),
                        hintText: 'ادخل الإسم الثاني',
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe2dcdc),
                        hintText: 'ادخل سنة الميلاد',
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe2dcdc),
                        hintText: 'ادخل رقم الهاتف',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'النوع:',
                          style: TextStyle(
                            color: Color(0xff4c3f7a),
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: _genders.map((gender) {
                            return Row(
                              children: <Widget>[
                                Radio(
                                  value: gender,
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value as String;
                                    });
                                  },
                                ),
                                Text(gender),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        ValidationCode.routeName,
                      );
                      // Handle sign-in logic
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff4c3f7a),
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