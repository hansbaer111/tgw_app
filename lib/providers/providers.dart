import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
// Needed for FieldValue
import 'package:test_app/services/database_service.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:test_app/models/exercise_model.dart';
import 'package:test_app/models/workout_template_model.dart';
import 'package:test_app/models/client_plan_model.dart';
import 'package:test_app/models/workout_log_model.dart';
import 'package:test_app/models/conversation_model.dart';


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

final allUsersProvider = FutureProvider<List<UserModel>>((ref) {
  return DatabaseService().getAllUsers();
});

final exercisesProvider = FutureProvider.autoDispose<List<ExerciseModel>>((ref) {
  return DatabaseService().getGlobalExercises();
});

final allWorkoutLogsProvider = StreamProvider.autoDispose<List<WorkoutLogModel>>((ref) {
  return DatabaseService().getAllWorkoutLogs();
});

final clientConversationsProvider = StreamProvider.autoDispose<List<ConversationModel>>((ref) {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) return Stream.value([]);
  return DatabaseService().getClientConversationsStream(userId);
});

final workoutLogsStreamProvider = StreamProvider<List<WorkoutLogModel>>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return Stream.value([]);
  return DatabaseService().getWorkoutLogsStream(user.uid);
});

final activePlanProvider = FutureProvider.autoDispose<ClientPlanModel?>((ref) {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) return null;
  return DatabaseService().getActiveClientPlan(userId);
});

final workoutTemplateProvider = FutureProvider.family<WorkoutTemplateModel, String>((ref, templateId) {
  return DatabaseService().getWorkoutTemplate(templateId);
});

final exerciseByIdProvider = FutureProvider.autoDispose.family<ExerciseModel?, String>((ref, exerciseId) {
  return ref.read(databaseServiceProvider).getExerciseById(exerciseId);
});

final totalClientsProvider = FutureProvider<int>((ref) async {
  final allUsers = await ref.watch(allUsersProvider.future);
  return allUsers.where((user) => user.role == 'client').length;
});

final totalWorkoutsLoggedProvider = FutureProvider<int>((ref) async {
  return ref.read(databaseServiceProvider).getTotalWorkoutLogsCount();
});

// Placeholder for other providers that might be needed based on the errors
// final workoutLogsProvider = FutureProvider<List<WorkoutLogModel>>((ref) {
//   // This will need to be implemented properly later
//   return Future.value([]);
// });

// final logbuchProvider = StreamProvider<List<ExerciseStats>>((ref) {
//   final workoutLogsAsyncValue = ref.watch(workoutLogsStreamProvider);

//   return workoutLogsAsyncValue.when(
//     data: (workoutLogs) {
//       Map<String, List<WorkoutLogModel>> groupedLogs = {};

//       for (var log in workoutLogs) {
//         groupedLogs.putIfAbsent(log.exerciseId, () => []).add(log);
//       }

//       List<ExerciseStats> stats = [];
//       groupedLogs.forEach((exerciseId, logs) {
//         double maxWeight = 0.0;
//         int totalReps = 0;
//         int totalSets = 0;

//         for (var log in logs) {
//           for (var set in log.sets) {
//             // Assuming 'reps' and 'rpe' are strings, and 'weight' is not directly in WorkoutSetModel
//             // You'll need to adjust this based on your actual WorkoutSetModel structure
//             // For now, let's assume weight is part of the log or can be derived.
//             // For simplicity, let's assume a dummy weight for now.
//             double currentWeight = 0.0; // Placeholder
//             if (set.reps.isNotEmpty) {
//               // Example: if reps string contains weight, parse it
//               // Or if you add weight to WorkoutSetModel
//             }
//             if (currentWeight > maxWeight) {
//               maxWeight = currentWeight;
//             }
//             totalReps += int.tryParse(set.reps) ?? 0;
//             totalSets++;
//           }
//         }

//         stats.add(ExerciseStats(
//           exerciseId: exerciseId,
//           maxWeight: maxWeight,
//           totalVolume: maxWeight * totalReps, // Simplified total volume
//           totalReps: totalReps,
//           totalSets: totalSets,
//         ));
//       });
//       return Stream.value(stats);
//     },
//     loading: () => Stream.value([]), // Return empty list during loading
//     error: (error, stackTrace) => Stream.error(error), // Propagate error
//   );
// });

// final adminConversationsProvider = StreamProvider<List<ConversationModel>>((ref) {
//   final user = FirebaseAuth.instance.currentUser;
//   if (user == null) return Stream.value([]);
//   // Assuming the current user is the admin
//   return ref.read(databaseServiceProvider).getAdminConversationsStream(user.uid);
// });