import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:test_app/models/client_plan_model.dart'; // Import ClientPlanModel
import 'package:test_app/models/conversation_model.dart'; // Import ConversationModel
import 'package:test_app/models/exercise_model.dart';
import 'package:test_app/models/exercise_stats_model.dart'; // Import ExerciseStats
import 'package:test_app/models/user_model.dart';
import 'package:test_app/models/workout_log_model.dart';
import 'package:test_app/models/workout_template_model.dart'; // Import WorkoutTemplateModel
import 'package:test_app/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

final databaseServiceProvider = Provider((ref) => DatabaseService());

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final userProvider = FutureProvider.autoDispose.family<UserModel, String>((ref, uid) {
  return DatabaseService().getUser(uid);
});

final adminAttributesProvider = FutureProvider<AdminAttributesModel>((ref) {
  return DatabaseService().getAdminAttributes();
});

final globalExercisesProvider = FutureProvider<List<ExerciseModel>>((ref) {
  return DatabaseService().getGlobalExercises();
});

final workoutTemplatesProvider = FutureProvider<List<WorkoutTemplateModel>>((ref) {
  return DatabaseService().getAllWorkoutTemplates();
});

final activeClientPlanProvider = FutureProvider<ClientPlanModel?>((ref) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return null;
  return ref.read(databaseServiceProvider).getActiveClientPlan(user.uid);
});

final workoutTemplateProvider = FutureProvider.family<WorkoutTemplateModel, String>((ref, templateId) {
  return ref.read(databaseServiceProvider).getWorkoutTemplate(templateId);
});

final workoutLogsStreamProvider = StreamProvider<List<WorkoutLogModel>>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return Stream.value([]);
  return ref.read(databaseServiceProvider).getWorkoutLogsStream(user.uid);
});

final logbuchProvider = StreamProvider<List<ExerciseStats>>((ref) {
  final workoutLogsAsyncValue = ref.watch(workoutLogsStreamProvider);

  return workoutLogsAsyncValue.when(
    data: (workoutLogs) {
      Map<String, List<WorkoutLogModel>> groupedLogs = {};

      for (var log in workoutLogs) {
        groupedLogs.putIfAbsent(log.exerciseId, () => []).add(log);
      }

      List<ExerciseStats> stats = [];
      groupedLogs.forEach((exerciseId, logs) {
        double maxWeight = 0.0;
        int totalReps = 0;
        int totalSets = 0;

        for (var log in logs) {
          for (var set in log.sets) {
            // Assuming 'reps' and 'rpe' are strings, and 'weight' is not directly in WorkoutSetModel
            // You'll need to adjust this based on your actual WorkoutSetModel structure
            // For now, let's assume weight is part of the log or can be derived.
            // For simplicity, let's assume a dummy weight for now.
            double currentWeight = 0.0; // Placeholder
            if (set.reps.isNotEmpty) {
              // Example: if reps string contains weight, parse it
              // Or if you add weight to WorkoutSetModel
            }
            if (currentWeight > maxWeight) {
              maxWeight = currentWeight;
            }
            totalReps += int.tryParse(set.reps) ?? 0;
            totalSets++;
          }
        }

        stats.add(ExerciseStats(
          exerciseId: exerciseId,
          maxWeight: maxWeight,
          totalVolume: maxWeight * totalReps, // Simplified total volume
          totalReps: totalReps,
          totalSets: totalSets,
        ));
      });
      return Stream.value(stats);
    },
    loading: () => Stream.value([]), // Return empty list during loading
    error: (error, stackTrace) => Stream.error(error), // Propagate error
  );
});

final allUsersProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(databaseServiceProvider).getAllUsers();
});

final adminConversationsProvider = StreamProvider<List<ConversationModel>>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return Stream.value([]);
  // Assuming the current user is the admin
  return ref.read(databaseServiceProvider).getAdminConversationsStream(user.uid);
});

// Placeholder for other providers that might be needed based on the errors
final workoutLogsProvider = FutureProvider<List<WorkoutLogModel>>((ref) {
  // This will need to be implemented properly later
  return Future.value([]);
});

final exercisesProvider = FutureProvider<List<ExerciseModel>>((ref) {
  // This will need to be implemented properly later
  return Future.value([]);
});