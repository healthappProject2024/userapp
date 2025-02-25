import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/therapist_message/domain/entity/message.dart';
import 'package:userapp/utils/resources/error/failures.dart';

abstract interface class MessageRepository {
  Future<Either<Failures, List<Message>>> fetchMessage();
}