import 'package:flutter/material.dart';
import '../../../../../constant/color_string.dart';

class CustomPopUpMenu extends StatefulWidget {
  const CustomPopUpMenu({super.key});

  @override
  State<CustomPopUpMenu> createState() => _CustomPopUpMenuState();
}

class _CustomPopUpMenuState extends State<CustomPopUpMenu> with SingleTickerProviderStateMixin {
  String selectedPack = 'Choose Item';
  List<String> packList = [
    '1 Room, 1 Adults',
    '1 Room, 2 Adults',
    '1 Room, 3 Adults',
    '1 Room, 4 Adults',
    '1 Room, 5 Adults',
    '1 Room, 6 Adults',
    '2 Room, 2 Adults',
    '2 Room, 3 Adults',
    '2 Room, 4 Adults',
    '2 Room, 5 Adults',
    '2 Room, 6 Adults',
    '3 Room, 3 Adults',
    '3 Room, 4 Adults',
    '3 Room, 5 Adults',
    '3 Room, 6 Adults',
    '3 Room, 7 Adults',
    '3 Room, 8 Adults',
    '3 Room, 9 Adults',
    '3 Room, 10 Adults',
  ];

  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: device.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grayIconBorder),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              if (_isExpanded)
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
            ],
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _togglePopupMenu(),
                child: SizedBox(
                  height: 65.0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: device.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.person_outline, color: AppColors.iconColor, size: 28),
                              const SizedBox(width: 8),
                              Text(selectedPack, style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_down, color: AppColors.iconColor, size: 28),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizeTransition(
                sizeFactor: _animation,
                axisAlignment: -1.0,
                child: Container(
                  color: Colors.white,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.5,
                  ),
                  child: Scrollbar(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: packList.map((String choice) {
                        return ListTile(
                          title: Text(choice),
                          onTap: () {
                            setState(() {
                              selectedPack = choice;
                              _isExpanded = false;
                              _animationController.reverse();
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _togglePopupMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }
}
