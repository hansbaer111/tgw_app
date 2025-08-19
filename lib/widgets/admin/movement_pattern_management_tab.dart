import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file
import 'package:test_app/widgets/admin/add_edit_attribute_dialog.dart';
import 'package:test_app/widgets/admin/attribute_list_tile.dart';

class MovementPatternManagementTab extends ConsumerWidget {
  const MovementPatternManagementTab({super.key});

  void _showAddEditDialog(BuildContext context, WidgetRef ref, {String? oldPattern}) {
    showDialog(
      context: context,
      builder: (context) => AddEditAttributeDialog(
        initialValue: oldPattern,
        onSave: (newPattern) async {
          final db = ref.read(databaseServiceProvider);
          if (oldPattern != null) {
            await db.updateMovementPattern(oldPattern, newPattern);
          } else {
            await db.addMovementPattern(newPattern);
          }
          ref.refresh(adminAttributesProvider);
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, String pattern) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Movement Pattern'),
        content: Text('Are you sure you want to delete "$pattern"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(databaseServiceProvider).deleteMovementPattern(pattern);
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
          if (attributes.movementPatterns.isEmpty) {
            return const Center(child: Text('No movement patterns found. Add one!'));
          }
          return ListView.builder(
            itemCount: attributes.movementPatterns.length,
            itemBuilder: (context, index) {
              final pattern = attributes.movementPatterns[index];
              return AttributeListTile(
                title: pattern,
                onEdit: () => _showAddEditDialog(context, ref, oldPattern: pattern),
                onDelete: () => _showDeleteDialog(context, ref, pattern),
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