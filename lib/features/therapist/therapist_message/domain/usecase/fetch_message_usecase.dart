import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/therapist_message/domain/entity/message.dart';
import 'package:userapp/features/therapist/therapist_message/domain/repository/message_repository.dart';
import 'package:userapp/utils/resources/error/failures.dart';

class FetchMessageUsecase {
  final MessageRepository messageRepository;
  FetchMessageUsecase(this.messageRepository);
  Future<Either<Failures, List<Message>>> call()async {
    return await messageRepository.fetchMessage();
  }
}