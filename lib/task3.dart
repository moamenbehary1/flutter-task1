

abstract class PaymentMethod {
  void pay(int amount);
}

class CreditCardPayment extends PaymentMethod {
  String cardHolderName;
  String cardNumber;
  String expiryDate;
  int cvv;
  int otp;

  CreditCardPayment({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
    required this.otp,
  });
  @override
  void pay(int amount) {
    print('Paying $amount using credit card $cardNumber');
  }
}

class CashPayment extends PaymentMethod {
  int cashNumber;
  CashPayment(this.cashNumber);
  @override
  void pay(int amount) {
    print('Paying $amount using cash $cashNumber');
  }
}
