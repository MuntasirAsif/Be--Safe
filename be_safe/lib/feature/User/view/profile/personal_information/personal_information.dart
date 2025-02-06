import 'package:be_safe/feature/User/view/profile/personal_information/edit_profile_screen.dart';
import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:flutter/material.dart';
import '../../../../../constant/color_string.dart';

class PersonalInformationScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  final String phoneNo;
  final String address;
  final String sellerStatus;
  final String profession;
  final String dateOfBirth;
  const PersonalInformationScreen(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.email,
      required this.phoneNo,
      required this.address,
      required this.profession,
      required this.dateOfBirth,
      required this.sellerStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  profession,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildInfoTile(Icons.email, "Email", email),
              _buildInfoTile(Icons.phone, "Phone", phoneNo),
              _buildInfoTile(Icons.location_city, "Location", address),
              _buildInfoTile(Icons.business_center, "Job Title", profession),
              _buildInfoTile(Icons.date_range, "Date of Birth", dateOfBirth),
              const SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileScreen(
                                  imageUrl: imageUrl,
                                  name: name,
                                  email: email,
                                  phoneNo: phoneNo,
                                  address: address,
                                  profession: profession,
                                  dateOfBirth: dateOfBirth,
                                  sellerStatus: sellerStatus,
                                )));
                  },
                  child: ButtonWidget(
                    text: 'Edit Information',
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.iconColor),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.grayIconBorder,
                ),
              ),
              Text(
                info,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
