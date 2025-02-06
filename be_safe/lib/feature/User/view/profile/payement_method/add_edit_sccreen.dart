import 'package:be_safe/widgets/common_widgets/button.dart';

import '../../../../../model/payment_method.dart';
import 'package:flutter/material.dart';

class AddEditCardScreen extends StatelessWidget {
  final bool isEdit;
  final PaymentMethod? paymentMethod;

  const AddEditCardScreen({Key? key, this.isEdit = false, this.paymentMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardHolderController = TextEditingController(text: paymentMethod?.cardHolder ?? '');
    final cardNumberController = TextEditingController(text: paymentMethod?.cardNumber ?? '');
    final expiryDateController = TextEditingController(text: paymentMethod?.expiryDate ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Card' : 'Add Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cardHolderController,
              decoration: const InputDecoration(
                labelText: 'Card Holder',
                hintText: 'Enter card holder name',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Card Number',
                hintText: 'Enter card number',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: expiryDateController,
                    decoration: const InputDecoration(
                      labelText: 'Valid Thru',
                      hintText: 'MM/YY',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      hintText: '***',
                    ),
                    obscureText: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
                child: ButtonWidget(text: 'Save Changes',))
          ],
        ),
      ),
    );
  }
}
