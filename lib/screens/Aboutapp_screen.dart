// import 'package:flutter/material.dart';

// class AboutAppScreen extends StatelessWidget {
//   const AboutAppScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("About App"),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16),
//         child: Text(
//           "This is a demo Facebook clone app made in Flutter. "
//           "You can use this app to learn Flutter development and UI design.",
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About App"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 App Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://brandpalettes.com/wp-content/uploads/2018/05/Facebook-Logo-JPG.jpg"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🔹 App Name
              const Text(
                "Facebook Clone App",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // 🔹 Short Description
              const Text(
                "This is a demo app created using Flutter to practice UI design and "
                "navigation features. You can like, comment, share posts, and "
                "explore profile pages similar to Facebook.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 16),

              // 🔹 Features Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Features:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FeatureItem(text: "• Create status updates and posts."),
                  FeatureItem(text: "• Like, comment, and share posts."),
                  FeatureItem(text: "• View user profiles and stories."),
                  FeatureItem(text: "• Navigation menu with About, Settings, Developers."),
                  FeatureItem(text: "• Beautiful Flutter UI design."),
                ],
              ),

              const SizedBox(height: 24),

              // 🔹 Developer Info
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Developer:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                        "https://scontent.fpnh22-2.fna.fbcdn.net/v/t39.30808-6/606690942_122164430912823526_7800670916394750246_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeEdjs5RPP5HLf4kkdzh_c_MQv8T_lsSNslC_xP-WxI2yf4AuU6THj-RxZ5G0n2y3l33XloD242oHfFLaNVYEoyt&_nc_ohc=ELpM-K6G1rAQ7kNvwEnjboY&_nc_oc=AdnFH9h4wo5eBqSfIjPIsMYofhisM-Z8C7hsFCWq_SqGWOoLdSdPuV4FFX899glLjSs&_nc_zt=23&_nc_ht=scontent.fpnh22-2.fna&_nc_gid=JPLRU-_b-D6-nBDSb04WfA&oh=00_AfrNywnFBdw3l8luzWW9Lh5zctFFxRZ2JONjRY2L3zC3LQ&oe=69680E0D"),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Phal Somnang\nFlutter Developer",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 🔹 App Version
              const Text(
                "Version 1.0.0",
                style: TextStyle(fontSize: 14, color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Widget for feature item
class FeatureItem extends StatelessWidget {
  final String text;
  const FeatureItem({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}
