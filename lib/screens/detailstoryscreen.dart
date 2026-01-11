import 'package:flutter/material.dart';
import 'story.dart';

class DetailStoryScreen extends StatelessWidget {
  final Story  story;

  const DetailStoryScreen(this.story, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Story Image
          Positioned.fill(
            child: Image.network(
              story.image1,
              fit: BoxFit.cover,
            ),
          ),

          //  Top Info
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(story.image1),
                ),
                const SizedBox(width: 10),
                Text(
                  story.name1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



