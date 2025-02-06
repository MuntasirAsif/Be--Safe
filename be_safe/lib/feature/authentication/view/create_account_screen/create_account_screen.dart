import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../constant/color_string.dart';
import '../../../../../constant/image_string.dart';
import '../../../../../constant/text_string.dart';
import 'create_account_form.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background image
            SizedBox(
              child: Image.asset(
                createAccountBg,
                height: device.height * 0.4,
                width: device.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: device.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(device.height * 0.163),
                  Text(
                    createAccount,
                    style: textTheme.headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 52),
                  ),
                  Gap(device.height * 0.05),
                  // Profile Picture Section
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage(profileImageCircle),
                      ),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.iconColor,
                      size: 30,
                    ),
                  ),
                  const CreateAccountForm(), // Form section
                  const Gap(16),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(cancel, style: textTheme.bodyLarge),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
