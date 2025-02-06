import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../model/message_model.dart';

class MessageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _messageCollection => _firestore.collection('messages');

  /// Fetch messages from Firestore
  Future<List<MessageModel>> fetchMessages(String chatRoomId) async {
    try {
      final querySnapshot = await _messageCollection
          .doc(chatRoomId)
          .collection('chat')
          .orderBy('timestamp', descending: true)
          .get();

      return querySnapshot.docs.map((doc) {
        return MessageModel.fromMap(doc.data());
      }).toList();
    } catch (e) {
      throw Exception('Error fetching messages: $e');
    }
  }

  /// Send a message to Firestore
  Future<void> sendMessage(String chatRoomId, MessageModel message) async {
    try {
      await _messageCollection
          .doc(chatRoomId)
          .collection('chat')
          .add(message.toMap());
    } catch (e) {
      throw Exception('Error sending message: $e');
    }
  }

  /// Listen to real-time message updates
  Stream<List<MessageModel>> messageStream(String chatRoomId) {
    try {
      return _messageCollection
          .doc(chatRoomId)
          .collection('chat')
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return MessageModel.fromMap(doc.data());
        }).toList();
      });
    } catch (e) {
      throw Exception('Error listening to messages: $e');
    }
  }
}
