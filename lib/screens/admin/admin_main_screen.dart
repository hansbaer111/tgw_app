import 'package:flutter/material.dart';

class AdminMainScreen extends StatelessWidget {
  const AdminMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
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
              onTap: () {
                // TODO: Navigate to Dashboard
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Klienten'),
              onTap: () {
                // TODO: Navigate to Klienten
              },
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Übungs-Bibliothek'),
              onTap: () {
                // TODO: Navigate to Übungs-Bibliothek
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Trainingsplan-Vorlagen'),
              onTap: () {
                // TODO: Navigate to Trainingsplan-Vorlagen
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Analyse'),
              onTap: () {
                // TODO: Navigate to Analyse
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Attribute'),
              onTap: () {
                // TODO: Navigate to Attribute
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Admin Dashboard'),
      ),
    );
  }
}