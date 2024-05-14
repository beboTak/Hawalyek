import 'package:flutter/material.dart';


class ContactCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.check_circle, color: Colors.green, size: 40),
              const SizedBox(height: 10),
              const Text('أحمد حمد'),
              const SizedBox(height: 5),
              const Text('بند قيد من القائمين', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 5),
              const Text('2000-05-05', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                icon: const Icon(Icons.phone, color: Colors.white),
                label: const Text('الإتصال الآن'),
                onPressed: () {
                  // Your call action here
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xffd0b4d5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                icon: const Icon(Icons.error, color: Colors.red),
                label: const Text('إلغاء', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  // Your cancel action here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}