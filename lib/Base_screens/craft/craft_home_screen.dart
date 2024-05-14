import 'package:firstapp/Base_screens/craft/user_contact_screen.dart';
import 'package:firstapp/additional/craft/craft_drawer.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/widgets/mycart_widget.dart';

class CraftHomeScreen extends StatefulWidget {
  static const routeName = "craft_home_screen";

  const CraftHomeScreen({super.key});
  @override
  _CraftHomeScreenState createState() => _CraftHomeScreenState();
}

class _CraftHomeScreenState extends State<CraftHomeScreen> {
  bool isMenuOpen = true;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: MyCardWidget(),
        );
  }
}
