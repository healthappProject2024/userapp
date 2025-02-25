import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:userapp/features/therapist/therapist_message/domain/entity/message.dart';

class MessageModel extends Message {
  MessageModel({required super.message, required super.timestamp});

  factory MessageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageModel(
      message: data['message'] as String,
      timestamp: data['timestamp'] as Timestamp,
    );
  }
}
