import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/home/data/model/users_model.dart';
import 'package:userapp/features/therapist/home/domain/entity/users.dart';
import 'package:userapp/utils/const/remote_data_source_const/remote_data_source_helper.dart';
import 'package:userapp/utils/resources/error/failures.dart';

abstract interface class FindUsersRemoteDataSource {
  Stream<Either<Failures, List<Users>>> findUsers({required String therapistName});
}

class FindUsersRemoteDataSourceImpl implements FindUsersRemoteDataSource {
  final FirebaseFirestore firestore;

  FindUsersRemoteDataSourceImpl(this.firestore);

  @override
  Stream<Either<Failures, List<Users>>> findUsers({required String therapistName}) {
    try {
      return firestore.collection(RemoteDataSourceHelper.accountCollectionName)
          .where('role', isEqualTo: 'user')
          .where('therapistName', isEqualTo: therapistName) 
          .snapshots()
          .map<Either<Failures, List<Users>>>((snapshot) { 
        final users = snapshot.docs.map((doc) {
          final data = doc.data();
          return UsersModel(
            uid: doc.id,
            name: data['name'] ?? '',
            profileurl: data['profileurl'] ?? '',
          );
        }).toList();

        return right(users); 
      }).handleError((error) {
        return left(Failures(message:  error.toString())); 
      });
    } catch (e) {
      return Stream.value(left(Failures(message:  e.toString()))); // Handling exceptions
    }
  }
}
