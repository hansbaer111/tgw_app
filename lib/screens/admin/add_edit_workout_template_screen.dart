import 'package:flutter/material.dart';
import 'package:test_app/models/day_model.dart';
import 'package:test_app/models/workout_template_model.dart';
import 'package:test_app/screens/admin/edit_day_screen.dart';
import 'package:test_app/services/database_service.dart';
import 'package:uuid/uuid.dart';

class AddEditWorkoutTemplateScreen extends StatefulWidget {
  final WorkoutTemplateModel? template;

  const AddEditWorkoutTemplateScreen({super.key, this.template});

  @override
  State<AddEditWorkoutTemplateScreen> createState() => _AddEditWorkoutTemplateScreenState();
}

class _AddEditWorkoutTemplateScreenState extends State<AddEditWorkoutTemplateScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late List<DayModel> _days;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.template?.name);
    _descriptionController = TextEditingController(text: widget.template?.description);
    _days = widget.template?.days.map((day) => day.copyWith()).toList() ?? [];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveTemplate() async {
    if (_formKey.currentState!.validate()) {
      final newTemplate = WorkoutTemplateModel(
        id: widget.template?.id ?? const Uuid().v4(),
        name: _nameController.text,
        description: _descriptionController.text,
        days: _days,
      );
      await DatabaseService().saveWorkoutTemplate(newTemplate);
      Navigator.of(context).pop();
    }
  }

  void _addDay() {
    // Simple dialog to get day name
    final nameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Day'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Day Name'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                setState(() {
                  _days.add(DayModel(name: nameController.text, exercises: []));
                });
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.template == null ? 'Add Template' : 'Edit Template'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveTemplate,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Template Name'),
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Days', style: Theme.of(context).textTheme.titleLarge),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _days.length,
                        itemBuilder: (context, index) {
                          final day = _days[index];
                          return ListTile(
                            title: Text(day.name),
                            onTap: () async {
                              final updatedDay = await Navigator.of(context).push<DayModel>(
                                MaterialPageRoute(
                                  builder: (context) => EditDayScreen(day: day),
                                ),
                              );
                              if (updatedDay != null) {
                                setState(() {
                                  _days[index] = updatedDay;
                                });
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDay,
        tooltip: 'Add Day',
        child: const Icon(Icons.add),
      ),
    );
  }
}