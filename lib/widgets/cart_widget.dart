import 'package:firstapp/Base_screens/craft/user_contact_screen.dart';
import 'package:flutter/material.dart';

import '../Base_screens/craft/missed_call_screen.dart';
import '../Base_screens/craft/sent_request_screen.dart';

class CardWidget extends StatelessWidget {
  final int index;
  final IconData icon;
  final String text;
  final Color color;

  const CardWidget({
    Key? key,
    required this.index,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        height: 160,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(icon, color: color),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
              ),
            ),
            ElevatedButton(
              onPressed: () {
               if(index ==0){
                 Navigator.of(context).pushNamed(UserContactScreen.routeName);
               }
               else if(index==1){
                 Navigator.of(context).pushNamed(SentRequestScreen.routeName);

               }
               else if(index==2){
                 Navigator.of(context).pushNamed(MissedCallScreen.routeName);
               }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xffa19bb8),
              ),
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget building(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}