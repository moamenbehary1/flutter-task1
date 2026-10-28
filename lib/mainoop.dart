void main() {
  print('====================================');
  print('          TASK 1: ENCAPSULATION      ');
  print('====================================');
  BankAccount myAccount = BankAccount('ACC00192837', 500);
  print('Account Number: ${myAccount.accountNumber}');
  print('Initial Balance: ${myAccount.balance}');
  myAccount.deposit(150);
  print('Current Balance: ${myAccount.balance}');
  myAccount.withdraw(200);
  print('Current Balance: ${myAccount.balance}');
  myAccount.withdraw(1000);
  print('Current Balance: ${myAccount.balance}\n');

  print('====================================');
  print('          TASK 2: INHERITANCE        ');
  print('====================================');
  Car myCar = Car('Toyota', 'Camry', 2022, 4);
  myCar.displayCarDetails();
  print('');

  print('====================================');
  print('          TASK 3: ABSTRACTION        ');
  print('====================================');
  PaymentMethod cardPayment = CreditCardPayment('4532819022341198');
  cardPayment.pay(150);
  PaymentMethod cashPayment = CashPayment();
  cashPayment.pay(85);
  print('');

  print('====================================');
  print('          TASK 4: POLYMORPHISM       ');
  print('====================================');
  List<NotificationService> notifications = [
    EmailNotification('moamen@example.com', 'Welcome to our platform!'),
    SmsNotification('+201012345678', 'Your OTP code is 4829.'),
    PushNotification('device_token_abc123', 'New direct message received.'),
  ];
  for (var notification in notifications) {
    notification.sendNotification();
  }
  print('');

  print('====================================');
  print('          TASK 5: SHOPPING CART      ');
  print('====================================');
  ShoppingCart cart = ShoppingCart();
  Product laptop = Electronics('Laptop', 1200);
  Product phone = Electronics('Smartphone', 800);
  Product jacket = Clothing('Winter Jacket', 150);
  Product shirt = Clothing('T-Shirt', 40);

  cart.addProduct(laptop);
  cart.addProduct(phone);
  cart.addProduct(jacket);
  cart.addProduct(shirt);

  print('--- Initial Shopping Cart ---');
  cart.displayCart();

  print('\nRemoving Smartphone...');
  cart.removeProduct(phone);

  print('\n--- Updated Shopping Cart ---');
  cart.displayCart();
}

// ==========================================
// TASK 1 — ENCAPSULATION
// ==========================================
class BankAccount {
  String _accountNumber;
  int _balance;

  BankAccount(this._accountNumber, int initialBalance)
      : _balance = initialBalance >= 0 ? initialBalance : 0;

  int get balance => _balance;
  String get accountNumber => _accountNumber;

  void deposit(int amount) {
    if (amount > 0) {
      _balance += amount;
      print('Successfully deposited $amount');
    } else {
      print('Deposit amount must be greater than zero.');
    }
  }

  bool withdraw(int amount) {
    if (amount <= 0) {
      print('Withdrawal amount must be greater than zero.');
      return false;
    }
    if (amount > _balance) {
      print('Withdrawal failed: Insufficient funds. Current balance is $_balance');
      return false;
    }
    _balance -= amount;
    print('Successfully withdrew $amount');
    return true;
  }
}

// ==========================================
// TASK 2 — INHERITANCE
// ==========================================
class Vehicle {
  String brand;
  String model;
  int year;

  Vehicle(this.brand, this.model, this.year);

  void displayDetails() {
    print('Brand: $brand, Model: $model, Year: $year');
  }
}

class Car extends Vehicle {
  int numberOfDoors;

  Car(String brand, String model, int year, this.numberOfDoors)
      : super(brand, model, year);

  void displayCarDetails() {
    displayDetails();
    print('Number of Doors: $numberOfDoors');
  }
}

// ==========================================
// TASK 3 — ABSTRACTION
// ==========================================
abstract class PaymentMethod {
  void pay(int amount);
}

class CreditCardPayment extends PaymentMethod {
  String cardNumber;

  CreditCardPayment(this.cardNumber);

  @override
  void pay(int amount) {
    if (amount <= 0) {
      print('Invalid payment amount.');
      return;
    }
    String maskedCard = cardNumber.length >= 4
        ? '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}'
        : cardNumber;
    print('Processing payment of $amount using Credit Card ($maskedCard)');
  }
}

class CashPayment extends PaymentMethod {
  @override
  void pay(int amount) {
    if (amount <= 0) {
      print('Invalid payment amount.');
      return;
    }
    print('Received cash payment of $amount');
  }
}

// ==========================================
// TASK 4 — POLYMORPHISM
// ==========================================
class NotificationService {
  void sendNotification() {
    print('Sending notification...');
  }
}

class EmailNotification extends NotificationService {
  String email;
  String message;

  EmailNotification(this.email, this.message);

  @override
  void sendNotification() {
    print('Sending Email to $email: $message');
  }
}

class SmsNotification extends NotificationService {
  String phoneNumber;
  String message;

  SmsNotification(this.phoneNumber, this.message);

  @override
  void sendNotification() {
    print('Sending SMS to $phoneNumber: $message');
  }
}

class PushNotification extends NotificationService {
  String deviceToken;
  String message;

  PushNotification(this.deviceToken, this.message);

  @override
  void sendNotification() {
    print('Sending Push Notification to device [$deviceToken]: $message');
  }
}

// ==========================================
// TASK 5 — SHOPPING CART
// ==========================================
abstract class Product {
  String name;
  int price;

  Product(this.name, this.price);

  int calculateDiscount();

  int get finalPrice => price - calculateDiscount();
}

class Electronics extends Product {
  Electronics(String name, int price) : super(name, price);

  @override
  int calculateDiscount() {
    return (price * 0.10).toInt();
  }
}

class Clothing extends Product {
  Clothing(String name, int price) : super(name, price);

  @override
  int calculateDiscount() {
    return (price * 0.20).toInt();
  }
}

class ShoppingCart {
  List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
  }

  bool removeProduct(Product product) {
    return _products.remove(product);
  }

  int get totalPrice {
    int total = 0;
    for (var product in _products) {
      total += product.finalPrice;
    }
    return total;
  }

  void displayCart() {
    if (_products.isEmpty) {
      print('The cart is empty.');
      return;
    }

    for (var product in _products) {
      int discount = product.calculateDiscount();
      int netPrice = product.finalPrice;
      print(
        '${product.name} - Original: ${product.price} | Discount: $discount | Final: $netPrice',
      );
    }
    print('Total Price: $totalPrice');
  }
}