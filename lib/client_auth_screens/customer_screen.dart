import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'dart:ui' as ui;
import 'customer_image_profile_screen.dart';

class CustomerScreen extends StatefulWidget {
  static const routeName = "customer_screen";
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  late UserProvider _Provider;
  late String _formattedDate;
  final TextEditingController _dateController = TextEditingController();
  final List<String> _genders = ['ذكر', 'أنثى'];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _formattedDate = '';
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (_picked != null) {
      TimeOfDay? _pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (_pickedTime != null) {
        DateTime dateTime = DateTime(
          _picked.year,
          _picked.month,
          _picked.day,
          _pickedTime.hour,
          _pickedTime.minute,
        );
        DateFormat dateFormat = DateFormat("M/d/yyyy hh:mm:ss a");
        setState(() {
          _formattedDate = dateFormat.format(dateTime);
          _dateController.text = _formattedDate;
        });
        _Provider.birthDate = _formattedDate; // Save the formatted date in the provider
      }
    }
  }

  bool _validateAndProceed() {

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    }
    if (_Provider.birthDate == null || _Provider.birthDate == " ") {
      return false;
    }
    return false;
  }

  @override
  void didChangeDependencies() {
    _Provider = Provider.of<UserProvider>(context);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: ui.TextDirection.rtl,
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
                            radius: 25,
                            backgroundImage: AssetImage("image/logo2.png"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'حواليك',
                            style: TextStyle(
                              color: Color(0xff4c3f7a),
                              fontSize: 25,
                            ),
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
                          hintText: 'ادخل الإسم الأول',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == " ") {
                            return 'الرجاء إدخال الإسم الأول';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _Provider.firstName = val!.trim().toString();
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
                          hintText: 'ادخل الإسم الاخير',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == " ") {
                            return 'الرجاء إدخال اسمك الاخير';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _Provider.lastName = val!.trim().toString();
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffe2dcdc),
                          hintText: 'ادخل تاريخ ميلادك',
                          prefixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                        keyboardType:
                            TextInputType.datetime, // تحديد نوع الإدخال
                        maxLines: 1, // الحفاظ على حجم الحقل
                        minLines: 1, // الحفاظ على حجم الحقل
                        validator: (value) {
                          if (_dateController.text.isEmpty || _dateController.text==" ") {
                            return 'الرجاء إدخال تاريخ ميلاد صالح';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _Provider.birthDate = _dateController.text.trim().toString();
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'النوع:',
                            style: TextStyle(
                              color: Color(0xff4c3f7a),
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: _genders.map((gender) {
                              return Row(
                                children: <Widget>[
                                  Radio(
                                    value: gender,
                                    groupValue: _genders[_Provider.gender],
                                    onChanged: (value) {
                                      if (value == 'ذكر') {
                                        _Provider.gender = 0;
                                      } else {
                                        _Provider.gender = 1;
                                      }
                                    },
                                  ),
                                  Text(gender),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        var done = _validateAndProceed();
                        if (done) {
                          Navigator.of(context).pushNamed(
                            ImageProfileScreen.routeName,
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                            "تاكد من ادخال بياناتك بشكل صحيح",
                            textDirection: ui.TextDirection.rtl,
                          )));
                        }

                        // Handle sign-in logic
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
        ),
      ),
    );
  }
}
