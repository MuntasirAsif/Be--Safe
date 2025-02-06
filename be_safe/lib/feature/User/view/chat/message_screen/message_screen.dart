import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../model/message_model.dart';
import '../../../../../widgets/Card/message_card.dart';

class MessageScreen extends StatefulWidget {
  final String receiverName;
  final String receiverId;
  const MessageScreen({super.key, required this.receiverName, required this.receiverId});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? firebaseUser = FirebaseAuth.instance.currentUser;

  late final CollectionReference senderCollection;
  late final CollectionReference receiverCollection;

  bool _isLoading = false; // Tracks image upload only

  @override
  void initState() {
    String? uid = firebaseUser?.uid;
    super.initState();
    senderCollection = _firestore.collection('/chats/$uid/list/${widget.receiverId}/messages');
    receiverCollection = _firestore.collection('chats/${widget.receiverId}/list/$uid/messages');
    print(receiverCollection);
    senderCollection.snapshots().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        print("Sender collection has data.");
      } else {
        print("Sender collection is empty.");
      }
    });

    receiverCollection.snapshots().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        print("Receiver collection has data.");
      } else {
        print("Receiver collection is empty.");
      }
    });

  }

  void _sendMessage({String? content, String? imageUrl}) async {
    if (content == null && imageUrl == null) return;

    String? uid = firebaseUser?.uid;

    final message = MessageModel(
      messageContent: content,
      imageUrl: imageUrl,
      timestamp: DateTime.now(),
      senderId: uid.toString(),
    );

    await senderCollection.add({
      'messageContent': message.messageContent,
      'imageUrl': message.imageUrl,
      'timestamp': message.timestamp.toIso8601String(),
      'isSentByMe': message.senderId,
    });
    await receiverCollection.add({
      'messageContent': message.messageContent,
      'imageUrl': message.imageUrl,
      'timestamp': message.timestamp.toIso8601String(),
      'isSentByMe': message.senderId,
    });

    _messageController.clear();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _isLoading = true; // Start loading when image is being uploaded
      });

      try {
        // Upload image to Firebase Storage
        final storageRef = FirebaseStorage.instance.ref();
        final imageRef = storageRef.child('message/${DateTime.now().millisecondsSinceEpoch}.jpg');
        await imageRef.putFile(File(pickedFile.path));

        // Get the image download URL
        final imageUrl = await imageRef.getDownloadURL();

        // Send the message with the image URL
        _sendMessage(imageUrl: imageUrl);
      } catch (e) {
        debugPrint("Error uploading image: $e");
      } finally {
        setState(() {
          _isLoading = false; // Stop loading after image upload
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String? uid = firebaseUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverName),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: senderCollection.orderBy('timestamp').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text("No messages yet."));
                    }

                    final List<MessageModel> messages = snapshot.data!.docs.map((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      return MessageModel(
                        messageContent: data['messageContent'],
                        imageUrl: data['imageUrl'],
                        timestamp: DateTime.parse(data['timestamp']),
                        senderId: data['isSentByMe'],
                      );
                    }).toList();

                    return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return MessageCard(
                          message: messages[index],
                          isSentByMe: messages[index].senderId == uid,
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.photo),
                      onPressed: _pickImage,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        if (_messageController.text.trim().isNotEmpty) {
                          _sendMessage(content: _messageController.text.trim());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_isLoading) // Show loading indicator only during image upload
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}


