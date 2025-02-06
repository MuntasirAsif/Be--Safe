import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import '../../constant/image_string.dart';

class BackOptionButton extends StatelessWidget {
  const BackOptionButton({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text,style: textTheme.bodyLarge,),
        Gap(device.width*0.03),
        const Image(image: AssetImage(nextPageIcon))
      ],);
  }
}