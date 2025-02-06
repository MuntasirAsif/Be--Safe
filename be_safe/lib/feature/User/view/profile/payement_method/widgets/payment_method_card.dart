import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';

import '../../../../../../model/payment_method.dart';
class PaymentMethodCard extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PaymentMethodCard({
    super.key,
    required this.paymentMethod,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(Icons.credit_card, color: colorScheme.primary, size: 40),
        title: Text(paymentMethod.cardNumber),
        subtitle: Text('${paymentMethod.cardHolder} \nExpiry: ${paymentMethod.expiryDate}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: colorScheme.primary),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete, color:colorScheme.error),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
