import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../constant/color_string.dart';
import 'package:be_safe/widgets/Card/key_feature_card.dart';

class KeyFeatureDropdown extends StatefulWidget {
  final List<String> keyFeature;
  List<String> selectedFeature;

  KeyFeatureDropdown({
    super.key,
    required this.keyFeature,
    required this.selectedFeature,
  });

  @override
  State<KeyFeatureDropdown> createState() => _KeyFeatureDropdownState();
}

class _KeyFeatureDropdownState extends State<KeyFeatureDropdown> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Adding a title for better user experience
        Text(
          'Key Features',
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,),
        ),
        const Gap(10), // Adds a small space below the title

        // Popup Menu Button
        PopupMenuButton<String>(
          onSelected: (String value) {
            setState(() {
              if (!widget.selectedFeature.contains(value)) {
                widget.selectedFeature.add(value); // Add selected value to the list
              }
            });
          },
          itemBuilder: (BuildContext context) => widget.keyFeature
              .asMap()
              .entries
              .map((entry) =>
              _buildStyledMenuItem((entry.key + 1).toString(), entry.value))
              .toList(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                ),
              ],
            ),
            child: Column(
              children: [
                // Display the GridView for selected features
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,  // Number of columns in the grid
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3,  // Adjust height and width of grid items
                  ),
                  itemCount: widget.selectedFeature.length,
                  itemBuilder: (context, index) {
                    return KeyFeatureCard(
                      title: widget.selectedFeature[index],
                    );
                  },
                ),
                const Gap(10), // Adds space between grid and icon

                // Add button icon
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.blackColor,
                      size: 24,
                    ),
                    Gap(8),
                    Text(
                      'Add Key Feature',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Custom styled menu item
  PopupMenuItem<String> _buildStyledMenuItem(String value, String label) {
    return PopupMenuItem<String>(
      value: label, // Use the label as the value, since that's the key feature
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
