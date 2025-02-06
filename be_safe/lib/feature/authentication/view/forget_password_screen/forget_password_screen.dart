import 'package:be_safe/feature/authentication/view/forget_password_screen/sms_otp/otp_screen.dart';
import 'package:be_safe/feature/authentication/view/forget_password_screen/widgets/password_recovery_option.dart';
import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/image_string.dart';
import '../../../../../constant/text_string.dart';
import 'email_recovery/email_recovery_link.dart';
import 'widgets/header_section.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  int selectionId = 0;
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
                fit: BoxFit
                    .fitHeight, // Adjusts how the image is fitted in the background
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
                      title: passwordRecovery,
                      subtitle: passwordRecoverySubtitle,
                    ),
                    Gap(device.height * 0.05),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: device.width * .05),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  selectionId = 1;
                                });
                              },
                              child: PasswordRecoveryOption(
                                isSelected: selectionId == 1,
                                title: sms,
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  selectionId = 2;
                                });
                              },
                              child: PasswordRecoveryOption(
                                isSelected: selectionId == 2,
                                title: email,
                              )),
                        ],
                      ),
                    ),
                    Gap(device.height * 0.15),
                    InkWell(
                        onTap: () {
                          if (selectionId == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OtpScreen()));
                          } else if (selectionId == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EmailRecoveryLink()));
                          } else {}
                        },
                        child: ButtonWidget(text: next)),
                    Gap(device.height * 0.02),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Center(
                          child: Text(
                        cancel,
                        style: textTheme.bodyLarge,
                      )),
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
