import 'package:flutter/material.dart';
import '../../../../../model/payment_model.dart';
import '../payment_screen.dart';

class PaymentCard extends StatelessWidget {
  final PaymentModel payment;

  const PaymentCard({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          payment.status == 'Pending' ? Icons.access_time : Icons.check_circle,
          color: payment.status == 'Pending' ? Colors.orange : Colors.green,
        ),
        title: Text(payment.customerName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount: \$${payment.amount.toStringAsFixed(2)}'),
            Text('Date: ${payment.date}'),
          ],
        ),
        trailing: SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                payment.status,
                style: TextStyle(
                  color: payment.status == 'Pending' ? Colors.orange : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.arrow_forward_ios_sharp),
            ],
          ),
        ),
        onTap: () => payment.status == 'Pending' ?Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentScreen(payment: payment,))):_showTransactionDetails(context), // Show dialog on tap
      ),
    );
  }

  void _showTransactionDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Transaction Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Customer Name: ${payment.customerName}'),
              Text('Amount: \$${payment.amount.toStringAsFixed(2)}'),
              Text('Date: ${payment.date}'),
              Text('Status: ${payment.status}'),
              // Add more fields as necessary
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
