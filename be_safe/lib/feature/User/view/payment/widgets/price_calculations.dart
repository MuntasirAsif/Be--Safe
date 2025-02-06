import 'package:flutter/material.dart';
import '../../../../../constant/text_string.dart';
import '../../../../../constant/color_string.dart';
class PriceCalculations extends StatelessWidget {
  const PriceCalculations({
    super.key,
    required this.textTheme,
    required this.roomRate,
    required this.taxesFees,
    required this.roomTotal,
    required this.propertyFee,
    required this.totalPrice,
  });

  final TextTheme textTheme;
  final int roomRate;
  final int taxesFees;
  final int roomTotal;
  final int propertyFee;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(roomRateText, style: textTheme.bodyMedium),
                Text("per night",
                    style: textTheme.bodySmall!.copyWith(
                        fontSize: 10, color: AppColors.labelTextColor)),
              ],
            ),
            Text(taxesFeesText, style: textTheme.bodyMedium),
            Text(roomTotalText,
                style: textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            Text(propertyFeeText, style: textTheme.bodyMedium),
            Text(totalPriceText,
                style: textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$bdt $roomRate",
                style: textTheme.bodyMedium!
                    .copyWith(color: AppColors.localDealFontColor)),
            Text("$bdt $taxesFees",
                style: textTheme.bodyMedium!
                    .copyWith(color: AppColors.localDealFontColor)),
            Text("$bdt $roomTotal",
                style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.localDealFontColor,
                    fontWeight: FontWeight.bold)),
            Text("$bdt $propertyFee",
                style: textTheme.bodyMedium!
                    .copyWith(color: AppColors.localDealFontColor)),
            Text("$bdt $totalPrice",
                style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.localDealFontColor,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}