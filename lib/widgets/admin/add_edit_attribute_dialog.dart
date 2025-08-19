import 'package:flutter/material.dart';

class AddEditAttributeDialog extends StatefulWidget {
  final String? initialValue;
  final Function(String) onSave;

  const AddEditAttributeDialog({
    super.key,
    this.initialValue,
    required this.onSave,
  });

  @override
  State<AddEditAttributeDialog> createState() => _AddEditAttributeDialogState();
}

class _AddEditAttributeDialogState extends State<AddEditAttributeDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(_controller.text.trim());
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialValue == null ? 'Add Attribute' : 'Edit Attribute'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Attribute Name'),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter a name.';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _handleSave,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
