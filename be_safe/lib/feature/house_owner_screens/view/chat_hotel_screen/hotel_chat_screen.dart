import 'package:flutter/material.dart';
import '../../../../constant/text_string.dart';
import '../../../../model/user_model.dart';
import '../../../../widgets/Card/chat_card.dart';
import '../../../User/repository/user_repository.dart';
import '../../../User/view/chat/message_screen/message_screen.dart';

class HotelChatScreen extends StatefulWidget {
  const HotelChatScreen({super.key});

  @override
  State<HotelChatScreen> createState() => _HotelChatScreenState();
}

class _HotelChatScreenState extends State<HotelChatScreen> {
  Future<List<UserModel>>? users;

  @override
  void initState() {
    users = UserRepository().getAllUsers();
    // TODO: implement initState
    super.initState();
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
          child: FutureBuilder<List<UserModel>>(
            future: users,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.hasData) {
                List<UserModel> hotels = snapshot.data!;
                return Column(
                  children: hotels.map((users) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageScreen(receiverName: users.name, receiverId: users.userID,)));
                      },
                      child: ChatCard(
                        image: users.profileImageUrl,
                        name: users.name,
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