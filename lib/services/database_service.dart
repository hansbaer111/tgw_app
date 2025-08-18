import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:test_app/models/user_model.dart';

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
}
