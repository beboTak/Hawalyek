import 'package:firstapp/client_auth_screens/customer_screen.dart';
import 'package:firstapp/craft_auth_screens/information_screen.dart';
import 'package:firstapp/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "register_screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _provider;
  @override
  void didChangeDependencies() {
    _provider = Provider.of<AuthProvider>(context,listen: true);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff4c3f7a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Center(child: Text('انشاء حساب',style: TextStyle(color: Colors.white),)),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset('image/logo2.png'),
          ),
        ],
      ),
      body: Container(
        width: _size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('image/register.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 140),
            InkWell(
              onTap: () {
                // Display the snackbar message
                // ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text("اخترت حرفي", textDirection: ui.TextDirection.rtl))
                // );
                 _provider.setUserKind("craft");
                // Navigate to the UserScreen
                Navigator.of(context).pushNamed(InformationScreen.routeName);
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xffa19bb8)),
                  height: 120,
                  width: 180,
                  padding: const EdgeInsets.all(20),
                  child: const Center(
                    child: Text(
                      "انا حرفي",
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                _provider.setUserKind("client");
                 Navigator.of(context).pushNamed(CustomerScreen.routeName);
                },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xff4c3f7a)),
                  height: 120,
                  width: 180,
                  padding: const EdgeInsets.all(20),

                  child: const Center(
                    child: Text(
                      "انا عميل",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}