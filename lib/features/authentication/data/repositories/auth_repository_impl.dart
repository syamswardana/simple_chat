import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_chat/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:simple_chat/features/authentication/domain/entities/app_user.dart';
import 'package:simple_chat/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserRemoteDatasource _userRemoteDatasource = UserRemoteDatasourceImpl();

  @override
  Future<AppUser?> signInWithGoogle() async {
    final googleUser = await _userRemoteDatasource.getGoogleUser();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCred = await _userRemoteDatasource.getUserCredential(credential);
    final user = userCred.user;
    if (user == null) return null;

    final userData = AppUser(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL ?? '',
      isOnline: true,
    );

    await _userRemoteDatasource.saveUserData(userData);

    return userData;
  }

  @override
  Future<void> signOut() async {
    final user = _userRemoteDatasource.currentUser;
    if (user != null) {
      _userRemoteDatasource.updateUserData(user.uid, {
        'isOnline': false,
        'lastActive': FieldValue.serverTimestamp(),
      });
    }
    await _userRemoteDatasource.signOutFirebase();
    await _userRemoteDatasource.signOutGoogle();
  }

  @override
  Stream<User?> get authStateChanges => _userRemoteDatasource.authStateChanges;

  @override
  Future<AppUser?> getCurrentUser() async {
    final currentUser = _userRemoteDatasource.currentUser;
    if(currentUser == null ) {
      return null;
    }
    final userData = await _userRemoteDatasource.getUserData(currentUser.uid);
    final appUser = AppUser.fromJson(userData.data()!);
    return appUser;
  }
}
