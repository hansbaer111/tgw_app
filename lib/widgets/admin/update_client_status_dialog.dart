import 'package:flutter/material.dart';
import 'package:test_app/models/user_model.dart';

class UpdateClientStatusDialog extends StatefulWidget {
  final UserModel client;
  final Function(String) onStatusChanged;

  const UpdateClientStatusDialog({
    super.key,
    required this.client,
    required this.onStatusChanged,
  });

  @override
  State<UpdateClientStatusDialog> createState() => _UpdateClientStatusDialogState();
}

class _UpdateClientStatusDialogState extends State<UpdateClientStatusDialog> {
  late String _selectedStatus;
  final List<String> _statuses = ['pending', 'active', 'inactive'];

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.client.status;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Status for ${widget.client.displayName}'),
      content: DropdownButton<String>(
        value: _selectedStatus,
        isExpanded: true,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedStatus = newValue;
            });
          }
        },
        items: _statuses.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onStatusChanged(_selectedStatus);
            Navigator.of(context).pop();
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}