import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file
import 'package:test_app/widgets/admin/add_edit_modifier_dialog.dart';
import 'package:test_app/widgets/admin/attribute_list_tile.dart';
import 'package:test_app/models/admin_attributes_model.dart';

class ExerciseModifierManagementTab extends ConsumerWidget {
  const ExerciseModifierManagementTab({super.key});

  void _showAddEditDialog(BuildContext context, WidgetRef ref, {ExerciseModifier? oldModifier}) {
    showDialog(
      context: context,
      builder: (context) => AddEditModifierDialog(
        initialValue: oldModifier,
        onSave: (newModifier) async {
          final db = ref.read(databaseServiceProvider);
          if (oldModifier != null) {
            await db.updateExerciseModifier(newModifier);
          } else {
            await db.addExerciseModifier(newModifier);
          }
          ref.refresh(adminAttributesProvider);
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, ExerciseModifier modifier) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Modifier'),
        content: Text('Are you sure you want to delete "${modifier.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(databaseServiceProvider).deleteExerciseModifier(modifier.id);
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
          if (attributes.exerciseModifiers.isEmpty) {
            return const Center(child: Text('No exercise modifiers found. Add one!'));
          }
          return ListView.builder(
            itemCount: attributes.exerciseModifiers.length,
            itemBuilder: (context, index) {
              final modifier = attributes.exerciseModifiers[index];
              return AttributeListTile(
                title: modifier.name,
                onEdit: () => _showAddEditDialog(context, ref, oldModifier: modifier),
                onDelete: () => _showDeleteDialog(context, ref, modifier),
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