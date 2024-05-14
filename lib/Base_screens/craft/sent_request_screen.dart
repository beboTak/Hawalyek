import 'package:flutter/material.dart';

import '../../additional/craft/craft_drawer.dart';
class SentRequestScreen extends StatelessWidget {
  static const routeName = "request_screen";
  const SentRequestScreen({super.key});

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
                Text("حواليك",
                    style: TextStyle(color: Colors.black, fontSize: 23)),
                SizedBox(
                  width: 10,
                ),
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

      backgroundColor:const  Color(0xffa19bb8),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return MyCard();
              },
            ),
          ),
        ),
      ),
    );
  }
}
class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Adjust the width according to your needs
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Icon(Icons.person, size: 40, color: Colors.blue),
              ),
              Text(
                'أحمد محمد',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'أريد إصلاح غسالة من نوع زانوسي فالجيتالية لا تسحب الماء',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16), // Add spacing between text and buttons
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text('عرض الصورة'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffa19bb8), // Button color
                ),
              ),

              SizedBox(height: 16), // Add spacing between image and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    //height: 30, // Adjust the width according to your needs
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'رفض',
                        style: TextStyle(
                            color: Colors.white), // Set text color to white
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor:
                        Colors.red, // Set button background color to red
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(8.0), // Add border radius
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16), // Add spacing between buttons
                  Container(
                    width: 70,
                    // height: 50, // Adjust the width according to your needs
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'قبول',
                        style: TextStyle(
                            color: Colors.white), // Set text color to white
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors
                            .green, // Set button background color to green
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(8.0), // Add border radius
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

