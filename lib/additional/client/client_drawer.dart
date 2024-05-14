import 'package:firstapp/Base_screens/craft/craft_home_screen.dart';
import 'package:firstapp/Base_screens/craft/missed_call_screen.dart';
import 'package:flutter/material.dart';

import '../../Base_screens/craft/sent_request_screen.dart';
import '../../Base_screens/craft/user_contact_screen.dart';
import '../../auth_screen/login_screen.dart';

class ClientHomeDrawer extends StatelessWidget {
  const ClientHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        shadowColor: const Color(0xff4c3f7a),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff4c3f7a),
              ),
              child: Text(
                'حواليك',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('الدعم الفني'),
              onTap: () {
                 },
            ),
            ListTile(
              title: const Text(' عن التطبيق '),
              onTap: () {
                // Handle main item action
              },
            ),
            Divider(color: Colors.black,height: 5),


            ListTile(
              title: const Text('تسجيل الخروج'),
              onTap: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
                // Handle sub-item action
              },
            ),
          ],
        ),
      ),
    );
  }
}
