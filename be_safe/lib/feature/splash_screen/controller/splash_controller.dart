import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/bottom_bar/bottom_bar_widget.dart';

class SplashController extends StateNotifier<void> {
  SplashController() : super(null);

  void navigateAfterDelay(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const BottomBarWidget(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }
}
