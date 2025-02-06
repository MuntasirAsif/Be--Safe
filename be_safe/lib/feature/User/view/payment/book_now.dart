import 'package:be_safe/feature/User/view/payment/widgets/agreement_widget.dart';
import 'package:be_safe/feature/User/view/payment/widgets/booking_conditions_widget.dart';
import 'package:be_safe/feature/User/view/payment/widgets/check_in_out_section.dart';
import 'package:be_safe/feature/User/view/payment/widgets/confirm_widget.dart';
import 'package:be_safe/feature/User/view/payment/widgets/coupon_section.dart';
import 'package:be_safe/feature/User/view/payment/widgets/guest_name_widget.dart';
import 'package:be_safe/feature/User/view/payment/widgets/hotel_room_info.dart';
import 'package:be_safe/feature/User/view/payment/widgets/payment_method_widget.dart';
import 'package:be_safe/feature/User/view/payment/widgets/price_calculations.dart';
import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../constant/text_string.dart';


class BookNow extends StatefulWidget {
  const BookNow({super.key});

  @override
  State<BookNow> createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  bool isCouponAvailable = true;

  int roomRate = 2500;
  int taxesFees = 50;
  int propertyFee = 200;

  @override
  Widget build(BuildContext context) {
    int roomTotal = roomRate + taxesFees;
    int totalPrice = roomTotal + propertyFee;
    final textTheme = Theme.of(context).textTheme;
    final device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          secureCheckout,
          style: textTheme.titleLarge!.copyWith(
              color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.baseColor,
        foregroundColor: AppColors.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              const HotelRoomInfo( hotelName: 'Hotel Mermaid',  location: "House 20, Road 17, Uttara 7, Dhaka, Bangladesh", rating: '5',),
              Gap(device.height * 0.05),
              CheckInOutSection(textTheme: textTheme),
              Gap(device.height * 0.03),
              PriceCalculations(
                  textTheme: textTheme,
                  roomRate: roomRate,
                  taxesFees: taxesFees,
                  roomTotal: roomTotal,
                  propertyFee: propertyFee,
                  totalPrice: totalPrice),
              Gap(device.height * 0.03),
              const CouponSection(isCouponAvailable: true),
              Gap(device.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(payment,style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      const Icon(Icons.lock),
                      Text(secureCheckout,style: textTheme.bodyLarge!.copyWith(color: AppColors.baseColor,fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
              Gap(device.height * 0.03),
              Text('$sendTo :',style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
              Gap(device.height * 0.01),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColors.bgGrayFont,
                      child: Icon(Icons.person,color: AppColors.whiteColor,size: 30,),
                    ),
                    const Gap(10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Merchant name',style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
                        Text('01xxxxxxxxx',style: textTheme.titleMedium),
                      ],
                    )
                  ],
                ),
              ),
              Gap(device.height*0.05),
              PaymentMethodWidget(),
              Gap(device.height*0.05),
              GuestNameWidget(),
              Gap(device.height*0.05),
              AgreementWidget(),
              const Divider(color: AppColors.blackColor,),
              const BookingConditionsWidget(),
              Gap(device.height*0.025),
              const ConfirmWidget()
            ],
          ),
        ),
      ),
    );
  }
}
