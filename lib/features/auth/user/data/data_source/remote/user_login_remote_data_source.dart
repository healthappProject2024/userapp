import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:userapp/features/auth/user/data/model/user_account_model.dart';
import 'package:userapp/utils/const/remote_data_source_const/remote_data_source_helper.dart';

abstract interface class UserLoginRemoteDataSource {
  Future<UserAccountModel?> userSignIn({
    required String email,
    required String password,
  });
}

class UserLoginRemoteDataSourceImpl implements UserLoginRemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _db;

  UserLoginRemoteDataSourceImpl(this._auth, this._db);

  @override
  Future<UserAccountModel?> userSignIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;
      if (user == null) {
        throw Exception("Failed to sign in");
      }

      final docRef = _db
          .collection(RemoteDataSourceHelper.accountCollectionName)
          .doc(user.uid);

      final DocumentSnapshot<Map<String, dynamic>> document = await docRef.get();
      final data = document.data();

      if (document.exists && data != null && data['role'] == 'user') {
        return UserAccountModel.fromJson(data..['uid'] = user.uid);
      }

      throw Exception("User does not exist.");
    } on FirebaseAuthException catch (e) {
      debugPrint('Auth error: ${e.message}');
      throw Exception("Authentication failed: ${e.message}");
    } on FirebaseException catch (e) {
      debugPrint('Firestore error: ${e.message}');
      throw Exception("Database error: ${e.message}");
    } catch (e) {
      debugPrint('Unknown error: ${e.toString()}');
      throw Exception("Unknown error: ${e.toString()}");
    }
  }
}
