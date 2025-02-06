import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatefulWidget {
  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  String _selectedPayment = 'Bkash'; // Default selected payment

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select payment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPaymentOption('Bkash', 'https://seeklogo.com/images/B/bkash-logo-FBB258B90F-seeklogo.com.png'),
            _buildPaymentOption('Mastercard', 'https://logos-world.net/wp-content/uploads/2020/09/Mastercard-Logo.png'),
            _buildPaymentOption('Visa', 'https://1000logos.net/wp-content/uploads/2017/06/VISA-Logo-2006.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String option, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPayment = option;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedPayment == option ? Colors.pink : Colors.grey,
            width: _selectedPayment == option ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: _selectedPayment == option ? Colors.grey.shade300 : Colors.white,
        ),
        child: Image.network(
          imagePath,
          height: 40,
          width: 60,
        ),
      ),
    );
  }
}
