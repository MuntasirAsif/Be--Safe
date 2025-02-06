import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final int value; // Change type to int for animation

  const OverviewCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  _OverviewCardState createState() => _OverviewCardState();
}

class _OverviewCardState extends State<OverviewCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Duration of the animation
      vsync: this,
    )..forward();

    _animation = IntTween(
      begin: 0,
      end: widget.value,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Animation curve
    ));
  }

  @override
  void didUpdateWidget(OverviewCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.reset();
      _controller.forward();
      _animation = IntTween(
        begin: 0,
        end: widget.value,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: isDarkMode?colorScheme.surface:AppColors.bgGray,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(widget.icon, size: 40, color: AppColors.iconColor),
                const SizedBox(height: 10),
                Text(widget.label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Text(
                  _animation.value.toString(),
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
