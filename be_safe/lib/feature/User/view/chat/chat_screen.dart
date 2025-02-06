
import 'package:be_safe/feature/User/view/chat/message_screen/message_screen.dart';
import 'package:be_safe/widgets/Card/chat_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../constant/text_string.dart';
import '../../../../model/hotel_model.dart';
import '../../repository/hotel_repository.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Future<List<HotelModel>>? hotels;
  FirebaseAuth firebaseAuth =FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> conversationList = [];
  late CollectionReference conversationCollection;

  @override
  void initState() {

    hotels = HotelRepository().getAllHotels();
    fetchChatList();
    if (kDebugMode) {
      print(conversationList);
    }
    getHotelsInConversations().then((filteredHotels) {
      // Use the filteredHotels as needed (e.g., update the UI)
      debugPrint("Filtered Hotels: ${filteredHotels.length}");
    });
    super.initState();
  }
  Future<List<HotelModel>> getHotelsInConversations() async {
    try {
      // Fetch conversation list
      await fetchChatList();

      // Get all hotels
      List<HotelModel> allHotels = await HotelRepository().getAllHotels();

      // Filter hotels that are available in the conversation list
      List<HotelModel> filteredHotels = allHotels.where((hotel) {
        // Check if the hotelId matches any document ID in the conversationList
        return conversationList.any((doc) => doc.id == hotel.hotelId);
      }).toList();

      return filteredHotels;
    } catch (e) {
      debugPrint("Error fetching hotels in conversations: $e");
      return [];
    }
  }
  Future<void> fetchChatList() async {
    try {
      // Ensure the user is authenticated
      String? uId = firebaseAuth.currentUser?.uid;
      if (uId == null) {
        debugPrint("Error: User not authenticated.");
        return;
      } else {
        debugPrint("Authenticated User ID: $uId");
      }

      // Define the Firestore collection path
      String path = 'chats/$uId/list';  // Correctly use the authenticated user's ID
      debugPrint("Fetching chat list from: $path");

      // Get the collection
      conversationCollection = _firebaseFirestore
          .collection('chats')
          .doc(uId)  // Use the authenticated user's UID to fetch their specific chat
          .collection('list');

      // Fetch the documents
      QuerySnapshot snapshot = await conversationCollection.get();

      // Check if any documents were fetched
      if (snapshot.docs.isEmpty) {
        debugPrint("No conversations found.");
        return;
      }

      // Store the documents in the list
      conversationList = snapshot.docs;

      // Debug: Log the fetched documents
      for (var doc in conversationList) {
        debugPrint("Document ID: ${doc.id}, Data: ${doc.data()}");
      }
    } catch (e) {
      // Log the error
      debugPrint("Error fetching chat list: $e");
    }
  }





  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          chat,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: FutureBuilder<List<HotelModel>>(
            future: hotels,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.hasData) {
                List<HotelModel> hotels = snapshot.data!;
                return Column(
                  children: hotels.map((hotel) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageScreen(receiverName: hotel.name, receiverId: hotel.hotelId,)));
                      },
                      child: ChatCard(
                        image: hotel.imageUrl.first,
                        name: hotel.name,
                        lastSms: 'Okay Done Sir',
                        time: '9:15 am',
                      ),
                    );
                  }).toList(),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
