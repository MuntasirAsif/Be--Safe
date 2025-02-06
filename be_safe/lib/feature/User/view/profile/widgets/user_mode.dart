import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:be_safe/mode_controller/mode_controller.dart';
import '../../../../../constant/color_string.dart';
import '../../../../house_owner_screens/view/my_house_screen/edit_house_info/edit_hotel_screen.dart';

class UserMode extends ConsumerWidget {
  const UserMode({
    super.key,
    required this.textTheme,
    required this.sellerStatus,
  });

  final TextTheme textTheme;
  final String sellerStatus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isPending = sellerStatus == 'Pending';
    bool isRegistered = sellerStatus == 'Active';
    final isHouseOwnerMode = ref.watch(modeControllerProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: SwitchListTile(
          activeColor: AppColors.iconColor,
          inactiveThumbColor: Colors.grey,
          title: Text(
            isHouseOwnerMode ? "House Owner Mode" : "User Mode",
            style: textTheme.titleMedium,
          ),
          subtitle: Text(
            isHouseOwnerMode
                ? "You are managing properties."
                : "You are browsing as a user.",
            style: textTheme.bodyMedium,
          ),
          value: isHouseOwnerMode,
          onChanged: (bool value) {
            if (value) {
              if (isRegistered) {
                ref.read(modeControllerProvider.notifier).toggleMode();
              } else {
                if (isPending) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Your request is in review.')));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditHotelScreen(
                                hotel: null,
                                isRegistered: isRegistered,
                                houseOwner: null,
                              )));
                }
              }
            } else {
              // If switching back to "User Mode", just toggle the mode
              ref.read(modeControllerProvider.notifier).toggleMode();
            }
          },
          secondary: Icon(
            isHouseOwnerMode ? Icons.house_rounded : Icons.person_outline,
            color: isHouseOwnerMode ? AppColors.iconColor : Colors.grey,
            size: 30,
          ),
        ),
      ),
    );
  }
}
