import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/craft_provider.dart';
import 'choose_craft.dart';

class CraftImageDataScreen extends StatelessWidget {
  static const routeName = "craft_images_data_screen";

  const CraftImageDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final craftProvider = Provider.of<CraftProvider>(context, listen: true);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                        style:
                            TextStyle(color: Color(0xff4c3f7a), fontSize: 25),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                if (craftProvider.personalImageBytes != null)
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
                        craftProvider.personalImageBytes!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    bool uploadSuccessful =
                        await craftProvider.loadPersonalImage();
                    craftProvider.loadImage = uploadSuccessful;
                  },
                  child: const Text('تحميل الصورة الشخصية'),
                ),
                const SizedBox(height: 20),
                if (craftProvider.nationalIdImageBytes != null)
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.memory(
                        craftProvider.nationalIdImageBytes!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    if (craftProvider.loadImage) {
                      bool uploadSuccessful =
                          await craftProvider.loadNationalIdImage();

                      craftProvider.loadImage = uploadSuccessful;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        "الرجاء قم بتحميل صورة شخصية",
                        textDirection: TextDirection.rtl,
                      )));
                    }
                  },
                  child: const Text('تحميل صورة البطاقة'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (craftProvider.loadImage) {
                      Navigator.of(context)
                          .pushNamed(ChooseCraft.routeName);
                    } else {
                      print('Failed to upload images');
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
