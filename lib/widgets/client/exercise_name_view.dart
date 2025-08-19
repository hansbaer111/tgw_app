import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file

class ExerciseNameView extends ConsumerWidget {
  final String exerciseId;

  const ExerciseNameView({super.key, required this.exerciseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseAsync = ref.watch(exerciseByIdProvider(exerciseId));
    return exerciseAsync.when(
      data: (exercise) => Text(
        exercise?.name ?? 'Exercise not found',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => const Text('Error'),
    );
  }
}