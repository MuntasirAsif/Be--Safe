import 'package:flutter/material.dart';
import '../../../../../constant/color_string.dart';

class SelectRoomItem extends StatefulWidget {
  const SelectRoomItem({super.key});

  @override
  State<SelectRoomItem> createState() => _SelectRoomItemState();
}

class _SelectRoomItemState extends State<SelectRoomItem>
    with SingleTickerProviderStateMixin {
  static const int maxPersonsPerRoom = 4; // Maximum persons per room
  String selectedPack = '1 Room, 1 Adult';
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  int _rooms = 1;
  int _adults = 1;
  int _children = 0;

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
          width: device.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grayIconBorder),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _toggleExpand(),
                child: Container(
                  height: 70.0,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.grayIconBorder),
                    ),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: device.width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.person_outline,
                                  color: AppColors.iconColor, size: 30),
                              const SizedBox(width: 10),
                              Text(selectedPack,
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textColor)),
                            ],
                          ),
                          Icon(
                            _isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AppColors.iconColor,
                            size: 30,
                          ),
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
                  padding: const EdgeInsets.all(16),
                  child: Scrollbar(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildNumberPicker('Rooms', _rooms, 1, 5, (value) {
                          setState(() {
                            _rooms = value;
                            _updateSelectedPack();
                          });
                        }),
                        _buildNumberPicker('Adults', _adults, 1, _getMaxAllowedAdults(), (value) {
                          setState(() {
                            _adults = value;
                            _updateSelectedPack();
                          });
                        }),
                        _buildNumberPicker('Children', _children, 0, _getMaxAllowedChildren(), (value) {
                          setState(() {
                            _children = value;
                            _updateSelectedPack();
                          });
                        }),
                      ],
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

  Widget _buildNumberPicker(String label, int value, int minValue, int maxValue, ValueChanged<int> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textColor))),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline, size: 30, color: value > minValue ? AppColors.iconColor : AppColors.bgGrayFont),
                onPressed: () {
                  if (value > minValue) {
                    onChanged(value - 1);
                  }
                },
              ),
              Text('$value', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textColor)),
              IconButton(
                icon: Icon(Icons.add_circle_outline, size: 30, color: value < maxValue ? AppColors.iconColor : AppColors.bgGrayFont),
                onPressed: () {
                  if (value < maxValue) {
                    onChanged(value + 1);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  int _getMaxAllowedAdults() {
    int maxPersons = _rooms * maxPersonsPerRoom;
    return maxPersons - _children;
  }

  int _getMaxAllowedChildren() {
    int maxPersons = _rooms * maxPersonsPerRoom;
    return maxPersons - _adults;
  }

  void _updateSelectedPack() {
    setState(() {
      selectedPack =
      '$_rooms Room${_rooms > 1 ? 's' : ''}, $_adults Adult${_adults > 1 ? 's' : ''}${_children > 0 ? ', $_children Child${_children > 1 ? 'ren' : ''}' : ''}';
    });
  }
}
