import 'package:flutter/material.dart';
class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearching = false;
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: _isSearching
          ? TextField(
        onChanged: (value) {
          setState(() {
            _searchText = value;
          });
        },
        autofocus: true,
        decoration: const InputDecoration(
          hintText: ' حدد من تريد ..',
          border: InputBorder.none,
        ),
      )
          : const Text('الرئيسية'),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop(); // الانتقال إلى الصفحة السابقة
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
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
    );
  }
}
