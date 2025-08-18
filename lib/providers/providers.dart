import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:test_app/main.dart'; // For databaseServiceProvider

final adminAttributesProvider = FutureProvider<AdminAttributesModel?>((ref) async {
  final databaseService = ref.read(databaseServiceProvider);
  return databaseService.getAdminAttributes(); // Assuming this method exists
});