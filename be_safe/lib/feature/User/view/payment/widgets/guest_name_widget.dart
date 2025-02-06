import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';

class GuestNameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Guest Name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'First',
                  labelStyle: TextStyle(color: AppColors.blackColor),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppColors.blackColor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppColors.blackColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppColors.blackColor)),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Last',
                  labelStyle: TextStyle(color: AppColors.blackColor),
                  border: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 1, color: AppColors.blackColor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 1, color: AppColors.blackColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 1, color: AppColors.blackColor)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
