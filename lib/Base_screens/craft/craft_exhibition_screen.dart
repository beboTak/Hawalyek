import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../models/craft_exhibition_class.dart';

class CraftExhibitionScreen extends StatefulWidget {
  static const routeName = "craft_exhibition_screen";
  const CraftExhibitionScreen({super.key});

  @override
  State<CraftExhibitionScreen> createState() => _CraftExhibitionScreenState();
}

class _CraftExhibitionScreenState extends State<CraftExhibitionScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<CardData> cardList = [
    CardData(
      userName: 'اسم المستخدم الأول',
      userComment: 'هذا نص تعليق البطاقة الأولى',
      imagePath: 'image/glass.png',
    ),
    CardData(
      userName: 'اسم المستخدم الثاني',
      userComment: 'هذا نص تعليق البطاقة الثانية',
      imagePath: 'image/cooking.png',
    ),
    CardData(
      userName: 'اسم المستخدم الثالث',
      userComment: 'هذا نص تعليق البطاقة الثالثة',
      imagePath: 'image/delivery.png',
    ),
  ];

  void _deleteCard(int index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  void _handleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchController.text = '';
      }
    });
  }

  void _editComment(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedComment = cardList[index].userComment;
        return AlertDialog(
          title: Text('تعديل التعليق'),
          content: TextField(
            onChanged: (value) {
              updatedComment = value;
            },
            controller: TextEditingController(text: cardList[index].userComment),
            decoration: InputDecoration(
              hintText: 'أدخل التعليق الجديد',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  cardList[index].userComment = updatedComment;
                });
                Navigator.of(context).pop();
              },
              child: Text('حفظ'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إلغاء'),
            ),
          ],
        );
      },
    );
  }

  void _editImage(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newImagePath = '';
        return AlertDialog(
          title: Text('تعديل الصورة'),
          content: TextField(
            onChanged: (value) {
              newImagePath = value;
            },
            decoration: InputDecoration(
              hintText: 'أدخل رابط الصورة الجديد',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  cardList[index].imagePath = newImagePath;
                });
                Navigator.of(context).pop();
              },
              child: Text('حفظ'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إلغاء'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(
                isSearching ? Icons.close : Icons.search,
                color: Colors.black,
              ),
              onPressed: _handleSearch,
            ),
          ],
        ),
        body: Container(
          color: const Color(0xffa19bb8),
          child: Column(
            children: [
              if (isSearching) ...[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'حدد من تريد...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
              Expanded(
                child: ListView.builder(
                  itemCount: cardList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        extentRatio: 0.25,
                        children: [
                          SlidableAction(
                            label: 'حذف',
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            onPressed: (context) {
                              _deleteCard(index);
                            },
                          ),
                        ],
                      ),
                      child: CustomCard(
                        cardData: cardList[index],
                        onEditComment: () => _editComment(index),
                        onEditImage: () => _editImage(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final CardData cardData;
  final VoidCallback? onEditComment;
  final VoidCallback? onEditImage;

  const CustomCard({
    Key? key,
    required this.cardData,
    this.onEditComment,
    this.onEditImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
            ),
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    cardData.userName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            subtitle: Text(cardData.userComment),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEditComment,
            ),
          ),
          GestureDetector(
            onTap: onEditImage,
            child: Image.asset(
              cardData.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
