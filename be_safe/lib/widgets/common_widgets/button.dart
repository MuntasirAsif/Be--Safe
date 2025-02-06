import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';

@immutable
class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {super.key,
      this.text = '',
      this.textColor = AppColors.whiteColor,
      this.buttonColor = AppColors.baseColor,
      this.titleSize = 22});
  Color buttonColor;
  Color textColor;
  double titleSize;
  final String text;
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness; // Check the current theme
    final bool isDark = brightness == Brightness.dark;
    return Container(
      height: 65,
      width: device.width * 0.9,
      decoration: BoxDecoration(
          color: isDark ? AppColors.baseColor : buttonColor,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text,
                style: textTheme.titleLarge!.copyWith(
                    color: isDark ? colorScheme.secondary : textColor,
                    fontSize: titleSize)),
          ],
        ),
      ),
    );
  }
}
