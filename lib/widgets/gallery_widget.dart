import 'package:flutter/material.dart';

import '../models/craft_data.dart';

class GalleryWidget extends StatelessWidget {
  final CraftData craftData;

  const GalleryWidget({super.key, required this.craftData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Craft Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(craftData.imageUrl),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text(
              craftData.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              craftData.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Gallery:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: craftData.galleryImages.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Image ${index + 1}'),
                      onTap: () {
                        // Handle tapping on gallery image
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}