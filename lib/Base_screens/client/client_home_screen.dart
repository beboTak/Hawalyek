import 'package:firstapp/Base_screens/client/clint_request_screen.dart';
import 'package:flutter/material.dart';

import 'gallery_base_screen.dart';



class ClientHomeScreen extends StatelessWidget {
  static const routeName = "client_home_screen";
  const ClientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffa19bb8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(
                index: 0,
                onPressed: () {
                 Navigator.of(context).pushNamed(RequstNow.routeName);
                },
                icon: const Icon(Icons.send),
                text: 'اطلب الأن',
                iconColor: Colors.blue,
              ),
              CustomCard(
                index: 1,
                onPressed: () {
                  Navigator.of(context).pushNamed(GalleryBaseScreen.routeName);
                },
                icon: const Icon(Icons.search),
                text: 'تصفح الحرف واطلب وقت ما تريد',
                iconColor: const Color(0xff8c8a8a),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final int index;
  final VoidCallback onPressed; // استخدام VoidCallback للنقر
  final Icon icon;
  final String text;
  final Color iconColor;

  const CustomCard({
    Key? key,
    required this.index,
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed, // النقر يتم تمريره هنا
        child: Container(
          width: 210,
          height: 160,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                color: iconColor,
                onPressed: onPressed, // وهنا أيضًا
                icon: icon,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}