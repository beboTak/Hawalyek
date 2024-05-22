import 'dart:ui'; // Import the ui library

import 'package:firstapp/craft_auth_screens/location_screen.dart';
import 'package:flutter/material.dart';

class ValidationCode extends StatelessWidget {
  const ValidationCode({Key? key});
  static const routeName = 'craft_validation_code';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.grey),
          onPressed: () {
            Navigator.of(context).pop();
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(child: Image(image: AssetImage("image/logo2.png")),),
            onPressed: () {
              // Handle home icon press
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            "image/Verified.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX:4, sigmaY: 4), // Apply blur effect
            child: Container(
              color: Colors.transparent, // Make the container transparent
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return  Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                color: Colors.grey[200],
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    counterText: "",
                                  ),
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 8,),
                      Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: (){},
                          child: const Text(
                            "لم استلم رمز التحقق",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LocationScreen.routeName);
                  // Handle sign-in logic
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xff4c3f7a),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 125, vertical: 10),
    ),
                child: const Text('التالي'),
                ),
             ]
              ),



            ],

          ),

    );




  }
}
