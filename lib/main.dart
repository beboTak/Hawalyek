import 'package:firstapp/Base_screens/client/clint_request_screen.dart';
import 'package:firstapp/Base_screens/craft/sent_request_screen.dart';
import 'package:firstapp/Base_screens/craft/user_contact_screen.dart';
import 'package:firstapp/auth_screen/login_screen.dart';
import 'package:firstapp/client_auth_screens/client_validation_screen.dart';
import 'package:firstapp/client_auth_screens/customer_contact_screen.dart';
import 'package:firstapp/client_auth_screens/customer_location_screen.dart';
import 'package:firstapp/client_auth_screens/customer_screen.dart';
import 'package:firstapp/craft_auth_screens/contact_screen.dart';
import 'package:firstapp/craft_auth_screens/validation_code.dart';
import 'package:firstapp/Base_screens/craft/missed_call_screen.dart';
import 'package:firstapp/providers/auth_provider.dart';
import 'package:firstapp/providers/location_provider.dart';
import 'package:firstapp/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Base_screens/client/client_base_screen.dart';
import 'Base_screens/client/client_home_screen.dart';
import 'Base_screens/client/gallery_base_screen.dart';
import 'Base_screens/craft/craft_base_screen.dart';
import 'Base_screens/craft/craft_exhibition_screen.dart';
import 'Base_screens/craft/craft_home_screen.dart';
import 'Base_screens/craft/craft_order_screen.dart';
import 'client_auth_screens/image_profile_screen.dart';
import 'craft_auth_screens/choose_craft.dart';
import 'craft_auth_screens/data_screen.dart';
import 'craft_auth_screens/location_screen.dart';
import 'craft_auth_screens/locationc_screen.dart';
import 'auth_screen/signup_screen.dart';
import 'auth_screen/signin_screen.dart';
import 'craft_auth_screens/information_screen.dart';

void main() {
  runApp(const BaseScreen());
}

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
          ChangeNotifierProvider<LocationProvider>(create: (_) => LocationProvider()),

        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        //const LoginScreen(),
       // HomeScreen(),
        signinScreen(),
        routes: {
          LocationScreen.routeName:(ctx)=>const LocationScreen(),
          RegisterScreen.routeName:(ctx)=>const RegisterScreen(),
          InformationScreen.routeName:(ctx)=>InformationScreen(),
          LocationCScreen.routeName:(ctx)=> const LocationCScreen(),
          DataScreen.routeName:(ctx)=>const DataScreen(),
          ChooseCraft.routeName:(ctx)=> ChooseCraft(),
          ContactScreen.routeName:(ctx)=> ContactScreen(),
          CustomerScreen.routeName:(ctx)=> const CustomerScreen(),
          CustomerLocation.routeName:(ctx)=>const CustomerLocation(),
          CustomerContact.routeName:(ctx)=>const CustomerContact(),
          ValidationCode.routeName:(ctx)=>const ValidationCode(),
          signinScreen.routeName:(ctx)=>signinScreen(),
          LoginScreen.routeName:(ctx)=>const LoginScreen(),
          CustomerValidationCode.routeName:(ctx)=>const CustomerValidationCode(),
          CraftHomeScreen.routeName:(ctx)=>const CraftHomeScreen(),
          UserContactScreen.routeName:(ctx)=>const UserContactScreen(),
          MissedCallScreen.routeName:(ctx)=>const MissedCallScreen(),
          SentRequestScreen.routeName:(ctx)=>const SentRequestScreen(),
          ClientBaseScreen.routeName:(ctx)=> const ClientBaseScreen(),
          RequstNow.routeName:(ctx)=>const RequstNow(),
          OrderScreen.routeName:(ctx)=>OrderScreen(),
          CraftBaseScreen.routeName:(ctx)=>const CraftBaseScreen(),
          CraftExhibitionScreen.routeName:(ctx)=>const CraftExhibitionScreen(),
          GalleryBaseScreen.routeName:(ctx)=>GalleryBaseScreen(),
          ImageProfileScreen.routeName:(ctx)=>const ImageProfileScreen(),
        },

      ),
    );
  }
}

