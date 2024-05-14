import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static const routeName ="craft_order_screen";
  OrderScreen({super.key});
  List<int> ratings = [4, 3, 5, 2]; // Updated ratings list

  List<String> orderTexts = [
    ':تم الطلب بواسطة ',
    ':تم الطلب بواسطة',
    ':تم الطلب بواسطة',
  ];
  List<String> nameTexts = [
    ':احمد محمد',
    ': سارة علي',
    ':محمود خالد',
  ];

  List<String> descriptionTexts = [
    '\n:وصف الطلب ',
    '\n:وصف الطلب',
    '\n:وصف الطلب ',
  ];
  List<String> requstTexts = [
    '\nاريد اصلاح غساله من نوع زانوسي لا تسحب الماء',
    '\n: اريد تركيب مكيف هواء',
    ' \nاريد تصليح سخان الماء',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffa19bb8),
      body: Center(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize:
                    MainAxisSize.min, // To wrap content in the column
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          text: orderTexts[index], // تعديل النص هنا
                          style:
                          const TextStyle(fontSize: 25, color: Color(0xff4c3f7a)),
                          children: <TextSpan>[
                            const TextSpan(
                              text: '\n',
                              style: TextStyle(fontSize: 16),
                            ),
                            TextSpan(
                                text: nameTexts[index],
                                // تعديل النص هنا
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xff070707))),
                            TextSpan(
                                text: descriptionTexts[index], // تعديل النص هنا
                                style: const TextStyle(
                                    fontSize: 25, color: Color(0xff4c3f7a))),
                            TextSpan(
                                text: requstTexts[index], // تعديل النص هنا
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xff000000))),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text('ديسمبر 9'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          Text(
                            '${ratings[index]}/5',
                          ), // Display the rating from the ratings list
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

