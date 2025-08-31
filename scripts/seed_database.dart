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
    print('❌ Firebase initialization failed: $e');
    print('Please ensure "lib/firebase_options.dart" exists and is correct.');
    return;
  }

  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch();

  print('nPreparing initial database seed data...');

  // --- 1. Admin Attributes (The source for all dropdowns) ---
  final adminAttributesRef = firestore.collection('admin_attributes').doc('config');
  batch.set(adminAttributesRef, {
    'equipmentTypes': ['Barbell', 'Dumbbell', 'Machine', 'Bodyweight', 'Cable', 'Kettlebell'],
    'movementPatterns': ['Squat', 'Hinge', 'Horizontal Press', 'Vertical Press', 'Horizontal Pull', 'Vertical Pull', 'Isolation'],
    'muscleGroups': ['Quadriceps', 'Hamstrings', 'Gluteus Maximus', 'Pectoralis Major', 'Latissimus Dorsi', 'Biceps', 'Triceps'],
    'flowchartJson': '{}', // Empty JSON as a placeholder for the quiz
  });
  print('📝 Added Admin Attributes to the batch.');

  // --- 2. Sample Global Exercises ---
  final benchPressRef = firestore.collection('exercises').doc('bench_press_barbell');
  batch.set(benchPressRef, {
    'exerciseId': 'bench_press_barbell',
    'baseExerciseId': 'bench_press',
    'name': 'Langhantel Bankdrücken',
    'ownerId': 'global',
    'videoUrl': null,
    'tags': {
      'equipment': 'Barbell',
      'primaryMuscle': 'Pectoralis Major',
      'movementPattern': 'Horizontal Press',
      'secondaryMuscles': ['Deltoids', 'Triceps'],
    }
  });
  print('📝 Added Barbell Bench Press exercise to the batch.');

  final squatRef = firestore.collection('exercises').doc('squat_barbell');
  batch.set(squatRef, {
    'exerciseId': 'squat_barbell',
    'baseExerciseId': 'squat',
    'name': 'Langhantel Kniebeuge',
    'ownerId': 'global',
    'videoUrl': null,
    'tags': {
      'equipment': 'Barbell',
      'primaryMuscle': 'Quadriceps',
      'movementPattern': 'Squat',
      'secondaryMuscles': ['Gluteus Maximus', 'Hamstrings'],
    }
  });
  print('📝 Added Barbell Squat exercise to the batch.');

  // --- 3. Sample Workout Template ---
  final templateRef = firestore.collection('workout_templates').doc('sample_full_body_template');
  batch.set(templateRef, {
    "name": "Sample Full Body Plan",
    "description": "A simple template to test the app's functionality.",
    "days": [
      {
        "dayId": "A",
        "dayName": "Full Body A",
        "dayCategory": "full_body",
        "type": "workout",
        "exercises": [
          {
            "exerciseId": "squat_barbell", // Refers to the exercise above
            "sets": [
              { "setType": "Standard", "parameters": { "reps": 8, "rest": 120, "loadMethod": "RIR", "loadValue": 3 } },
              { "setType": "Standard", "parameters": { "reps": 8, "rest": 120, "loadMethod": "RIR", "loadValue": 3 } },
              { "setType": "Standard", "parameters": { "reps": 8, "rest": 120, "loadMethod": "RIR", "loadValue": 3 } }
            ]
          },
          {
            "exerciseId": "bench_press_barbell", // Refers to the exercise above
            "sets": [
              { "setType": "Standard", "parameters": { "reps": 10, "rest": 90, "loadMethod": "RIR", "loadValue": 3 } },
              { "setType": "Standard", "parameters": { "reps": 10, "rest": 90, "loadMethod": "RIR", "loadValue": 3 } },
              { "setType": "Standard", "parameters": { "reps": 10, "rest": 90, "loadMethod": "RIR", "loadValue": 3 } }
            ]
          }
        ]
      }
    ]
  });
  print('📝 Added a sample Workout Template to the batch.');

  // --- Commit the Batch to Firestore ---
  try {
    await batch.commit();
    print('n✅ SUCCESS! All seed data has been written to the database.');
    print('The collections `admin_attributes`, `exercises`, and `workout_templates` have been created/updated.');
  } catch (e) {
    print('n❌ ERROR committing the batch: $e');
    print('Please ensure your Firestore security rules allow write operations from this script.');
  }
}