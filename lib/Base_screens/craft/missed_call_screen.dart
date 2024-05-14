import 'package:flutter/material.dart';

import '../../additional/craft/craft_drawer.dart';

class MissedCallScreen extends StatelessWidget {
  static const routeName = "missed_call_screen";

  const MissedCallScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),

        actions: const [

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("حواليك", style: TextStyle(color: Colors.black,fontSize: 23)) ,
                SizedBox(width: 10,),
                CircleAvatar(
                  child: Image(
                    image: AssetImage("image/logo2.png"),
                  ),
                ),
                // Text("حواليك", style: TextStyle(color: Colors.black)) ,
              ],
            ),
          ),


        ],
      ),
     // drawer: const CraftHomeDrawer(),
      backgroundColor: Color(0xffa19bb8),
      body: ListView(
        padding: const EdgeInsets.all(25.0),
        children: <Widget>[
          buildCard('أحمد محمد', 'منذ نشره من القائمين\n2000-05-05', context),
          buildCard('محمد أحمد', 'منذ نشره من القائمين\n2000-05-05', context),
          buildCard('علي أحمد', 'منذ نشره من القائمين\n2000-05-05', context),
          buildCard('علي أحمد', 'منذ نشره من القائمين\n2000-05-05', context),
        ],
      ),
    );
  }

  Widget buildCard(String name, String description, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 200,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 20.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.phone_callback_outlined, color: Colors.red, size: 24.0),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(description),
            ElevatedButton.icon(
              onPressed: () {
                // اكتب الإجراء عند الضغط على الزر
              },
              icon: Icon(Icons.call),
              label: Text('الاتصال الآن'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffa19bb8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('إبلاغ'),
                      content: TextField(
                        decoration: InputDecoration(
                          labelText: 'اكتب شكواك هنا',
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            // اكتب الإجراء عند الضغط على زر الإرسال
                            Navigator.of(context).pop();
                          },
                          child: Text('إرسال'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.warning, color: Colors.red),
              tooltip: 'إبلاغ',
            ),
          ],
        ),
      ),
    );
  }
}