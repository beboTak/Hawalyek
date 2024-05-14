import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: const Color(0xffa19bb8),
        padding: const EdgeInsets.all(16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              const SizedBox(
                height: 150,
                width: 150,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'الاسم الأول',
                  hintText: 'أدخل الاسم الأول',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'الاسم الثاني',
                  hintText: 'أدخل الاسم الثاني',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'رقم الهاتف',
                  hintText: 'أدخل رقم الهاتف',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                items: ['قنا', 'القاهرة']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (_) {},
                decoration: const InputDecoration(
                  labelText: 'اختر محافظتك',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                items: ['1', '2']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (_) {},
                decoration: const InputDecoration(
                  labelText: 'اختر مدينتك',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'الشارع',
                  hintText: 'أدخل الشارع',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Save profile information
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4c3f7a),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('تعديل كلمة المرور'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Save profile information
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4c3f7a),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('حفظ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
