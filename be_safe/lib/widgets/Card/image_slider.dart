import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;
  const ImageSlider({super.key, required this.images});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;


  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.images.length,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) {
            return Image.network(
              widget.images[index],
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Center(
                  child: Text('Failed to load image'),
                );
              },
            );
          },
        ),
        // Left Arrow Icon
        Align(
          alignment: const Alignment(-0.9,0),
          child: GestureDetector(
            onTap: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.blackColor.withOpacity(0.5),
              child: const Icon(
                Icons.arrow_left,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Right Arrow Icon
        Align(
          alignment: const Alignment(0.9,0),
          child: GestureDetector(
            onTap: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.blackColor.withOpacity(0.5),
              child: const Icon(
                Icons.arrow_right,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Page Indicators
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
                  (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.black : Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}