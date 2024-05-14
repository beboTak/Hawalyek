import 'package:firstapp/Base_screens/craft/user_contact_screen.dart';
import 'package:flutter/material.dart';
import 'cart_widget.dart';
class MyCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffa19bb8),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CardWidget(
              index: 0,
              icon: Icons.check_circle,
              text: 'نم قبولك بواسطة',
              color: Colors.green,
            ),

            CardWidget(
              index: 1,
              icon: Icons.send,
              text: 'الطلبات المرسلة',
              color: Colors.blue,
            ),

            CardWidget(
              index: 2,
              icon: Icons.phone_callback,
              text: 'تم الإتصال بك بواسطة',
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}