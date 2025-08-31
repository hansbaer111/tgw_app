import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/firebase_options.dart';

Future<void> main() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('✅ Firebase initialized successfully.');
  } catch (e) {
    print('❌ Error initializing Firebase: $e');
    return;
  }

  final firestore = FirebaseFirestore.instance;
  print('nFetching admin_attributes from Firestore...');

  try {
    final doc = await firestore.collection('admin_attributes').doc('config').get();

    if (!doc.exists || doc.data() == null) {
      print('❌ admin_attributes document does not exist or is empty.');
      return;
    }

    print('--- Admin Attributes ---');
    print(doc.data());
    print('---');
    print('✅ Successfully fetched admin_attributes.');

  } catch (e) {
    print('n❌ ERROR fetching admin_attributes: $e');
  }
}
