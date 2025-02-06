import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../constant/image_string.dart';
import '../../../../../constant/text_string.dart';
import '../../../../../widgets/common_widgets/button.dart';
import '../forget_password_screen/widgets/header_section.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: device.height * 0.35,
            width: device.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(forgetPasswordBg),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: device.width * 0.05),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(device.height * 0.20),
                    const HeaderSection(
                      title: setupNewPassword,
                      subtitle: setupNewPasswordSubtitle,
                    ),
                    Gap(device.height * 0.05),
                    Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'New Password'
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(device.height * 0.02),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Repeat Password',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(device.height * 0.1),
                      ],
                    ),
                    InkWell(
                        onTap: (){

                        },
                        child: ButtonWidget(text: save)),
                    Gap(device.height * 0.02),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Center(
                        child: Text(
                          cancel,
                          style: textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
