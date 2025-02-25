import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/therapist_message/data/model/message_model.dart';
import 'package:userapp/utils/resources/error/failures.dart';

final messageCollectionName = "messages";

abstract interface class MessageRemoteDataSource {
  Future<Either<Failures, List<MessageModel>>> fetchMessages();
}

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  MessageRemoteDataSourceImpl(this.firebaseFirestore);

  @override
  Future<Either<Failures, List<MessageModel>>> fetchMessages() async {
    try {
      final querySnapshot =
          await firebaseFirestore.collection(messageCollectionName).get();

      final messages = querySnapshot.docs
          .map((doc) => MessageModel.fromFirestore(doc))
          .toList();
          print("message is :$messages");
      return Right(messages);
    } catch (e) {
      return Left(Failures(message: e.toString()));
    }
  }
}
