import 'package:firstapp/additional/craft/craft_drawer.dart';
import 'package:flutter/material.dart';
import '../../widgets/contact_cart_widget.dart';
class UserContactScreen extends StatelessWidget {
  static const routeName = "user_contact_screen";
  const UserContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffa19bb8),
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
      //drawer: const CraftHomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return ContactCardWidget();
          },
        ),
      ),
    );
  }
}
