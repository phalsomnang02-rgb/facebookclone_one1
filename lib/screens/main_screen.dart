

import 'package:flutter/material.dart';
import 'frist_screen.dart';
import 'menu_screen.dart';
import 'profile_screen.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomAppBar(),

     
    );
  }
  
  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        FristScreen(),
        FacebookProfile(),
        MenuScreen(),
        // Container(color: Colors.blue),
        // // MenuScreen(),
      ],
    );
  }

  int _currentIndex = 0;

  Widget _buildBottomAppBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        debugPrint("Current Index: $_currentIndex");
      },
      backgroundColor: Colors.indigo.shade50,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),
        // BottomNavigationBarItem(icon:Icon(Icons.info),label:'About app'),
        BottomNavigationBarItem(icon: Icon(Icons.menu),label: "menu"),
      ],
    );
  }
}



