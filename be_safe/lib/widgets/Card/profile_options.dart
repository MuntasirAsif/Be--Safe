import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileOptions extends StatelessWidget {
  IconData? icon;
  final String title;
  ProfileOptions({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final device = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: device.width * 0.03),
      margin: EdgeInsets.symmetric(vertical: device.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon!=null?Icon(icon):const SizedBox(),
              icon!=null?const Gap(10):const SizedBox(),
              Text(
                title,
                style: textTheme.bodyLarge,
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios_sharp)
        ],
      ),
    );
  }
}
