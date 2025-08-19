import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file
import 'package:test_app/widgets/admin/add_edit_attribute_dialog.dart';
import 'package:test_app/widgets/admin/attribute_list_tile.dart';

class MuscleGroupManagementTab extends ConsumerWidget {
  const MuscleGroupManagementTab({super.key});

  void _showAddEditDialog(BuildContext context, WidgetRef ref, {String? oldMuscleGroup}) {
    showDialog(
      context: context,
      builder: (context) => AddEditAttributeDialog(
        initialValue: oldMuscleGroup,
        onSave: (newMuscleGroup) async {
          final db = ref.read(databaseServiceProvider);
          if (oldMuscleGroup != null) {
            // The existing updateMuscleGroup method in DatabaseService takes an index.
            // For simplicity and consistency, we will read the list, find the index, and then update.
            // A more robust solution might refactor the service method.
            final attributes = await db.getAdminAttributes();
            final index = attributes.muscleGroups.indexOf(oldMuscleGroup);
            if (index != -1) {
              await db.updateMuscleGroup(index, newMuscleGroup);
            }
          } else {
            await db.addMuscleGroup(newMuscleGroup);
          }
          ref.refresh(adminAttributesProvider);
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, String muscleGroup) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Muscle Group'),
        content: Text('Are you sure you want to delete "$muscleGroup"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(databaseServiceProvider).deleteMuscleGroup(muscleGroup);
              Navigator.of(context).pop();
              ref.refresh(adminAttributesProvider);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attributesAsync = ref.watch(adminAttributesProvider);

    return Scaffold(
      body: attributesAsync.when(
        data: (attributes) {
          if (attributes.muscleGroups.isEmpty) {
            return const Center(child: Text('No muscle groups found. Add one!'));
          }
          return ListView.builder(
            itemCount: attributes.muscleGroups.length,
            itemBuilder: (context, index) {
              final muscleGroup = attributes.muscleGroups[index];
              return AttributeListTile(
                title: muscleGroup,
                onEdit: () => _showAddEditDialog(context, ref, oldMuscleGroup: muscleGroup),
                onDelete: () => _showDeleteDialog(context, ref, muscleGroup),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEditDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }
}