import 'package:be_safe/feature/User/view/notifications/screen/archived.dart';
import 'package:be_safe/feature/User/view/notifications/screen/earlier.dart';
import 'package:be_safe/feature/User/view/notifications/screen/recent.dart';
import 'package:be_safe/constant/color_string.dart';
import 'package:be_safe/constant/text_string.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              notification,
              style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    clearAll,
                    style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.iconColor, fontWeight: FontWeight.w600),
                  ))
            ],
            bottom: const TabBar(
              unselectedLabelColor: AppColors.labelTextColor,
              labelColor: AppColors.iconColor,
              indicatorColor: AppColors.blackColor,
              tabs: [
                Tab(text: recent),
                Tab(text: earlier),
                Tab(text: archived),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // All Doctors View
              Center(child: Recent()),

              // Category View
              Center(child: Earlier()),

              // Hospital View
              Center(child: Archived()),
            ],
          ),
        ),
      );

  }
}
