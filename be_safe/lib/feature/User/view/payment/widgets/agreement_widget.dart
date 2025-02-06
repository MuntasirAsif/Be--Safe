import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AgreementWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Agree & Purchase',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            text: 'By tapping Book Now I agree to the booking conditions (Tap below for details), ',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: 'Terms and Conditions',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle Terms and Conditions tap
                  },
              ),
              TextSpan(
                text: ', and ',
              ),
              TextSpan(
                text: 'Privacy policy',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle Privacy Policy tap
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
