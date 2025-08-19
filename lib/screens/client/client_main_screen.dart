import 'package:flutter/material.dart';
import 'package:test_app/screens/client/client_chat_list_screen.dart';
import 'package:test_app/screens/client/logbook_screen.dart';
import 'package:test_app/screens/client/profile_screen.dart';
import 'package:test_app/screens/client/training_plans_screen.dart';

class ClientMainScreen extends StatefulWidget {
  const ClientMainScreen({super.key});

  @override
  State<ClientMainScreen> createState() => _ClientMainScreenState();
}

class _ClientMainScreenState extends State<ClientMainScreen> {
  int _selectedIndex = 0;

  // TODO: Replace with actual screen widgets
  static const List<Widget> _widgetOptions = <Widget>[
    TrainingPlansScreen(),
    LogbookScreen(),
    ClientChatListScreen(),
    ProfileScreen(),
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
        title: const Text('Moritz Coach'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Trainingspläne',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Logbuch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}