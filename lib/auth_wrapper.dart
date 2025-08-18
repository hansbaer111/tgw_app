import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/screens/admin/admin_main_screen.dart';
import 'package:test_app/screens/client/client_main_screen.dart';
import 'package:test_app/screens/client/login_screen.dart';
import 'package:test_app/screens/pending_approval_screen.dart';
import 'package:test_app/services/database_service.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final userProvider = FutureProvider.autoDispose.family<UserModel, String>((ref, uid) {
  return DatabaseService().getUser(uid);
});

final adminAttributesProvider = FutureProvider<AdminAttributesModel>((ref) {
  return DatabaseService().getAdminAttributes();
});

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          final userFuture = ref.watch(userProvider(user.uid));
          return userFuture.when(
            data: (userModel) {
              if (userModel.status == 'pending') {
                return const PendingApprovalScreen();
              }
              if (userModel.role == 'admin') {
                return const AdminMainScreen();
              }
              return const ClientMainScreen();
            },
            loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
            error: (error, stackTrace) => Scaffold(body: Center(child: Text('Error: $error'))),
          );
        }
        return const LoginScreen();
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stackTrace) => Scaffold(body: Center(child: Text('Error: $error'))),
    );
  }
}