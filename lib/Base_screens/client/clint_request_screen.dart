import 'package:flutter/material.dart';

import '../../models/craft_data_model.dart';
import 'client_order_screen.dart';


class RequstNow extends StatefulWidget {
  static const routeName = "clint_requst";
  const RequstNow({super.key});

  @override
  State<RequstNow> createState() => _RequstNowState();
}

class _RequstNowState extends State<RequstNow> {
  bool _isSearching = false;
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: _isSearching
              ? Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'حدد من تريد...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),

            ],
          )
              : const Text('الرئيسية'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                size: 35,
                _isSearching ? Icons.cancel : Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                  _searchText = '';
                });
              },
            ),
          ],
        ),
        body: Container(
          color: const Color(0xffa19bb8),
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            children: List.generate(
              crafts.length,
                  (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderPage(craft: crafts[index],)),
                  );
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        crafts[index].imagePath,
                        height: 80, // ارتفاع الصورة
                        width: 80, // عرض الصورة
                      ),
                      Text(
                        crafts[index].text,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {

Craft craft;
   CustomCard({
    Key? key,
   required this.craft
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFiltered = craft.filteredText.isNotEmpty &&
        !craft.text.toLowerCase().contains(craft.filteredText.toLowerCase());

    return Card(
      color: isFiltered ? Colors.grey[300] : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            craft.imagePath,
            width: 64.0,
            height: 64.0,
          ),
          const SizedBox(height: 8.0),
          Text(
            craft.text,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
