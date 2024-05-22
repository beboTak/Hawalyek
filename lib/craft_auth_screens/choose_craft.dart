import 'package:firstapp/craft_auth_screens/craft_result_screen.dart';
import 'package:firstapp/providers/craft_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../Back_end/back_service.dart';

class ChooseCraft extends StatefulWidget {
  static const routeName = 'choose_craft';

  @override
  _ChooseCraftState createState() => _ChooseCraftState();
}

class _ChooseCraftState extends State<ChooseCraft> {
  var _CraftsProvider;
  final _backendService = BackendService();
  List<String> crafts =[] ;
  Future<void> _loadCraftsData() async {

    try {
      crafts = await _backendService.getCraftsNames();
      _CraftsProvider.crafts = crafts;
      _CraftsProvider.craftName= crafts[0];
      print("Initial craft: " + crafts[0]);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading crafts: $e')));
      print('Error loading crafts: $e');
    }
  }

@override
  void initState() {
    _loadCraftsData();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    _CraftsProvider = Provider.of<CraftProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var  _CraftsProvider = Provider.of<CraftProvider>(context, listen: true);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4c3f7a),
          title: const Text('اختار حرفتك'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8, right: 8, top: 16),
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
              const SizedBox(height: 5),
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
                      style: TextStyle(color: Color(0xff4c3f7a), fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.topRight,
                child: const Text(
                  'اختر حرفتك:',
                  style: TextStyle(fontSize: 22),
                  textDirection: TextDirection.rtl,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: _CraftsProvider.craftName,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    alignment: Alignment.topRight,
                    isExpanded: true,
                    underline: Container(),
                    items: _CraftsProvider.crafts.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      _CraftsProvider.craftName = newValue!.trim();
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_CraftsProvider.craftName != ' ' &&
                _CraftsProvider.craftName.trim().isNotEmpty) {
              print(_CraftsProvider.craftName);
              Navigator.of(context).pushNamed(ResultCraftScreen.routeName);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                "الرجاء قم باختيار حرفتك",
                textDirection: ui.TextDirection.rtl,
              )));
            }
          },
          child: const Icon(Icons.arrow_forward,color: Colors.white,),
          backgroundColor: const Color(0xff4c3f7a),
        ),
      ),
    );
  }
}
