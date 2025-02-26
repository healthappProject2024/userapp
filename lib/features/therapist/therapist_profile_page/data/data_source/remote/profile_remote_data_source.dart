import 'package:firebase_auth/firebase_auth.dart';

abstract interface class ProfileRemoteDataSource {
  Future<void> signOut();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  ProfileRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw FirebaseAuthException(
        code: 'sign-out-failed',
        message: 'Failed to sign out: ${e.toString()}',
      );
    }
  }
}
