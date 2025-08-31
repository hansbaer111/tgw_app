import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/client_plan_model.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/models/workout_template_model.dart';
// for allUsersProvider
// for templatesProvider
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/providers/providers.dart';

class AssignPlanScreen extends ConsumerStatefulWidget {
  const AssignPlanScreen({super.key});

  @override
  ConsumerState<AssignPlanScreen> createState() => _AssignPlanScreenState();
}

class _AssignPlanScreenState extends ConsumerState<AssignPlanScreen> {
  late WidgetRef _ref;

  final _formKey = GlobalKey<FormState>();
  UserModel? _selectedClient;
  WorkoutTemplateModel? _selectedTemplate;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 30));

  @override
  void initState() {
    super.initState();
    _ref = ref;
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _assignPlan() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedClient == null || _selectedTemplate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a client and a template.')),
        );
        return;
      }

      final newPlan = ClientPlanModel(
        id: const Uuid().v4(),
        clientId: _selectedClient!.uid,
        trainerId: FirebaseAuth.instance.currentUser!.uid,
        name: _selectedTemplate!.name,
        description: _selectedTemplate!.description,
        startDate: _startDate,
        endDate: _endDate,
        days: _selectedTemplate!.days,
        isActive: true,
      );

      await _ref.read(databaseServiceProvider).assignPlanToClient(newPlan);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final allUsersAsync = _ref.watch(allUsersProvider);
          final templatesAsync = _ref.watch(workoutTemplatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Plan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _assignPlan,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              allUsersAsync.when(
                data: (users) {
                  final clients = users.where((u) => u.role == 'client').toList();
                  return DropdownButtonFormField<UserModel>(
                    value: _selectedClient,
                    decoration: const InputDecoration(labelText: 'Select Client'),
                    items: clients.map((client) {
                      return DropdownMenuItem(value: client, child: Text(client.displayName));
                    }).toList(),
                    onChanged: (value) => setState(() => _selectedClient = value),
                    validator: (value) => value == null ? 'Please select a client' : null,
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => const Text('Could not load clients'),
              ),
              const SizedBox(height: 16),
              templatesAsync.when(
                data: (templates) {
                  return DropdownButtonFormField<WorkoutTemplateModel>(
                    value: _selectedTemplate,
                    decoration: const InputDecoration(labelText: 'Select Template'),
                    items: templates.map((template) {
                      return DropdownMenuItem(value: template, child: Text(template.name));
                    }).toList(),
                    onChanged: (value) => setState(() => _selectedTemplate = value),
                    validator: (value) => value == null ? 'Please select a template' : null,
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => const Text('Could not load templates'),
              ),
              const SizedBox(height: 24),
              ListTile(
                title: const Text('Start Date'),
                subtitle: Text('${_startDate.toLocal()}'.split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),
              ListTile(
                title: const Text('End Date'),
                subtitle: Text('${_endDate.toLocal()}'.split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
