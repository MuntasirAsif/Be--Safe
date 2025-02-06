import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    int balance =275255500;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Balance Overview'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the Balance OverviewCard
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4, // Adds shadow for a floating effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Balance',
                            style: textTheme.headlineMedium?.copyWith(
                              color: Colors.grey[700], // Subtle text color
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between text and balance
                          Text(
                            '$balance৳',
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold, // Emphasize balance
                            ),
                          ),
                        ],
                      ),
                      Image.asset('assets/images/admin_dashboard/925014.png',height: 100,width: 100,)
                    ],
                  ),
                ),
              ),
            )
,
            const Divider(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Example list of recent transactions
                  _buildTransactionItem('Payment to Megh Bari Resort', '-৳500', '2024-09-18'),
                  _buildTransactionItem('Payment from Customer 2', '+৳2500', '2024-09-17'),
                  _buildTransactionItem('Payment to Hotel Taj', '-৳1500', '2024-09-16'),
                  _buildTransactionItem('Payment from Customer 1', '+৳750', '2024-09-15'),
                ],
              ),
            ),

            const Divider(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Payments',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildUpcomingPaymentItem('Pending Payment', '\$800', '2024-09-30'),
                  _buildUpcomingPaymentItem('Paid Payment', '\$150', '2024-09-25'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display a single transaction item
  Widget _buildTransactionItem(String description, String amount, String date) {
    return ListTile(
      leading: Icon(
        amount.startsWith('-') ? Icons.remove_circle_outline : Icons.add_circle_outline,
        color: amount.startsWith('-') ? Colors.red : Colors.green,
      ),
      title: Text(description),
      subtitle: Text('Date: $date'),
      trailing: Text(
        amount,
        style: TextStyle(
          color: amount.startsWith('-') ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Widget to display a single upcoming payment item
  Widget _buildUpcomingPaymentItem(String description, String amount, String dueDate) {
    return ListTile(
      leading: const Icon(Icons.calendar_today_outlined, color: Colors.blue),
      title: Text(description),
      subtitle: Text('Due Date: $dueDate'),
      trailing: Text(
        amount,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
