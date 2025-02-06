import 'package:flutter/material.dart';
import '../../../../../constant/color_string.dart';
import '../../../../../constant/text_string.dart';
import '../../../../../widgets/common_widgets/button.dart';
import '../../../../../widgets/text_field_widget/custom_text_field.dart';

class CouponSection extends StatelessWidget {
  final bool isCouponAvailable;
  const CouponSection({super.key, required this.isCouponAvailable});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final device = MediaQuery.of(context).size;
    return Container(
      child: isCouponAvailable
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: device.width * 0.65,
                    child: CustomTextField(
                      labelText: couponCode,
                      icon: Icons.discount_outlined,
                      iconColor: AppColors.labelTextColor,
                    )),
                SizedBox(
                    width: device.width * 0.25, child: ButtonWidget(text: apply,titleSize: 18,))
              ],
            )
          : Column(
              children: [
                Text(
                  isNotEligibleForCouponCode,
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Divider(
                  color: AppColors.blackColor,
                )
              ],
            ),
    );
  }
}
