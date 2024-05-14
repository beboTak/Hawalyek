import 'package:firstapp/Base_screens/client/client_home_screen.dart';
import 'package:firstapp/additional/client/client_drawer.dart';
import 'package:flutter/material.dart';

import 'client_order_history_screen.dart';
import 'client_profile_screen.dart';
class ClientBaseScreen extends StatelessWidget {
  static const routeName = "client_base_screen";

  const ClientBaseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // عدد الصفحات
      child: Scaffold(
        drawer: const ClientHomeDrawer(),
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right:8.0),
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
            const ClientHomeScreen(),
            OrderHistoryScreen(),
            ProfileEditScreen(),
          ],
        ),
      ),
    );
  }
}