import 'package:be_safe/feature/User/view/profile/settings/widgets/profile_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../constant/text_string.dart';
import '../../../../../../../widgets/Card/profile_options.dart';
import '../../../../../../authentication/view/create_new_password/create_new_password_screen.dart';
import '../../../../../../authentication/view/forget_password_screen/forget_password_screen.dart';



class SecurityScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  const SecurityScreen({super.key, required this.imageUrl, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          securitySetting,
          style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: device.width*0.03,vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileInfo(imageUrl: imageUrl, name: name, email: email,),
                const Gap(20),
                Text('Security',style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),

              ],
            ),
          ),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgetPasswordScreen()));
              },
              child: ProfileOptions(title: forgetPassword)),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateNewPasswordScreen()));
              },
              child: ProfileOptions(title: changePassword)),
        ],
      ),
    );
  }
}
