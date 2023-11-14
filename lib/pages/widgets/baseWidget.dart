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
      body: [HomeScreen(), MyEvents(), AddEvent(), Profile()][currentPageIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF000B45),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPageIndex,
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: buildIconWithCircle(Icons.home, currentPageIndex == 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: buildIconWithCircle(
                  Icons.gamepad_rounded, currentPageIndex == 1),
              label: 'My Events',
            ),
            BottomNavigationBarItem(
              icon: buildIconWithCircle(Icons.add, currentPageIndex == 2),
              label: 'Add Events',
            ),
            BottomNavigationBarItem(
              icon: buildIconWithCircle(Icons.person, currentPageIndex == 3),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconWithCircle(IconData icon, bool isSelected) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        Icon(icon, color: isSelected ? Color(0XFF000B45) : Colors.white),
      ],
    );
  }
}
