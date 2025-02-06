import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String? messageContent;
  final String? imageUrl;
  final String senderId;
  final DateTime timestamp;
  final bool isBookNowMessage;

  MessageModel({
    this.messageContent,
    this.imageUrl,
    required this.senderId,
    required this.timestamp,
    this.isBookNowMessage = false,
  });

  // Convert Firestore document to MessageModel
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      messageContent: map['messageContent'],
      imageUrl: map['imageUrl'],
      senderId: map['isSentByMe'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      isBookNowMessage: map['isBookNowMessage'] ?? false,
    );
  }

  // Convert MessageModel to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'messageContent': messageContent,
      'imageUrl': imageUrl,
      'isSentByMe': senderId,
      'timestamp': Timestamp.fromDate(timestamp),
      'isBookNowMessage': isBookNowMessage,
    };
  }
}
