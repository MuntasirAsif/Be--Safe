import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../widgets/common_widgets/login_ad_widget.dart';
import 'Widget/discover_your_favourite_place.dart';
import 'Widget/home_screen_header.dart';
import 'Widget/trending_destinations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: device.width * 0.03),
              child: Column(
                children: [
                  Gap(device.height * 0.08),
                  HomeScreenHeader(textTheme: textTheme, device: device),
                  user!=null?const SizedBox():Column(
                    children: [
                      Gap(device.height * 0.05),
                      const LoginAdWidget(),
                    ],
                  ),
                ],
              ),
            ),
            Gap(device.height * 0.02),
            const TrendingDestinations(),
            Gap(device.height * 0.01),
            const DiscoverYourFavouritePlace(),
          ],
        ),
      ),
    );
  }
}

