import 'package:firstapp/Back_end/back_service.dart';
import 'package:firstapp/models/user_model.dart';
import 'package:firstapp/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth_screen/login_screen.dart';
import '../auth_screen/signin_screen.dart';
import 'client_validation_screen.dart';

class CustomerContact extends StatefulWidget {
  const CustomerContact({super.key});
  static const routeName = 'customer_contact_screen';

  @override
  State<CustomerContact> createState() => _CustomerContactState();
}

class _CustomerContactState extends State<CustomerContact> {
  var _Provider;
  UserProfile? _user;
  final BackendService _backendService = BackendService();
  final _formKey = GlobalKey<FormState>();

  bool _validateAndProceed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    }
    return false;
  }

  @override
  void didChangeDependencies() {
    _Provider = Provider.of<UserProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var _Provider = Provider.of<UserProvider>(context, listen: true);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
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
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                            backgroundImage: AssetImage(
                                "image/logo2.png"), // URL of the image
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffe2dcdc),
                          hintText: 'ادخل اسم المستخدم',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty || value == " ") {
                            return 'الرجاء إدخال اسم المستخدم';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _Provider.userName = val!.trim().toString();
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffe2dcdc),
                          hintText: 'ادخل رقم الهاتف',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 11) {
                            return 'الرجاء إدخل رقم الهاتف صحيح';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _Provider.phoneNumber = val!.trim().toString();
                          print(_Provider.phoneNumber);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        obscureText: _Provider.showPassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffe2dcdc),
                          hintText: 'ادخل كلمة المرور',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value == " " ||
                              value.length < 6) {
                            return 'الرجاء إدخال كلمة مرور قوية';
                          }
                          _Provider.password = value.trim().toString();
                          return null;
                        },
                        onSaved: (val) {
                          _Provider.password = val!.trim().toString();
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        obscureText: _Provider.showPassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffe2dcdc),
                          hintText: 'تأكيد كلمة المرور',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          print(_Provider.password);

                          if (value!.trim().toString() != _Provider.password) {
                            return 'كلمة مرور غير متطابقة';
                          }
                          _Provider.passwordConfirmed = value.trim().toString();
                          return null;
                        },
                        onSaved: (val) {
                          _Provider.passwordConfirmed = val!.trim().toString();
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(right: 46.0),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          style:
                              const ButtonStyle(alignment: Alignment.topRight),
                          onPressed: () {
                            _Provider.showPassword = !(_Provider.showPassword);
                          },
                          child: const Text(
                            "عرض كلمة المرور",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        var done = _validateAndProceed();
                        if (done) {
                          _user = UserProfile(
                              firstName: _Provider.firstName,
                              lastName: _Provider.lastName,
                              userName: _Provider.userName,
                              gender: _Provider.gender,
                              phoneNumber: _Provider.phoneNumber,
                              governorate: _Provider.governorate,
                              city: _Provider.city,
                              street: _Provider.street,
                              password: _Provider.password,
                              passwordConfirmed: _Provider.passwordConfirmed,
                              birthDate: _Provider.birthDate,
                              profilePic: _Provider.getTempProfilePicture());
                          var done = await _backendService.registerUser(_user!);
                          if (done) {
                            Navigator.of(context)
                                .pushNamed(CustomerValidationCode.routeName);
                          }


                          // Navigator.of(context).pushNamed(LoginScreen.routeName);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff4c3f7a),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 125, vertical: 10),
                      ),
                      child: const Text('انشاء'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
