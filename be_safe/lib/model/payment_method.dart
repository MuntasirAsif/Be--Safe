class PaymentMethod {
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;

  PaymentMethod({
    required this.cardHolder,
    required this.cardNumber,
    required this.expiryDate,
  });
}
