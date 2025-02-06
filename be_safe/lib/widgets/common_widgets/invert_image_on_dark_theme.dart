import 'package:flutter/material.dart';

class InvertAssetImageOnDarkTheme extends StatelessWidget {
  final String assetPath;
  final double? height;
  final double? width;

  const InvertAssetImageOnDarkTheme({
    super.key,
    required this.assetPath,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness; // Check the current theme

    return ColorFiltered(
      colorFilter: brightness == Brightness.dark
          ? const ColorFilter.matrix(<double>[
        -1,  0,  0,  0, 255, // Invert red
        0, -1,  0,  0, 255, // Invert green
        0,  0, -1,  0, 255, // Invert blue
        0,  0,  0,  1,   0, // Leave alpha unchanged
      ])
          : const ColorFilter.mode(
        Colors.transparent,
        BlendMode.multiply, // No filter in light mode
      ),
      child: Image.asset(
        assetPath,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
