import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:test_app/services/database_service.dart';
import 'package:test_app/main.dart';
import 'package:uuid/uuid.dart';
import 'package:test_app/models/movement_pattern_model.dart'; // Added import

final equipmentTypesProvider = FutureProvider<List<EquipmentType>>((ref) async {
  final databaseService = ref.read(databaseServiceProvider);
  return databaseService.getEquipmentTypes();
});

final movementPatternsProvider = FutureProvider<List<MovementPattern>>((ref) async {
  final databaseService = ref.read(databaseServiceProvider);
  return databaseService.getMovementPatterns();
});

final muscleGroupsProvider = FutureProvider<List<MuscleGroup>>((ref) async {
  final databaseService = ref.read(databaseServiceProvider);
  return databaseService.getMuscleGroups();
});

class AttributeManagementScreen extends ConsumerStatefulWidget {
  const AttributeManagementScreen({super.key});

  @override
  ConsumerState<AttributeManagementScreen> createState() => _AttributeManagementScreenState();
}

class _AttributeManagementScreenState extends ConsumerState<AttributeManagementScreen> {
  final TextEditingController _equipmentTypeNameController = TextEditingController();
  final TextEditingController _movementPatternNameController = TextEditingController();
  final TextEditingController _muscleGroupNameController = TextEditingController();

  void _showAddEditEquipmentTypeDialog({EquipmentType? equipmentType}) {
    _equipmentTypeNameController.text = equipmentType?.name ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(equipmentType == null ? 'Add Equipment Type' : 'Edit Equipment Type'),
          content: TextField(
            controller: _equipmentTypeNameController,
            decoration: const InputDecoration(labelText: 'Equipment Type Name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_equipmentTypeNameController.text.isEmpty) {
                  return;
                }
                final databaseService = ref.read(databaseServiceProvider);
                if (equipmentType == null) {
                  // Add new
                  final newEquipmentType = EquipmentType(
                    id: const Uuid().v4(),
                    name: _equipmentTypeNameController.text,
                  );
                  await databaseService.addEquipmentType(newEquipmentType);
                } else {
                  // Edit existing
                  final updatedEquipmentType = equipmentType.copyWith(name: _equipmentTypeNameController.text);
                  await databaseService.updateEquipmentType(updatedEquipmentType);
                }
                _equipmentTypeNameController.clear();
                Navigator.pop(context);
                ref.invalidate(equipmentTypesProvider); // Refresh the list
              },
              child: Text(equipmentType == null ? 'Add' : 'Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteEquipmentType(String id) async {
    final databaseService = ref.read(databaseServiceProvider);
    await databaseService.deleteEquipmentType(id);
    ref.invalidate(equipmentTypesProvider); // Refresh the list
  }

  void _showAddEditMovementPatternDialog({MovementPattern? movementPattern}) {
    _movementPatternNameController.text = movementPattern?.name ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(movementPattern == null ? 'Add Movement Pattern' : 'Edit Movement Pattern'),
          content: TextField(
            controller: _movementPatternNameController,
            decoration: const InputDecoration(labelText: 'Movement Pattern Name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_movementPatternNameController.text.isEmpty) {
                  return;
                }
                final databaseService = ref.read(databaseServiceProvider);
                if (movementPattern == null) {
                  // Add new
                  final newMovementPattern = MovementPattern(
                    id: const Uuid().v4(),
                    name: _movementPatternNameController.text,
                  );
                  await databaseService.addMovementPattern(newMovementPattern);
                } else {
                  // Edit existing
                  final updatedMovementPattern = movementPattern.copyWith(name: _movementPatternNameController.text);
                  await databaseService.updateMovementPattern(updatedMovementPattern);
                }
                _movementPatternNameController.clear();
                Navigator.pop(context);
                ref.invalidate(movementPatternsProvider); // Refresh the list
              },
              child: Text(movementPattern == null ? 'Add' : 'Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteMovementPattern(String id) async {
    final databaseService = ref.read(databaseServiceProvider);
    await databaseService.deleteMovementPattern(id);
    ref.invalidate(movementPatternsProvider); // Refresh the list
  }

  void _showAddEditMuscleGroupDialog({MuscleGroup? muscleGroup}) {
    _muscleGroupNameController.text = muscleGroup?.name ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(muscleGroup == null ? 'Add Muscle Group' : 'Edit Muscle Group'),
          content: TextField(
            controller: _muscleGroupNameController,
            decoration: const InputDecoration(labelText: 'Muscle Group Name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_muscleGroupNameController.text.isEmpty) {
                  return;
                }
                final databaseService = ref.read(databaseServiceProvider);
                if (muscleGroup == null) {
                  // Add new
                  final newMuscleGroup = MuscleGroup(
                    id: const Uuid().v4(),
                    name: _muscleGroupNameController.text,
                  );
                  await databaseService.addMuscleGroup(newMuscleGroup);
                } else {
                  // Edit existing
                  final updatedMuscleGroup = muscleGroup.copyWith(name: _muscleGroupNameController.text);
                  await databaseService.updateMuscleGroup(updatedMuscleGroup);
                }
                _muscleGroupNameController.clear();
                Navigator.pop(context);
                ref.invalidate(muscleGroupsProvider); // Refresh the list
              },
              child: Text(muscleGroup == null ? 'Add' : 'Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteMuscleGroup(String id) async {
    final databaseService = ref.read(databaseServiceProvider);
    await databaseService.deleteMuscleGroup(id);
    ref.invalidate(muscleGroupsProvider); // Refresh the list
  }

  @override
  void dispose() {
    _equipmentTypeNameController.dispose();
    _movementPatternNameController.dispose();
    _muscleGroupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // EquipmentTypes, MovementPatterns, MuscleGroups, ExerciseModifiers
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Attribute Management'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Equipment'),
              Tab(text: 'Movement'),
              Tab(text: 'Muscles'),
              Tab(text: 'Modifiers'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Equipment Types Tab
            Consumer(
              builder: (context, watch, child) {
                final equipmentTypesAsyncValue = watch.watch(equipmentTypesProvider);
                return equipmentTypesAsyncValue.when(
                  data: (equipmentTypes) {
                    if (equipmentTypes.isEmpty) {
                      return const Center(child: Text('No equipment types found. Add some!'));
                    }
                    return ListView.builder(
                      itemCount: equipmentTypes.length,
                      itemBuilder: (context, index) {
                        final type = equipmentTypes[index];
                        return Dismissible(
                          key: Key(type.id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            _deleteEquipmentType(type.id);
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: ListTile(
                            title: Text(type.name),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _showAddEditEquipmentTypeDialog(equipmentType: type),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                );
              },
            ),
            // Movement Patterns Tab
            Consumer(
              builder: (context, watch, child) {
                final movementPatternsAsyncValue = watch.watch(movementPatternsProvider);
                return movementPatternsAsyncValue.when(
                  data: (movementPatterns) {
                    if (movementPatterns.isEmpty) {
                      return const Center(child: Text('No movement patterns found. Add some!'));
                    }
                    return ListView.builder(
                      itemCount: movementPatterns.length,
                      itemBuilder: (context, index) {
                        final pattern = movementPatterns[index];
                        return Dismissible(
                          key: Key(pattern.id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            _deleteMovementPattern(pattern.id);
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: ListTile(
                            title: Text(pattern.name),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _showAddEditMovementPatternDialog(movementPattern: pattern),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                );
              },
            ),
            // Muscle Groups Tab
            Consumer(
              builder: (context, watch, child) {
                final muscleGroupsAsyncValue = watch.watch(muscleGroupsProvider);
                return muscleGroupsAsyncValue.when(
                  data: (muscleGroups) {
                    if (muscleGroups.isEmpty) {
                      return const Center(child: Text('No muscle groups found. Add some!'));
                    }
                    return ListView.builder(
                      itemCount: muscleGroups.length,
                      itemBuilder: (context, index) {
                        final muscleGroup = muscleGroups[index];
                        return Dismissible(
                          key: Key(muscleGroup.id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            _deleteMuscleGroup(muscleGroup.id);
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: ListTile(
                            title: Text(muscleGroup.name),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _showAddEditMuscleGroupDialog(muscleGroup: muscleGroup),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                );
              },
            ),
            // Exercise Modifiers Tab (placeholder for now)
            const Center(child: Text('Exercise Modifiers Management')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Determine which dialog to show based on the selected tab
            final tabController = DefaultTabController.of(context);
            if (tabController.index == 0) {
              _showAddEditEquipmentTypeDialog();
            } else if (tabController.index == 1) {
              _showAddEditMovementPatternDialog();
            }
            // Add more conditions for other tabs
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}