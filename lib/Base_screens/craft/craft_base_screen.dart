import 'package:firstapp/Base_screens/craft/craft_home_screen.dart';
import 'package:flutter/material.dart';

import '../../additional/craft/craft_drawer.dart';
import '../client/client_home_screen.dart';

import 'craft_exhibition_screen.dart';
import 'craft_order_screen.dart';
import 'craft_profile_screen.dart';
class CraftBaseScreen extends StatelessWidget {
  static const routeName = "craft_base_screen";
  const CraftBaseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3, // عدد الصفحات
        child: Scaffold(
          drawer: const CraftHomeDrawer(),
          appBar: AppBar(
            actions: const [
              Padding(
                padding: EdgeInsets.only(left:8.0),
                child: Row(
                  children: [
                    Text("حواليك",style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(child: Image(image: AssetImage("image/logo2.png",),))
                  ],
                ),
              )
            ],
            backgroundColor: const Color(0xff4c3f7a),
            bottom: const TabBar(

              tabs: [
                Tab(text: 'الصفحة الرئيسية'),
                Tab(text: 'سجل الطلبات'),
                Tab(text: 'الصفحة الشخصية'),


              ],
            ),
          ),
          body: TabBarView(
            children: [
              const CraftHomeScreen(),
              OrderScreen(),
              CraftProfileScreen(),

            ],
          ),
        ),
      ),
    );
  }
}
