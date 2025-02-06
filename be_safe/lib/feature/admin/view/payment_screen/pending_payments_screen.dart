import 'package:be_safe/feature/admin/view/payment_screen/widgets/payment_card.dart';
import 'package:flutter/material.dart';
import '../../../../model/payment_model.dart';
import '../admin_dash_board/widgets/overview_card.dart';

class PendingPaymentsScreen extends StatelessWidget {
  const PendingPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PaymentModel> pendingPayments = List.generate(
      5,
          (index) => PaymentModel(
        paymentId: 'PENDING1234$index',
        customerName: 'Customer $index',
        amount: 120.0 + (index * 20),
        status: 'Pending',
        date: '2024-09-20',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Hotel Payments'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: OverviewCard(
                icon: Icons.sell_outlined,
                label: 'Pending Hotel Payments',
                value: 6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pendingPayments.length,
                itemBuilder: (context, index) {
                  return PaymentCard(
                    payment: pendingPayments[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
