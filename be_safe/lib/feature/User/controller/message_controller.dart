import 'package:flutter/material.dart';
import '../../../model/message_model.dart';
import '../repository/message_repository.dart';

class MessageController extends ChangeNotifier {
  final MessageRepository _repository = MessageRepository();

  List<MessageModel> _messages = [];
  bool _isLoading = false;

  List<MessageModel> get messages => _messages;
  bool get isLoading => _isLoading;

  /// Fetch messages for a specific chat room
  Future<void> fetchMessages(String chatRoomId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _messages = await _repository.fetchMessages(chatRoomId);
    } catch (e) {
      debugPrint('Error fetching messages: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Send a message
  Future<void> sendMessage(String chatRoomId, MessageModel message) async {
    try {
      await _repository.sendMessage(chatRoomId, message);
      _messages.insert(0, message); // Add the new message to the local list
      notifyListeners();
    } catch (e) {
      debugPrint('Error sending message: $e');
    }
  }

  /// Listen to real-time message updates
  Stream<List<MessageModel>> messageStream(String chatRoomId) {
    return _repository.messageStream(chatRoomId);
  }
}
