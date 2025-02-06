import 'package:be_safe/constant/text_string.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../feature/authentication/view/start_screen/start_screen.dart';
import '../../constant/color_string.dart';
import '../../constant/image_string.dart';

class LoginAdWidget extends StatelessWidget {
  const LoginAdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const StartScreen()));
      },
      child: Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: device.width * 0.02),
        decoration: BoxDecoration(
            color: AppColors.baseColor, borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  const Gap(5),
                  const Image(image: AssetImage(loginAdIcon)),
                  const Gap(10),
                  Text(
                    adTitle,
                    style: textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(5),
                  Text(
                    adSubtitle,
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium!
                        .copyWith(color: AppColors.whiteColor, fontSize: 14),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Divider(),
                Text(
                  adFooterTitle,
                  style: textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
