import 'package:firstapp/models/order_model.dart';
import 'package:flutter/material.dart';

import '../../models/craft_model.dart';

class OrderPage extends StatelessWidget {
  Craft craft;

  OrderPage({super.key, required this.craft});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4c3f7a),


        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OrderCard(
                    orderText: "سجل طلبك",
                    thumbnailImagePath: craft.imagePath,
                    craftsmanName: craft.text),
                const SizedBox(height: 16.0),
                const TextField(
                  maxLines: 6,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    hintText: 'ادخل طلبك هنا...',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // إضافة سلوك عند النقر على زر رفع الصورة هنا
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4c3f7a), // تعيين لون زر الرفع إلى الأخضر
                  ),
                  child: const Text('تحميل صورة'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // إضافة سلوك عند النقر على زر الطلب هنا
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4c3f7a), // تعيين لون زر الرفع إلى الأخضر
                  ),
                  child: const Text('طلب'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderText;
  final String thumbnailImagePath;
  final String craftsmanName;

  const OrderCard({
    required this.orderText,
    required this.thumbnailImagePath,
    required this.craftsmanName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(thumbnailImagePath),
              radius: 50.0, // زيادة حجم الصورة هنا
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderText,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'اسم الحرفي: $craftsmanName',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
