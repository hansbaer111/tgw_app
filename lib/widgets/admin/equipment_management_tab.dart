import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file
import 'package:test_app/widgets/admin/add_edit_attribute_dialog.dart';
import 'package:test_app/widgets/admin/attribute_list_tile.dart';

class EquipmentManagementTab extends ConsumerWidget {
  const EquipmentManagementTab({super.key});

  void _showAddEditDialog(BuildContext context, WidgetRef ref, {String? oldEquipment}) {
    showDialog(
      context: context,
      builder: (context) => AddEditAttributeDialog(
        initialValue: oldEquipment,
        onSave: (newEquipment) async {
          final db = ref.read(databaseServiceProvider);
          if (oldEquipment != null) {
            await db.updateEquipmentType(oldEquipment, newEquipment);
          } else {
            await db.addEquipmentType(newEquipment);
          }
          ref.refresh(adminAttributesProvider);
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, String equipment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Equipment'),
        content: Text('Are you sure you want to delete "$equipment"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(databaseServiceProvider).deleteEquipmentType(equipment);
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
          if (attributes.equipmentTypes.isEmpty) {
            return const Center(child: Text('No equipment types found. Add one!'));
          }
          return ListView.builder(
            itemCount: attributes.equipmentTypes.length,
            itemBuilder: (context, index) {
              final equipment = attributes.equipmentTypes[index];
              return AttributeListTile(
                title: equipment as String,
                onEdit: () => _showAddEditDialog(context, ref, oldEquipment: equipment as String),
                onDelete: () => _showDeleteDialog(context, ref, equipment as String),
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