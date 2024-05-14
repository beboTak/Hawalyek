import 'package:flutter/material.dart';

class CraftProfileScreen extends StatelessWidget {
  const CraftProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffa19bb8),
      body: Directionality(
        textDirection: TextDirection.rtl, // Right to left direction
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with your image URL
                ),
                const SizedBox(height: 24),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'الأسم الأول',
                    hintText: 'ادخل الإسم الأول',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'الأسم الثاني',
                    hintText: 'ادخل الأسم الثاني',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    hintText: 'ادخل رقم الهاتف',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'تاريخ الميلاد',
                    hintText: 'ادخل تاريخ الميلاد',
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  items: [
                    'ذكر',
                    'انثى',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                  decoration: const InputDecoration(
                    labelText: 'النوع',
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  items: [
                    'قنا',
                    'القاهرة',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                  decoration: const InputDecoration(
                    labelText: 'اختار محافظتك',
                  ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Save profile information
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4c3f7a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      icon: const Icon(Icons.edit), // Replace with your desired icon
                      label: const Text('تعديل كلمة المرور'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Save profile information
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4c3f7a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      icon: const Icon(Icons.save), // Replace with your desired icon
                      label: const Text('حفظ'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Save profile information
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4c3f7a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      icon: const Icon(Icons.photo), // Replace with your desired icon
                      label: const Text('تحميل صورة للمعرض '),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Save profile information
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4c3f7a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      icon: const Icon(Icons.photo_camera), // Replace with your desired icon
                      label: const Text('الصفحة الشخصية'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Save profile information
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4c3f7a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      icon: const Icon(Icons.photo_library), // Replace with your desired icon
                      label: const Center(child: Text('تحميل صورة للصفحة الشخصية والمعرض')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
