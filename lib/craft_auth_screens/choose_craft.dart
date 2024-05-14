import 'package:firstapp/craft_auth_screens/contact_screen.dart';
import 'package:flutter/material.dart';

class ChooseCraft extends StatefulWidget {
  static const routeName = 'choose_craft';

  @override
  _ChooseCraftState createState() => _ChooseCraftState();
}

class _ChooseCraftState extends State<ChooseCraft> {
  List<bool> isSelected = List.generate(21, (index) => false);
  int? selectedCraft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4c3f7a),
        title: const Text('اختار حرفتك'),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.grey),
          onPressed: () {
            Navigator.of(context).pop();
            // Handle back button press
          },
        ),
        elevation: 0,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: isSelected.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (selectedCraft == index) {
                  // Unselect the craft if it's already selected
                  selectedCraft = null;
                } else {
                  // Select the craft
                  selectedCraft = index;
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: selectedCraft == index ? Colors.deepPurple : Colors.transparent,
                  width: 2,
                ),
                color: selectedCraft == index ? Colors.deepPurple[200] : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  [
                    'سباك',
                    'نجار',
                    'نقاش',
                    'رسام حائط',
                    'طباخ منزل',
                    'كهربائي',
                    'كهربائي اجهزه',
                    'ممرض',
                    'حرفي صناعه يدوية',
                    'ميكانيكي',
                    'عامل سيراميك',
                    'عامل نظافه',
                    'فني مكن خياطة',
                    'خياطه',
                    'مبيض محاره',
                    'لحام',
                    'حداد',
                    'فني تكيف وتبريد',
                    'صناعي المونتال',
                    'عامل زجاج',
                    'مصور',
                  ][index],
                  style: TextStyle(
                    color: selectedCraft == index ? Colors.white : Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedCraft != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NextPage(selectedCraft: selectedCraft!),
              ),
            );
          }
        },
        child: const Icon(Icons.arrow_forward),
        backgroundColor: const Color(0xff4c3f7a),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final int selectedCraft;

  NextPage({required this.selectedCraft});

  @override
  Widget build(BuildContext context) {
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
                  [
                    'سباك',
                    'نجار',
                    'نقاش',
                    'رسام حائط',
                    'طباخ منزل',
                    'كهربائي',
                    'كهربائي اجهزه',
                    'ممرض',
                    'حرفي صناعه يدوية',
                    'ميكانيكي',
                    'عامل سيراميك',
                    'عامل نظافة',
                    'فني مكن خياطة',
                    'خياطة',
                    'مبيض محارة',
                    'لحام',
                    'حداد',
                    'فني تكييف وتبريد',
                    'صناعي المونتال',
                    'عامل زجاج',
                    'مصور',
                  ][selectedCraft],
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
              child: const Text('نعم'),
            ),
          ],
        ),
      ),
    );
  }
}