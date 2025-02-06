import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../../../../../widgets/common_widgets/button.dart';
import 'package:be_safe/constant/color_string.dart';
import 'package:be_safe/constant/image_string.dart';
import 'package:be_safe/constant/text_string.dart';

import '../../controller/login_controller.dart';
import 'enter_password_screen/enter_password_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            height: device.height,
            width: device.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(loginScreenBg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: device.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(device.height * 0.55),
                  // Title
                  Text(
                    login,
                    style: textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 52),
                  ),
                  // Subtitle
                  Text(
                    loginScreenSubtitle,
                    style: textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color: brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.textColor),
                  ),
                  Gap(device.height * 0.05),
                  // Email Input
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: email),
                  ),
                  Gap(device.height * 0.03),
                  // Login Button
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EnterPasswordScreen(email:emailController.text.toString()),
                        ),
                      );
                    },
                    child: ButtonWidget(text: done),
                  ),
                  Gap(device.height * 0.01),
                  // Cancel button
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Center(
                      child: Text(
                        cancel,
                        style: textTheme.bodyLarge!
                            .copyWith(color: AppColors.blackColor),
                      ),
                    ),
                  ),
                  Gap(device.height * 0.05),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
