import 'package:be_safe/feature/User/view/profile/personal_information/edit_profile_screen.dart';
import 'package:be_safe/feature/User/view/profile/settings/All%20Options/account_settings/account_settings_screen.dart';
import 'package:be_safe/constant/text_string.dart';
import 'package:be_safe/widgets/Card/profile_options.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'All Options/Security/security_screen.dart';
import 'All Options/theme/theme_mode.dart';

class Settings extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  final String phoneNo;
  final String address;
  final String dateOfBirth;
  final String profession;

  const Settings({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.dateOfBirth,
    required this.profession,
  });

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          settings,
          style:
              textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: device.width * 0.03),
            child: Text(
              personal,
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Gap(10),
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
                              address: email,
                              profession: profession,
                              dateOfBirth: dateOfBirth, sellerStatus: '',
                            )));
              },
              child: ProfileOptions(title: 'Profile')),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecurityScreen(
                              imageUrl: imageUrl,
                              name: name,
                              email: email,
                            )));
              },
              child: ProfileOptions(title: 'Security')),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountSettingsScreen(
                              imageUrl: imageUrl,
                              name: name,
                              email: email,
                            )));
              },
              child: ProfileOptions(title: 'Account Setting')),
          const Gap(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: device.width * 0.03),
            child: Text(
              'Others',
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Gap(10),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChangeTheme()));
              },
              child: ProfileOptions(title: 'Theme Mode')),
          ProfileOptions(title: 'Terms &Conditions')
        ],
      ),
    );
  }
}
