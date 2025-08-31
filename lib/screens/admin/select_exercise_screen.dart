import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// For the provider
import 'package:test_app/providers/providers.dart';

class SelectExerciseScreen extends ConsumerStatefulWidget {
  const SelectExerciseScreen({super.key});

  @override
  ConsumerState<SelectExerciseScreen> createState() => _SelectExerciseScreenState();
}

class _SelectExerciseScreenState extends ConsumerState<SelectExerciseScreen> {
  late WidgetRef _ref;

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _ref = ref;
  }

  @override
  Widget build(BuildContext context) {
    final exercisesAsync = _ref.watch(exercisesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Exercise'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: exercisesAsync.when(
              data: (exercises) {
                final filteredExercises = exercises
                    .where((ex) => ex.name.toLowerCase().contains(_searchQuery.toLowerCase()))
                    .toList();

                return ListView.builder(
                  itemCount: filteredExercises.length,
                  itemBuilder: (context, index) {
                    final exercise = filteredExercises[index];
                    return ListTile(
                      title: Text(exercise.name),
                      onTap: () {
                        Navigator.of(context).pop(exercise);
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
