import 'package:flutter/material.dart';

import '../../../../../../constant/color_string.dart';


class CategoryDropdown extends StatefulWidget {
  final String initialCategory;
  final Function(String) onCategorySelected;

  const CategoryDropdown({
    super.key,
    required this.initialCategory,
    required this.onCategorySelected,
  });

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorSchemes = Theme.of(context).colorScheme;
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          _selectedCategory = value;
        });
        widget.onCategorySelected(value); // Pass selected value back to parent
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        _buildStyledMenuItem('1', '1-Star'),
        _buildStyledMenuItem('2', '2-Star'),
        _buildStyledMenuItem('3', '3-Star'),
        _buildStyledMenuItem('4', '4-Star'),
        _buildStyledMenuItem('5', '5-Star'),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.bgGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$_selectedCategory Star',
              style: textTheme.bodyLarge!.copyWith(color: AppColors.blackColor),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_drop_down,color: AppColors.blackColor),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildStyledMenuItem(String value, String label) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.amberAccent,
            size: 20,
          ),
          const SizedBox(width: 8),
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
