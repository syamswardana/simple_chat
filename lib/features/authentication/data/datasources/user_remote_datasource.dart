import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simple_chat/features/authentication/domain/entities/app_user.dart';

abstract class UserRemoteDatasource {
  Future<GoogleSignInAccount?> getGoogleUser();

  Future<UserCredential> getUserCredential(AuthCredential credential);

  Future<void> saveUserData(AppUser user);

  Stream<User?> get authStateChanges;

  User? get currentUser;

  Future<void> updateUserData(String idUser, Map<String, dynamic> data);

  Future<GoogleSignInAccount?> signOutGoogle();

  Future<void> signOutFirebase();

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String idUser);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<GoogleSignInAccount?> getGoogleUser() async {
    return await _googleSignIn.signIn();
  }

  @override
  Future<UserCredential> getUserCredential(AuthCredential credential) async {
    return await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> saveUserData(AppUser user) async {
    return await _firestore
        .collection('users')
        .doc(user.uid)
        .set(user.toJson(), SetOptions(merge: true));
  }

  @override
  Future<void> updateUserData(String idUser, Map<String, dynamic> data) async {
    return await _firestore.collection('users').doc(idUser).update(data);
  }

  @override
  Future<GoogleSignInAccount?> signOutGoogle() async {
    return await _googleSignIn.signOut();
  }

  @override
  Future<void> signOutFirebase() async {
    return await _auth.signOut();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
    String idUser,
  ) async {
    return await _firestore.collection('users').doc(idUser).get();
  }

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  User? get currentUser => _auth.currentUser;
}
