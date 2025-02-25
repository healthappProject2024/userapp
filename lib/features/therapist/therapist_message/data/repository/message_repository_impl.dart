import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/therapist_message/data/remote_data_source/meaage_remote_data_source.dart';
import 'package:userapp/features/therapist/therapist_message/domain/entity/message.dart';
import 'package:userapp/features/therapist/therapist_message/domain/repository/message_repository.dart';
import 'package:userapp/utils/resources/error/failures.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource messageRemoteDataSource;

  MessageRepositoryImpl(this.messageRemoteDataSource);

  @override
  Future<Either<Failures, List<Message>>> fetchMessage() async {
    try {
      final result = await messageRemoteDataSource.fetchMessages();
      return result;
    } catch (e) {
      return Left(Failures(message: e.toString()));
    }
  }
}
