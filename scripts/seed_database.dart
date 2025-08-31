import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'lib/firebase_options.dart';

Future<void> main() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('✅ Firebase initialized successfully.');
  } catch (e) {
    print('❌ Firebase initialization failed: $e');
    return;
  }

  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch();

  // --- 1. Admin Attributes (Konfigurationsdatei) ---
  final adminAttributesRef = firestore.collection('admin_attributes').doc('config');
  batch.set(adminAttributesRef, {
    'equipmentTypes': ['Barbell', 'Dumbbell', 'Machine', 'Bodyweight'],
    'movementPatterns': ['Squat', 'Hinge', 'Push', 'Pull'],
    'muscleGroups': ['Quadriceps', 'Pectoralis Major', 'Latissimus Dorsi'],
    'flowchartJson': '{}', // Leeres JSON als Platzhalter
  });
  print('📝 Admin Attributes zum Batch hinzugefügt.');

  // --- 2. Beispiel-Übungen ---
  final benchPressRef = firestore.collection('exercises').doc('bench_press_barbell');
  batch.set(benchPressRef, {
    'exerciseId': 'bench_press_barbell',
    'name': 'Langhantel Bankdrücken',
    'ownerId': 'global',
    'tags': {
      'equipment': 'Barbell',
      'primaryMuscle': 'Pectoralis Major',
    }
  });
  print('📝 Bankdrücken-Übung zum Batch hinzugefügt.');

  final squatRef = firestore.collection('exercises').doc('squat_barbell');
  batch.set(squatRef, {
    'exerciseId': 'squat_barbell',
    'name': 'Langhantel Kniebeuge',
    'ownerId': 'global',
    'tags': {
      'equipment': 'Barbell',
      'primaryMuscle': 'Quadriceps',
    }
  });
  print('📝 Kniebeugen-Übung zum Batch hinzugefügt.');

  // --- 3. Beispiel Workout Template ---
  final templateRef = firestore.collection('workout_templates').doc(); // Automatische ID
  batch.set(templateRef, {
    "name": "Mein Erstes Template",
    "description": "Ein einfacher Plan zum Testen.",
    "days": [
      {
        "dayId": "A",
        "dayName": "Test Tag A",
        "dayCategory": "full_body",
        "type": "workout",
        "exercises": [
          {
            "exerciseId": "bench_press_barbell", // Verweist auf die Übung oben
            "sets": [
              { "setType": "Standard", "parameters": { "reps": 10, "rest": 90, "loadMethod": "RIR", "loadValue": 2 } }
            ]
          }
        ]
      }
    ]
  });
  print('📝 Workout-Template zum Batch hinzugefügt.');

  // --- Batch ausführen ---
  try {
    await batch.commit();
    print('n✅ ERFOLGREICH! Alle Startdaten wurden in die Datenbank geschrieben.');
  } catch (e) {
    print('❌ FEHLER beim Ausführen des Batches: $e');
  }
}