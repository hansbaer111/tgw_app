import 'package:flutter/material.dart';
import 'package:test_app/screens/client/trainingsplaene_tab.dart'; // Import TrainingsplaeneTab
import 'package:test_app/screens/client/logbuch_tab.dart'; // Import LogbuchTab
import 'package:test_app/screens/client/profile_tab.dart'; // Import ProfileTab

class ClientMainScreen extends StatefulWidget {
  const ClientMainScreen({Key? key}) : super(key: key);

  @override
  _ClientMainScreenState createState() => _ClientMainScreenState();
}

class _ClientMainScreenState extends State<ClientMainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    TrainingsplaeneTab(), // Use the new tab widget
    LogbuchTab(), // Use the new tab widget
    ProfileTab(), // Use the new tab widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Main Screen'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Trainingspläne',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Logbuch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
