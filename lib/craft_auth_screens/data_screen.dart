
import 'package:firstapp/craft_auth_screens/choose_craft.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  static const routeName="data_screen";
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
              // Handle back button press
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff4c3f7a),
                    ),
                    child: Image.asset(
                      'image/sign.png',
                      fit: BoxFit.contain,
                      height: 230,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25, // Set the radius of the circular image
                          backgroundImage:
                          AssetImage("image/logo2.png"), // URL of the image
                        ),
                        SizedBox(
                            width:
                            10), // Add some space between the image and text
                        Text(
                          'حواليك', // Text to display
                          style: TextStyle(
                              color: Color(0xff4c3f7a),
                              fontSize: 25), // Set the font size of the text
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff4c3f7a), // يمكنك تغيير لون الزر هنا
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // اضافة صورة شخصية
                          },
                          child: const Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff4c3f7a),

                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('تحميل صورة شخصية'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff4c3f7a), // يمكنك تغيير لون الزر هنا
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // اضافة صورة بطاقة الرقم القومى
                          },
                          child: const Icon(Icons.add),

                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4c3f7a),
                            foregroundColor: Colors.white

                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Text(' تحميل صورة البطاقة '),
                    ],
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.of(context).pushNamed(ChooseCraft.routeName);
                      // Handle sign-in logic
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff4c3f7a),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 125, vertical: 10),
                    ),
                    child: const Text('التالي'),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
