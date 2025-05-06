import 'package:e_commerce_app/View/MainScreen/User%20Screen/CategoryScreen.dart';
import 'package:e_commerce_app/View/MainScreen/User%20Screen/HomeScreen.dart';
import 'package:e_commerce_app/View/MainScreen/User%20Screen/PersonScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  String username;
  String email;
  String role;
  String contact;
  MainScreen({
    required this.username,
    required this.email,
    required this.role,
    required this.contact,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Homescreen(username: widget.username),
      Categoryscreen(),
      // Favoritescreen(),
      Personscreen(
        username: widget.username,
        email: widget.email,
        contact: widget.contact,
        role: widget.role,
      ),
    ];

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category),
          ),
          // BottomNavigationBarItem(
          //   label: 'Favorite',
          //   icon: Icon(Icons.favorite),
          // ),
          BottomNavigationBarItem(label: 'Person', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
