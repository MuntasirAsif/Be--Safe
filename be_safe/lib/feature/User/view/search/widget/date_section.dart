import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../constant/color_string.dart';

class DateSection extends StatefulWidget {
  final Size device;

  const DateSection({
    super.key,
    required this.device,
  });

  @override
  State<DateSection> createState() => _DateSectionState();
}

class _DateSectionState extends State<DateSection> {
  DateTimeRange? selectedDateRange;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: selectedDateRange ??
          DateTimeRange(
            start: now,
            end: now.add(const Duration(days: 1)),
          ),
      firstDate: now,
      lastDate: DateTime(now.year + 1),
      barrierColor: AppColors.bgColor,
      builder: (BuildContext context, Widget? child) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            height: widget.device.height * 0.7,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.baseColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Select Date Range',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: AppColors.iconColor,
                        ),
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: child!,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateRangeText = 'Check-in - Check-out';
    if (selectedDateRange != null) {
      dateRangeText =
      '${DateFormat('MMM dd, yyyy').format(selectedDateRange!.start)} - ${DateFormat('MMM dd, yyyy').format(selectedDateRange!.end)}';
    }

    return GestureDetector(
      onTap: () => _selectDateRange(context),
      child: Container(
        height: 70.0,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayIconBorder),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.device.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: AppColors.iconColor,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      dateRangeText,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.labelTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
