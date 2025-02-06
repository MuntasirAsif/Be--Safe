import 'package:be_safe/constant/text_string.dart';
import 'package:be_safe/widgets/Card/back_option_button.dart';
import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../constant/color_string.dart';
import '../../../../../constant/image_string.dart';
import '../create_account_screen/create_account_screen.dart';
import '../login_screen/login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 111,
                height: 111,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: AppColors.whiteColor,
                    width: 5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage(logo),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Gap(deviceHeight * 0.02),
            Text(
              beSafe,
              style: textTheme.displayLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 52),
            ),
            Gap(deviceHeight * 0.02),

            Gap(deviceHeight * 0.2),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccountScreen()));
                },
                child: ButtonWidget(
                  text: letsGetStarted,
                )),
            Gap(deviceHeight * 0.02),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen())),
              child: const BackOptionButton(
                text: iAlreadyHaveAnAccount,
              ),
            ),
            Gap(deviceWidth * 0.2),
          ],
        ),
      ),
    );
  }
}
