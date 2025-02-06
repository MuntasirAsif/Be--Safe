import 'package:be_safe/feature/User/view/all_hotel/all_hotel_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../constant/color_string.dart';
import '../../../../constant/image_string.dart';
import '../../../../constant/text_string.dart';


class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
    required this.textTheme,
    required this.device,
  });

  final TextTheme textTheme;
  final Size device;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
   final bool isDark =  brightness == Brightness.dark;
    return Column(
      children: [
        const Center(
          child: CircleAvatar(
            radius: 70,
            backgroundImage:  AssetImage(logo),
          ),
        ),
        Text(
          beSafe,
          style: textTheme.displayLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        Gap(device.height*0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AllHotelScreen()));
              },
                child: iconWidget(device,hotelIcon,colorScheme,isDark)),
            iconWidget(device,carIcon,colorScheme,isDark),
          ],
        ),
      ],
    );
  }
  Container iconWidget(Size device,String image,ColorScheme colorScheme,bool isDark) {
    return Container(
      height: device.width*0.3,
      width: device.width*0.35,
      decoration: BoxDecoration(
          color: isDark?colorScheme.surface:AppColors.grayIconBg,
          border: Border.all(color: colorScheme.surface),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: SizedBox(
            height: device.width*0.3,
            width: device.width*0.35,
            child: Image(image: AssetImage(image)))
      ),
    );
  }
}