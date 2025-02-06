import 'package:flutter/material.dart';
import 'package:be_safe/widgets/Card/key_feature_card.dart';

class KeyFeature extends StatefulWidget {
  final List<String> keyFeature;

  const KeyFeature({
    super.key,
    required this.keyFeature,
  });

  @override
  State<KeyFeature> createState() => _KeyFeatureState();
}

class _KeyFeatureState extends State<KeyFeature> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3,
          ),
          itemCount: widget.keyFeature.length,
          itemBuilder: (context, index) {
            return KeyFeatureCard(
              title: widget.keyFeature[index],
            );
          },
        ),
      ],
    );
  }
}
