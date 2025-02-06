import 'package:be_safe/constant/text_string.dart';
import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:flutter/material.dart';
import '../../../../../model/payment_model.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentModel payment;

  const PaymentScreen({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hotel Name: ${payment.customerName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Amount: \$${payment.amount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Date: ${payment.date}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Status: ${payment.status}',
              style: TextStyle(
                fontSize: 16,
                color: payment.status == 'Pending' ? Colors.orange : Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sender: $beSafe admin',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            ButtonWidget(text: 'Confirm Payment',),
          ],
        ),
      ),
    );
  }
}
