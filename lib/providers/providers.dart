import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:test_app/models/exercise_model.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/models/workout_log_model.dart';
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

// Placeholder for other providers that might be needed based on the errors
final workoutLogsProvider = FutureProvider<List<WorkoutLogModel>>((ref) {
  // This will need to be implemented properly later
  return Future.value([]);
});

final exercisesProvider = FutureProvider<List<ExerciseModel>>((ref) {
  // This will need to be implemented properly later
  return Future.value([]);
});