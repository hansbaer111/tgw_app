import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/screens/admin/admin_dashboard_screen.dart';
import 'package:test_app/screens/admin/analysis_screen.dart';
import 'package:test_app/screens/admin/attribute_management_screen.dart';
import 'package:test_app/screens/admin/client_list_screen.dart';
import 'package:test_app/screens/admin/exercise_management_screen.dart';
import 'package:test_app/screens/admin/template_library_screen.dart';

class AdminMainScreen extends ConsumerStatefulWidget {
  const AdminMainScreen({Key? key}) : super(key: key);

  @override
  _AdminMainScreenState createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends ConsumerState<AdminMainScreen> {
  int _selectedIndex = 0;
  String _title = 'Admin Dashboard';

  static const List<Widget> _adminScreens = <Widget>[
    AdminDashboardScreen(),
    ClientListScreen(),
    ExerciseManagementScreen(),
    TemplateLibraryScreen(),
    AnalysisScreen(),
    AttributeManagementScreen(),
  ];

  void _onItemTapped(int index, String title) {
    setState(() {
      _selectedIndex = index;
      _title = title;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Admin Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              selected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0, 'Admin Dashboard'),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Klienten'),
              selected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1, 'Klienten'),
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Übungs-Bibliothek'),
              selected: _selectedIndex == 2,
              onTap: () => _onItemTapped(2, 'Übungs-Bibliothek'),
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Trainingsplan-Vorlagen'),
              selected: _selectedIndex == 3,
              onTap: () => _onItemTapped(3, 'Trainingsplan-Vorlagen'),
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Analyse'),
              selected: _selectedIndex == 4,
              onTap: () => _onItemTapped(4, 'Analyse'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Attribute'),
              selected: _selectedIndex == 5,
              onTap: () => _onItemTapped(5, 'Attribute Management'),
            ),
          ],
        ),
      ),
      body: _adminScreens[_selectedIndex],
    );
  }
}
