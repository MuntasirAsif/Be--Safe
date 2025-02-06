import 'package:be_safe/feature/User/view/profile/payement_method/add_edit_sccreen.dart';
import 'package:be_safe/feature/User/view/profile/payement_method/widgets/payment_method_card.dart';
import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:flutter/material.dart';
import '../../../../../model/payment_method.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  _PaymentMethodsScreenState createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  List<PaymentMethod> paymentMethods = [
    PaymentMethod(
        cardHolder: 'Amanda Morgan',
        cardNumber: '**** **** **** 1579',
        expiryDate: '12/22'),
    // Add more cards if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  return PaymentMethodCard(
                    paymentMethod: paymentMethods[index],
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddEditCardScreen()),
                      );
                    },
                    onDelete: () {
                      setState(() {
                        paymentMethods.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddEditCardScreen()),
                );
              },
              child: SizedBox(
                width: 200,
                child: ButtonWidget(
                  text: '+   Add New Card',
                  titleSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
