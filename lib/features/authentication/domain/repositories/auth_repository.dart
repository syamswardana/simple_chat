import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_chat/features/authentication/domain/entities/app_user.dart';

abstract class AuthRepository {
  Future<AppUser?> signInWithGoogle();

  Future<void> signOut();

  Stream<User?> get authStateChanges;

  Future<AppUser?> getCurrentUser();
}
