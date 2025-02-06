import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  Color iconColor;

  CustomTextField({super.key, required this.labelText, required this.icon, this.iconColor= AppColors.iconColor});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus || _controller.text.isNotEmpty;
      });
    });
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          cursorHeight: 25,
          style:textTheme.titleMedium,

          decoration: InputDecoration(
            filled: false,
            prefixIcon: Icon(widget.icon, color: widget.iconColor),
            contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColors.grayIconBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: _isFocused ? Colors.blue : AppColors.grayIconBorder, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColors.grayIconBorder, width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          left: 40.0, // Adjust the horizontal position
          top: _isFocused ? 3.0 : 20.0, // Adjust vertical position when focused
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              widget.labelText,
              style: TextStyle(
                color: AppColors.labelTextColor,
                fontWeight: FontWeight.bold,
                fontSize: _isFocused ? 12:15, // Adjust font size as needed
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }
}
