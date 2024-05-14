import 'package:firstapp/Base_screens/craft/craft_home_screen.dart';
import 'package:firstapp/Base_screens/craft/missed_call_screen.dart';
import 'package:flutter/material.dart';

import '../../Base_screens/craft/craft_base_screen.dart';
import '../../Base_screens/craft/craft_exhibition_screen.dart';
import '../../Base_screens/craft/craft_order_screen.dart';
import '../../Base_screens/craft/sent_request_screen.dart';
import '../../Base_screens/craft/user_contact_screen.dart';

class CraftHomeDrawer extends StatelessWidget {
  const CraftHomeDrawer({super.key});

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
              title: const Text('معرض حرفتى'),
              onTap: () {

                Navigator.of(context).pushNamed(CraftExhibitionScreen.routeName);
              },
            ),
            ExpansionTile(
              title: const Text('الإشعارات'),
              children: [
                ListTile(
                  title: const Text('تم قبولك بواسطة'),
                  onTap: () {
                    Navigator.of(context).pushNamed(UserContactScreen.routeName);
                    // Handle sub-item action
                  },
                ),
                ListTile(
                  title: const Text('الطلبات المرسلة'),
                  onTap: () {
                    Navigator.of(context).pushNamed(SentRequestScreen.routeName);
                    // Handle sub-item action
                  },
                ),
                ListTile(
                  title: const Text('تم الاتصال بك بواسطة'),
                  onTap: () {
                    Navigator.of(context).pushNamed(MissedCallScreen.routeName);
                    // Handle sub-item action
                  },
                ),
              ],
            ),
            ListTile(
              title: const Text('الدعم الفنى'),
              onTap: () {

                // Handle sub-item action
              },
            ),
            ListTile(
              title: const Text('عن التطبيق'),
              onTap: () {

                // Handle sub-item action
              },
            ),

            const Divider(height: 5,color: Colors.black,),
            ListTile(
              title: const Text('تسجيل الخروج'),
              onTap: () {

                // Handle sub-item action
              },
            ),
          ],
        ),
      ),
    );
  }
}
