import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'story.dart';
import 'detailstoryscreen.dart';
import 'storyitem.dart';
import 'addstorycard.dart';
import 'dataAdd_body.dart';

class FristScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.message, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],

        backgroundColor: Colors.white,
        elevation: 1,
      ),

      body: _buildMainListView(),
    );
  }
}

Widget _buildMainListView() {
  return ListView(
    physics: BouncingScrollPhysics(),
    children: [
      _textview(),
      _buildStoryListView(),
      _buildListViewbuilder(),
  
    ],
  );
}

Widget _textview() {
  final profile = "https://wallpapers.com/images/featured/ett9auo4ihny9ea6.jpg";

  return Card(
    margin: const EdgeInsets.all(8),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // 🔹 Profile Image
          CircleAvatar(radius: 22, backgroundImage: NetworkImage(profile)),

          const SizedBox(width: 10),

          // 🔹 TextField
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // 🔹 Photo Icon
          IconButton(
            icon: const Icon(Icons.photo_album_outlined, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
Widget _buildStoryListView() {
  return SizedBox(
    height: 220,
    child: PageView.builder(
      controller: PageController(viewportFraction: 0.38),
      itemCount: story.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Add Story Clicked")),
              );
            },
            child: const AddStoryCard(),
          );
        }

        final item = story[index - 1];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (_) => DetailStoryScreen(item)),
            );
          },
          child: StoryCard(item),
        );
      },
    ),
  );
}

Widget _buildListViewbuilder() {

  return ListView.builder(
    shrinkWrap: true, // បង្កើន height តាម content
    physics: NeverScrollableScrollPhysics(), // មិន scroll independent
    itemCount: posts.length,
    itemBuilder: (context, index) {
      final post = posts[index];

      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 User info
            ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(post.avatar)),
              title: Text(post.name),
              subtitle: const Text("Just now"),
            ),

            // 🔹 Post caption
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(post.caption),
            ),

            // 🔹 Post image
            if (post.image != null && post.image.isNotEmpty)
              Image.network(post.image),

            const SizedBox(height: 8),

            // 🔹 Like / Comment / Share buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.thumb_up_alt_outlined, color: Colors.grey),
                  label: const Text("Like", style: TextStyle(color: Colors.grey)),
                ),
                TextButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.comment_outlined, color: Colors.grey),
                  label: const Text("Comment", style: TextStyle(color: Colors.grey)),
                ),
                TextButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.share_outlined, color: Colors.grey),
                  label: const Text("Share", style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),

            const SizedBox(height: 8), // spacing at bottom of card
          ],
        ),
      );
    },
  );
}
