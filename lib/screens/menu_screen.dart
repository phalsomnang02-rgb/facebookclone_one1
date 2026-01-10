import 'package:flutter/material.dart';
import 'Aboutapp_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final logo =
        "https://brandpalettes.com/wp-content/uploads/2018/05/Facebook-Logo-JPG.jpg";
    return Scaffold(
      appBar: AppBar(title: Text("Menu")),
      body: ListView(
        children: [
          DrawerHeader(child: Image.network(logo)),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About App"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              // 🔹 Navigate to AboutAppScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutAppScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              //Navigator to a screen
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.developer_board),
            title: Text("Developers"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              //Navigator to a screen
            },
          ),
        ],
      ),
    );
  }
}
