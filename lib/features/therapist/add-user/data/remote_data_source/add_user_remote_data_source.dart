import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:userapp/features/therapist/add-user/data/model/user_model.dart';
import 'package:userapp/utils/const/remote_data_source_const/remote_data_source_helper.dart';

abstract interface class AddUserRemoteDataSource {
  Future<bool> adduser({
    required String name,
    required String email,
    required String password,
    required File imageFile,
    required String therapisName,
  });
}

class AddUserRemoteDataSourceImpl implements AddUserRemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _db;
  final FirebaseStorage _storage;

  AddUserRemoteDataSourceImpl({
    required FirebaseAuth auth,
    required FirebaseFirestore db,
    required FirebaseStorage storage,
  })  : _auth = auth,
        _db = db,
        _storage = storage;

  @override
Future<bool> adduser({
  required String name,
  required String email,
  required String password,
  required File imageFile,
  required String therapisName,
}) async {
  try {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user == null) {
      return false;
    }
    String uid = credential.user!.uid;
    Reference ref = _storage.ref().child('profileImages/$uid.jpg');
    TaskSnapshot snapshot = await ref.putFile(imageFile);
    String imageUrl = await snapshot.ref.getDownloadURL();
    UserModel user = UserModel(
      name: name,
      email: email,
      imageUrl: imageUrl,
      therapisName: therapisName,
    );

    await _db
        .collection(RemoteDataSourceHelper.accountCollectionName)
        .doc(uid)
        .set(user.toFirestore());
    return true;
  } catch (e) {
    // print("🔴 Unexpected Error: $e");
    return false;
  }
}
}
