import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:userapp/features/auth/therapist/data/model/therapist_model.dart';
import 'package:userapp/utils/const/remote_data_source_const/remote_data_source_helper.dart';

abstract interface class TherapistRemoteDataSource {
  Future<TherapistModel?> therapistSignIn(
      {required String email, required String password});
}

class TherapistRemoteDataSourceImpl implements TherapistRemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _db;

  TherapistRemoteDataSourceImpl({
    required FirebaseAuth auth,
    required FirebaseFirestore db,
  })  : _auth = auth,
        _db = db;

  @override
  Future<TherapistModel?> therapistSignIn(
      {required String email, required String password}) async {
            print("Entred in to data source");
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      print("user id ${user!.uid}");
      print("Entred in to user section");
      if (user != null) {
        final docRef = _db
            .collection(RemoteDataSourceHelper.accountCollectionName)
            .doc(user.uid);
        final DocumentSnapshot<Map<String, dynamic>> document =
            await docRef.get();
        if (document.exists) {
          final data = document.data();
          if (data != null && data['role'] == 'therapist') {
            return TherapistModel.fromJson(data);
          }
        }
      }
      return null;
    } catch (e) {
      print('Error signing in therapist: ${e.toString()}');
      return null;
    }
  }
}
