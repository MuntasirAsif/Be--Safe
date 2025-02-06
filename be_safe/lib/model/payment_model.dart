class PaymentModel {
  final String paymentId;
  final String customerName;
  final double amount;
  final String status;
  final String date;

  PaymentModel({
    required this.paymentId,
    required this.customerName,
    required this.amount,
    required this.status,
    required this.date,
  });
}
