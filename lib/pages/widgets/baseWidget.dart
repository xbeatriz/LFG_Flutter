import 'package:flutter/material.dart';
import 'package:projeto/pages/addEvent.dart';
import 'package:projeto/pages/myEvent.dart';
import 'package:projeto/pages/home.dart';
import 'package:projeto/pages/profile.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.gamepad_rounded, color: Colors.white),
            label: 'My Events',
          ),
          NavigationDestination(
            icon: Icon(Icons.add, color: Colors.white),
            label: 'Add Events',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        
        indicatorColor: Colors.blue[800],
        backgroundColor: Color(0xFF000B45),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      body: [HomeScreen(), MyEvents(), AddEvent(), Profile()][currentPageIndex],
    );
  }
}
