import 'package:flutter/material.dart';

class OverviewCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final int value;

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
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _animation = IntTween(
      begin: 0,
      end: widget.value,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = theme.brightness == Brightness.dark ? Colors.grey[850] : Colors.white;

    return Card(
      color: cardColor,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(widget.icon, size: 40, color: theme.iconTheme.color),
                const SizedBox(height: 10),
                Text(widget.label, style: theme.textTheme.bodySmall),
              ],
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Text(
                  '\$${_animation.value.toString()}',
                  style: theme.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
