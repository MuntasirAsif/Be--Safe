import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PasswordRecoveryOption extends StatelessWidget {
  const PasswordRecoveryOption({super.key, required this.isSelected, required this.title});

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(5),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSelected? AppColors.selectOptionColor:AppColors.unselectOptionColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(device.width*0.04),
            Text(title,style: textTheme.titleMedium!.copyWith(color: isSelected?AppColors.selectOptionMarkerColor:AppColors.blackColor,fontWeight: FontWeight.bold),),
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.whiteColor,
              child: CircleAvatar(
                backgroundColor: isSelected? AppColors.selectOptionMarkerColor:AppColors.unselectOptionMarkerColor,
                radius: 15,
                child: isSelected?const Icon(Icons.check,color: AppColors.whiteColor,):const SizedBox(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
