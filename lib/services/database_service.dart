import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:test_app/models/client_plan_model.dart'; // Import ClientPlanModel
import 'package:test_app/models/conversation_model.dart'; // Import ConversationModel
import 'package:test_app/models/exercise_model.dart'; // Import ExerciseModel
import 'package:test_app/models/user_model.dart';
import 'package:test_app/models/workout_log_model.dart'; // Import WorkoutLogModel
import 'package:test_app/models/workout_template_model.dart'; // Import WorkoutTemplateModel

class DatabaseService {
  final FirebaseFirestore _db;
  final FirebaseAuth _auth;

  DatabaseService({FirebaseFirestore? db, FirebaseAuth? auth})
      : _db = db ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

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
    if (doc.exists && doc.data() != null) {
      return AdminAttributesModel.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      // Return a default, empty model if the document doesn't exist
      return const AdminAttributesModel(
        equipmentTypes: [],
        movementPatterns: [],
        muscleGroups: [],
        exerciseModifiers: [],
      );
    }
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

  // Methods for Equipment Type Management
  Future<void> addEquipmentType(String newEquipment) {
    final docRef = _db.collection('admin').doc('attributes');
    return docRef.update({
      'equipmentTypes': FieldValue.arrayUnion([newEquipment])
    });
  }

  Future<void> updateEquipmentType(String oldEquipment, String newEquipment) async {
    final docRef = _db.collection('admin').doc('attributes');
    final doc = await docRef.get();
    if (doc.exists) {
      final model = AdminAttributesModel.fromJson(doc.data()!);
      final updatedList = model.equipmentTypes.map((e) => e == oldEquipment ? newEquipment : e).toList();
      await docRef.update({'equipmentTypes': updatedList});
    }
  }

  Future<void> deleteEquipmentType(String equipmentToDelete) {
    final docRef = _db.collection('admin').doc('attributes');
    return docRef.update({
      'equipmentTypes': FieldValue.arrayRemove([equipmentToDelete])
    });
  }

  // Methods for Movement Pattern Management
  Future<void> addMovementPattern(String newPattern) {
    final docRef = _db.collection('admin').doc('attributes');
    return docRef.update({
      'movementPatterns': FieldValue.arrayUnion([newPattern])
    });
  }

  Future<void> updateMovementPattern(String oldPattern, String newPattern) async {
    final docRef = _db.collection('admin').doc('attributes');
    final doc = await docRef.get();
    if (doc.exists) {
      final model = AdminAttributesModel.fromJson(doc.data()!);
      final updatedList = model.movementPatterns.map((e) => e == oldPattern ? newPattern : e).toList();
      await docRef.update({'movementPatterns': updatedList});
    }
  }

  Future<void> deleteMovementPattern(String patternToDelete) {
    final docRef = _db.collection('admin').doc('attributes');
    return docRef.update({
      'movementPatterns': FieldValue.arrayRemove([patternToDelete])
    });
  }

  // Methods for Muscle Group Management
  Future<void> addMuscleGroup(String newMuscleGroup) {
    final docRef = _db.collection('admin').doc('attributes');
    return docRef.update({
      'muscleGroups': FieldValue.arrayUnion([newMuscleGroup])
    });
  }

  // Methods for Exercise Modifier Management
  Future<void> addExerciseModifier(ExerciseModifier newModifier) async {
    final docRef = _db.collection('admin').doc('attributes');
    final doc = await docRef.get();
    if (doc.exists) {
      final model = AdminAttributesModel.fromJson(doc.data()!);
      final updatedList = [...model.exerciseModifiers, newModifier];
      await docRef.update({'exerciseModifiers': updatedList.map((e) => e.toJson()).toList()});
    }
  }

  Future<void> updateExerciseModifier(ExerciseModifier updatedModifier) async {
    final docRef = _db.collection('admin').doc('attributes');
    final doc = await docRef.get();
    if (doc.exists) {
      final model = AdminAttributesModel.fromJson(doc.data()!);
      final updatedList = model.exerciseModifiers.map((e) => e.id == updatedModifier.id ? updatedModifier : e).toList();
      await docRef.update({'exerciseModifiers': updatedList.map((e) => e.toJson()).toList()});
    }
  }

  Future<void> deleteExerciseModifier(String modifierId) async {
    final docRef = _db.collection('admin').doc('attributes');
    final doc = await docRef.get();
    if (doc.exists) {
      final model = AdminAttributesModel.fromJson(doc.data()!);
      final updatedList = model.exerciseModifiers.where((e) => e.id != modifierId).toList();
      await docRef.update({'exerciseModifiers': updatedList.map((e) => e.toJson()).toList()});
    }
  }

  Future<void> assignPlanToClient(ClientPlanModel plan) async {
    await _db.collection('clientPlans').doc(plan.id).set(plan.toJson());
  }

  Future<int> getTotalWorkoutLogsCount() async {
    final snapshot = await _db.collection('workoutLogs').count().get();
    return snapshot.count ?? 0;
  }

  Stream<List<WorkoutLogModel>> getAllWorkoutLogs() {
    return _db.collection('workoutLogs').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => WorkoutLogModel.fromJson(doc.data())).toList();
    });
  }

  Future<ExerciseModel?> getExerciseById(String id) async {
    final doc = await _db.collection('exercises').doc(id).get();
    if (doc.exists) {
      return ExerciseModel.fromJson(doc.data()!);
    }
    return null;
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

  Future<void> addExercise(ExerciseModel exercise) async {
    await _db.collection('exercises').doc(exercise.exerciseId).set(exercise.toJson());
  }

  Future<void> updateExercise(ExerciseModel exercise) async {
    await _db.collection('exercises').doc(exercise.exerciseId).update(exercise.toJson());
  }

  Future<void> deleteExercise(String exerciseId) async {
    await _db.collection('exercises').doc(exerciseId).delete();
  }

  Future<List<WorkoutTemplateModel>> getAllWorkoutTemplates() async {
    QuerySnapshot snapshot = await _db.collection('workout_templates').get();
    return snapshot.docs.map((doc) => WorkoutTemplateModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<ClientPlanModel?> getActiveClientPlan(String userId) async {
    QuerySnapshot snapshot = await _db.collection('clientPlans').where('clientId', isEqualTo: userId).where('isActive', isEqualTo: true).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      return ClientPlanModel.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<WorkoutTemplateModel> getWorkoutTemplate(String templateId) async {
    DocumentSnapshot doc = await _db.collection('workout_templates').doc(templateId).get();
    return WorkoutTemplateModel.fromJson(doc.data() as Map<String, dynamic>);
  }

  Stream<List<WorkoutLogModel>> getWorkoutLogsStream(String userId) {
    return _db.collection('workoutLogs').where('userId', isEqualTo: userId).orderBy('date', descending: true).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => WorkoutLogModel.fromJson(doc.data())).toList();
    });
  }

  Future<void> saveWorkoutTemplate(WorkoutTemplateModel template) async {
    await _db.collection('workout_templates').doc(template.id).set(template.toJson());
  }

  Future<List<UserModel>> getAllUsers() async {
    QuerySnapshot snapshot = await _db.collection('users').get();
    return snapshot.docs.map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<void> updateUserStatus(String userId, String newStatus) async {
    await _db.collection('users').doc(userId).update({'status': newStatus});
  }

  Stream<List<ConversationModel>> getAdminConversationsStream(String adminId) {
    return _db.collection('conversations')
        .where('participantIds', arrayContains: adminId)
        .orderBy('lastMessageTimestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => ConversationModel.fromJson(doc.data())).toList();
    });
  }

  Stream<List<ConversationModel>> getClientConversationsStream(String userId) {
    return _db.collection('conversations')
        .where('participantIds', arrayContains: userId)
        .orderBy('lastMessageTimestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => ConversationModel.fromJson(doc.data())).toList();
    });
  }
}