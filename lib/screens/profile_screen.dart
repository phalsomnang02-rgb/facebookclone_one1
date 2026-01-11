import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const  ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Facebook Profile',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const FacebookProfile(),
//     );
//   }
// }

class FacebookProfile extends StatelessWidget {
  const FacebookProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final coverPhoto =
        "https://www.slashgear.com/img/gallery/10-of-the-most-incredible-cars-in-cristiano-ronaldos-collection/intro-1693334996.jpg";
    final profilePhoto =
        "https://th.bing.com/th/id/OIP.VB5rAHKLRvTJfOb7l50iyAHaE8?w=246&h=180&c=7&r=0&o=7&pid=1.7&rm=3";

    // Dummy posts
    final postspiture = List.generate(
      5,
      (index) => {
        "avatar": profilePhoto,
        "name": "Ronaldo",
        "caption": "This is post number ${index + 1}",
        "image":"https://www.the-sun.com/wp-content/uploads/sites/6/2023/09/DD-ronaldo-cars_COMP-1.jpg?w=620",
  
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Facebook Profile"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  Cover photo + Profile photo
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  coverPhoto,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: -50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundImage: NetworkImage(profilePhoto),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60), // space for profile avatar
            //  Name + Bio
            const Text(
              "Ronaldo",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "football player |  number 7",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 12),

            //  Buttons (Add Friend, Message, Follow)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Add Friend"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Message"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Follow"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            //  Stats (Friends, Followers, Posts)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _StatItem(count: 200, label: "Friends"),
                  _StatItem(count: 350, label: "Followers"),
                  _StatItem(count: 45, label: "Posts"),
                ],
              ),
            ),

            const Divider(height: 20, thickness: 1),

            //  Posts
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: postspiture.length,
              itemBuilder: (context, index) {
                final post = postspiture[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(post["avatar"]!),
                        ),
                        title: Text(post["name"]!),
                        subtitle: const Text("Just now"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(post["caption"]!),
                      ),
                      if (post["image"] != null && post["image"]!.isNotEmpty)
                        Image.network(post["image"]!),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.grey,
                            ),
                            label: const Text(
                              "Like",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.comment_outlined,
                              color: Colors.grey,
                            ),
                            label: const Text(
                              "Comment",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_outlined,
                              color: Colors.grey,
                            ),
                            label: const Text(
                              "Share",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//  Stats widget
class _StatItem extends StatelessWidget {
  final int count;
  final String label;
  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
