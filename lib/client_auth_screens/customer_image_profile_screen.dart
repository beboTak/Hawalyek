import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'customer_location_screen.dart';
class ImageProfileScreen extends StatelessWidget {
  static const routeName = "customer_image_profile";
  const ImageProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context,listen: true);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
              // Handle back button press
            },
          ),
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff4c3f7a),
                  ),
                  child: Image.asset(
                    'image/sign.png',
                    fit: BoxFit.fill,
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
                        radius: 25,
                        backgroundImage: AssetImage("image/logo2.png"),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'حواليك',
                        style:
                        TextStyle(color: Color(0xff4c3f7a), fontSize: 25),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Display the profile picture if available
                if (userProvider.getTempProfilePicture() != null)
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.memory(
                        userProvider.getTempProfilePicture()! ,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    bool uploadSuccessful = await userProvider.loadProfilePicture();
                    userProvider.loadImage = uploadSuccessful;

                  },
                  child: const Text('تحميل الصورة الشخصية'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {

                    if (userProvider.loadImage) {
                      Navigator.of(context).pushNamed(
                        CustomerLocation.routeName,
                      );
                      // Handle successful upload

                    } else {
                      // Handle failed upload
                      print('Failed to upload profile picture');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff4c3f7a),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 125,
                      vertical: 10,
                    ),
                  ),
                  child: const Text('التالي'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
