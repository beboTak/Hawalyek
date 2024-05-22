import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/craft_provider.dart';
import 'contact_screen.dart';

class ResultCraftScreen extends StatefulWidget {
  static const routeName = "craft_result_screen";

  @override
  State<ResultCraftScreen> createState() => _ResultCraftScreenState();
}

class _ResultCraftScreenState extends State<ResultCraftScreen> {
  @override
  Widget build(BuildContext context) {
    final craftProvider = Provider.of<CraftProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4c3f7a),
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              ':مهنتك هي',
              style: TextStyle(
                fontSize: 26,
                color: Color(0xff4c3f7a),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 150,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.deepPurple[200],
                borderRadius: BorderRadius.circular(60),
              ),
              child: Center(
                child: Text(
                 craftProvider.craftName!,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ContactScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4c3f7a),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
              ),
              child: const Text('نعم',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}