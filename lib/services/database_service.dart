import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:test_app/models/client_plan_model.dart'; // Import ClientPlanModel
import 'package:test_app/models/exercise_model.dart'; // Import ExerciseModel
import 'package:test_app/models/user_model.dart';
import 'package:test_app/models/workout_log_model.dart'; // Import WorkoutLogModel

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signIn({required String email, required String password}) async {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _db.collection('users').doc(userCredential.user!.uid).set({
      'uid': userCredential.user!.uid,
      'displayName': displayName,
      'email': email,
      'role': 'client',
      'status': 'pending',
    });
    return userCredential;
  }

  Future<UserModel> getUser(String uid) async {
    DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
    return UserModel.fromJson(doc.data() as Map<String, dynamic>);
  }

  Future<AdminAttributesModel> getAdminAttributes() async {
    DocumentSnapshot doc = await _db.collection('admin').doc('attributes').get();
    return AdminAttributesModel.fromJson(doc.data() as Map<String, dynamic>);
  }

  Future<void> updateMuscleGroup(int index, String newValue) async {
    DocumentReference docRef = _db.collection('admin').doc('attributes');
    DocumentSnapshot doc = await docRef.get();
    AdminAttributesModel model = AdminAttributesModel.fromJson(doc.data() as Map<String, dynamic>);
    List<String> muscleGroups = List.from(model.muscleGroups);
    muscleGroups[index] = newValue;
    await docRef.update({'muscleGroups': muscleGroups});
  }

  Future<void> deleteMuscleGroup(String attributeName) async {
    DocumentReference docRef = _db.collection('admin').doc('attributes');
    DocumentSnapshot doc = await docRef.get();
    AdminAttributesModel model = AdminAttributesModel.fromJson(doc.data() as Map<String, dynamic>);
    List<String> muscleGroups = List.from(model.muscleGroups);
    muscleGroups.remove(attributeName);
    await docRef.update({'muscleGroups': muscleGroups});
  }

  Future<List<ExerciseModel>> getGlobalExercises() async {
    QuerySnapshot snapshot = await _db.collection('exercises').where('ownerId', isEqualTo: 'global').get();
    return snapshot.docs.map((doc) => ExerciseModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<void> saveWorkoutLog(WorkoutLogModel workoutLog) async {
    await _db.collection('workoutLogs').doc(workoutLog.id).set(workoutLog.toJson());
  }

  Future<List<WorkoutLogModel>> getWorkoutLogs(String userId) async {
    QuerySnapshot snapshot = await _db.collection('workoutLogs').where('userId', isEqualTo: userId).orderBy('date', descending: true).get();
    return snapshot.docs.map((doc) => WorkoutLogModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<List<ClientPlanModel>> getClientPlans(String userId) async {
    QuerySnapshot snapshot = await _db.collection('clientPlans').where('clientId', isEqualTo: userId).orderBy('startDate', descending: true).get();
    return snapshot.docs.map((doc) => ClientPlanModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }
}
