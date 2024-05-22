import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import '../Back_end/back_service.dart';
import '../providers/craft_provider.dart';
import '../providers/location_provider.dart';
import 'caftmen_image_profile_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);
  static const routeName = "craft_location_Screen";

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController streetController = TextEditingController();

  var _Provider;
  var _LocProvider;
  bool checkData(String gov, String city, String street) {

    if (gov.isEmpty || gov == " ") {

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "الرجاء قم باختيار محافظتك",
            textDirection: ui.TextDirection.rtl,
          )));
      return false;
    }

    if (city.isEmpty || city == " ") {

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "الرجاء قم باختيار مدينتك",
            textDirection: ui.TextDirection.rtl,
          )));
      return false;
    }

    if (street.isEmpty || street == " ") {

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "الرجاء قم بادخال اسم الشارع",
            textDirection: ui.TextDirection.rtl,
          )));
      return false;
    }
    _Provider.street = street;
    return true;
  }

  @override
  void didChangeDependencies() {
    _Provider = Provider.of<CraftProvider>(context, listen: true);
    _LocProvider = Provider.of<LocationProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  final _backendService = BackendService();
  List<String> governorates = [];
  List<String> cities = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      governorates = await _backendService.getGovernorates();
      _LocProvider.governorates = governorates;
      _LocProvider.initialGov = governorates[0];
      print("in initial location "+governorates[0]);
      cities = await _backendService.getCities(governorates[0]);
      print("in initial location "+cities[0]);
      _LocProvider.initialCity = cities[0];
      _LocProvider.cities = cities;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading governorates: $e')));
      print('Error loading governorates: $e');
    }
  }

  @override
  void dispose() {
    streetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            },
          ),
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.topRight,
                    child: const Text(
                      'اختار محافظتك:',
                      style: TextStyle(fontSize: 22),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: _LocProvider.initialGov,
                        style: const TextStyle(color: Colors.black,fontSize: 18),
                        alignment: Alignment.topRight,
                        isExpanded: true,
                        underline: null, // Remove the underline
                        items: _LocProvider.governorates
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) async {
                          try {
                            _Provider.governorate = newValue;
                            _LocProvider.initialGov=newValue;
                            cities = await _backendService.getCities(newValue!);
                            _LocProvider.cities = cities;
                            _LocProvider.initialCity=cities[0];
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Error loading cities: $e')));

                          }
                        },
                        // dropdownColor: const Color(0xff4c3f7a),
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.topRight,
                    child: const Text(
                      'اختار مدينتك:',
                      style: TextStyle(fontSize: 22),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        style: const TextStyle(color: Colors.black,fontSize: 18),
                        value: _LocProvider.initialCity,
                        isExpanded: true,
                        underline: null, // Remove the underline
                        items: _LocProvider.cities
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) async {
                          try {
                            _LocProvider.initialCity=newValue;
                            _Provider.city = newValue;

                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Error loading cities: $e')));
                            print('Error loading cities: $e');
                          }
                        },

                        // dropdownColor: const Color(0xff4c3f7a),
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: TextField(
                      controller: streetController,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe2dcdc),
                        hintText: 'ادخل اسم الشارع',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {

                      var done = checkData(
                          _Provider.governorate,
                          _Provider.city,
                          streetController.text.trim().toString());
                      if (done) {
                        Navigator.of(context)
                            .pushNamed(CraftImageProfile.routeName);
                      }
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