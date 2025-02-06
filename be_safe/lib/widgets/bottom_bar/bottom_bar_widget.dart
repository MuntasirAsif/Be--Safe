import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:be_safe/mode_controller/mode_controller.dart';
import 'package:be_safe/feature/User/view/chat/chat_screen.dart';
import 'package:be_safe/feature/User/view/my_booking/my_booking.dart';
import 'package:be_safe/feature/User/view/profile/profile_screen.dart';
import 'package:be_safe/feature/User/view/search/search_screen.dart';
import 'package:be_safe/constant/color_string.dart';
import '../../feature/Home_screen/home_screen.dart';
import '../../feature/house_owner_screens/view/chat_hotel_screen/hotel_chat_screen.dart';
import '../../feature/house_owner_screens/view/my_house_screen/my_house_screen.dart';
import '../../feature/house_owner_screens/view/stats_screen/stats_screen.dart';

class BottomBarWidget extends ConsumerStatefulWidget {
  const BottomBarWidget({
    super.key,
  });

  @override
  ConsumerState<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends ConsumerState<BottomBarWidget> {
  int _selectedIndex = 0;


  late final List<Widget> _consumerPages;
  late final List<Widget> _houseOwnerPages;

  @override
  void initState() {
    super.initState();

    _consumerPages = [
      const HomeScreen(),
      const SearchScreen(),
      const MyBooking(),
      const ChatScreen(),
      const ProfileScreen(),
    ];

    _houseOwnerPages = [
      const HomeScreen(),
      const HotelChatScreen(),
      const MyHouseScreen(),
      const StatsScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isHouseOwnerMode = ref.watch(modeControllerProvider);

    final activePages = isHouseOwnerMode ? _houseOwnerPages : _consumerPages;

    return Scaffold(
      body: activePages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              unselectedItemColor: AppColors.iconColor,
              selectedItemColor: colorScheme.secondary,
              selectedLabelStyle: TextStyle(
                color: colorScheme.secondary,
                fontWeight: FontWeight.bold,
                height: 0.0, // Adjust the height to decrease space
              ),
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: '—',
                ),
                BottomNavigationBarItem(
                  icon: Icon(isHouseOwnerMode ? Icons.message:Icons.search),
                  label: '—',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      isHouseOwnerMode ? Icons.apartment : Icons.newspaper),
                  label: isHouseOwnerMode ? '_' : '_',
                ),
                BottomNavigationBarItem(
                  icon: Icon(isHouseOwnerMode
                      ? Icons.bar_chart
                      : Icons.message),
                  label: isHouseOwnerMode ? '_' : '_',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person_4_outlined),
                  label: '—',
                ),
              ],
            ),
    );
  }
}
