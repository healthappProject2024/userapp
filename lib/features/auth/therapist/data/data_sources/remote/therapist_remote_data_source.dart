import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:userapp/features/auth/therapist/data/model/therapist_model.dart';
import 'package:userapp/utils/const/remote_data_source_const/remote_data_source_helper.dart';
import 'package:flutter/foundation.dart';

abstract interface class TherapistRemoteDataSource {
  Future<TherapistModel?> therapistSignIn({
    required String email,
    required String password,
  });
}

class TherapistRemoteDataSourceImpl implements TherapistRemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _db;

  TherapistRemoteDataSourceImpl(this._auth, this._db);

  @override
  Future<TherapistModel?> therapistSignIn({
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

      // debugPrint("User ID: ${user.uid}");

      final docRef = _db
          .collection(RemoteDataSourceHelper.accountCollectionName)
          .doc(user.uid);

      final DocumentSnapshot<Map<String, dynamic>> document = await docRef.get();
      final data = document.data();

      if (document.exists && data != null && data['role'] == 'therapist') {
        final uid = user.uid;
        return TherapistModel.fromJson(data,uid);
      }
      throw Exception("User is not a therapist or does not exist.");
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
