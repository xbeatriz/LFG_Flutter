import 'package:flutter/material.dart';
import 'package:projeto/pages/addEvent.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // NavigationBar Example
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 1000),
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.event_note_rounded),
            label: 'Create Event',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_task_rounded),
            label: 'My Events',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        //backgroundColor: Colors.blue,
        //elevation: 10,
        //surfaceTintColor: Colors.lime,
        //height: 20,
        //labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      body: <Widget>[
        Container(
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: const Text('Blue!'),
        ),
        Container(
          color: Colors.orange,
          alignment: Alignment.center,
          child: const Text('Orange!'),
        ),
        AddEvent(),
        Container(
          color: Colors.purple,
          alignment: Alignment.center,
          child: const Text('Purple'),
        ),
      ][currentPageIndex],
    );
  }
}
