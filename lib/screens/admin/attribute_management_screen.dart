import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/auth_wrapper.dart';

class AttributeManagementScreen extends ConsumerStatefulWidget {
  const AttributeManagementScreen({Key? key}) : super(key: key);

  @override
  _AttributeManagementScreenState createState() =>
      _AttributeManagementScreenState();
}

class _AttributeManagementScreenState
    extends ConsumerState<AttributeManagementScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final _nameController = TextEditingController();
        return AlertDialog(
          title: const Text('Add Attribute'),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement save functionality
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final attributes = ref.watch(adminAttributesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attribute Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Equipment'),
            Tab(text: 'Movement'),
            Tab(text: 'Muscles'),
            Tab(text: 'Modifiers'),
          ],
        ),
      ),
      body: attributes.when(
        data: (data) {
          return TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                itemCount: data.equipmentTypes.length,
                itemBuilder: (context, index) {
                  final item = data.equipmentTypes[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // TODO: Implement edit functionality
                      },
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: data.movementPatterns.length,
                itemBuilder: (context, index) {
                  final item = data.movementPatterns[index];
                  return ListTile(
                    title: Text(item),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // TODO: Implement edit functionality
                      },
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: data.muscleGroups.length,
                itemBuilder: (context, index) {
                  final item = data.muscleGroups[index];
                  return ListTile(
                    title: Text(item),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // TODO: Implement edit functionality
                      },
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: data.exerciseModifiers.length,
                itemBuilder: (context, index) {
                  final item = data.exerciseModifiers[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // TODO: Implement edit functionality
                      },
                    ),
                  );
                },
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}