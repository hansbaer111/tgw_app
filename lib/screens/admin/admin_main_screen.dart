import 'package:flutter/material.dart';
import 'package:test_app/screens/admin/attribute_management_screen.dart';
import 'package:test_app/screens/admin/analytics_screen.dart';
import 'package:test_app/screens/admin/admin_dashboard_screen.dart';
import 'package:test_app/screens/admin/client_management_screen.dart';
import 'package:test_app/screens/admin/exercise_library_screen.dart';
import 'package:test_app/screens/admin/workout_template_editor_screen.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  Widget _selectedScreen = const Center(child: Text('Dashboard'));
  String _title = 'Admin Dashboard';

  void _selectScreen(Widget screen, String title) {
    setState(() {
      _selectedScreen = screen;
      _title = title;
    });
    Navigator.of(context).pop(); // Close the drawer
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
                color: Colors.blue,
              ),
              child: Text(
                'Admin Menü',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => _selectScreen(const AdminDashboardScreen(), 'Dashboard'),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Klienten'),
              onTap: () => _selectScreen(const ClientManagementScreen(), 'Klienten'),
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Übungs-Bibliothek'),
              onTap: () => _selectScreen(const ExerciseLibraryScreen(), 'Übungs-Bibliothek'),
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Trainingsplan-Vorlagen'),
              onTap: () => _selectScreen(const WorkoutTemplateEditorScreen(), 'Trainingsplan-Vorlagen'),
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Analyse'),
              onTap: () => _selectScreen(const AnalyticsScreen(), 'Analyse'),
            ),
            ListTile(
              leading: const Icon(Icons.settings_applications),
              title: const Text('Attribute'),
              onTap: () => _selectScreen(const AttributeManagementScreen(), 'Attribute'),
            ),
          ],
        ),
      ),
      body: _selectedScreen,
    );
  }
}