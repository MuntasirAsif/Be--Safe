import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constant/color_string.dart';
import '../../constant/image_string.dart';
import '../../provider/StateNotifierProvider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.read(splashControllerProvider.notifier).navigateAfterDelay(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: AppColors.whiteColor,
              width: 8,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage(logo),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
