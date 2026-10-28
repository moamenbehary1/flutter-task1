// ignore_for_file: avoid_print, unused_import

import 'dart:io';

import 'task1.dart';
import 'task2.dart';
import 'task3.dart';
import 'task4.dart';
import 'task5.dart';

void main() {
  // Task 1: Bank Account
  print('--- Create Bank Account ---');
  stdout.write('Enter Account Number: ');
  String accountNumber = stdin.readLineSync() ?? 'Unknown';

  stdout.write('Enter PIN: ');
  String pin = stdin.readLineSync() ?? '';

  if (pin != '1235') {
    print('Error: Incorrect PIN! Access denied.');
    return;
  }

  var myAccount = BankAccount(accountNumber);
  print('Successfully logged in and account created!');

  while (true) {
    print('\n--- Main Menu ---');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Check Balance');
    print('4. Exit');
    stdout.write('Choose an option (1-4): ');

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      stdout.write('Enter amount to deposit: ');
      double amount = double.tryParse(stdin.readLineSync() ?? '0') ?? 0.0;
      myAccount.deposit(amount);
    } else if (choice == '2') {
      stdout.write('Enter amount to withdraw: ');
      double amount = double.tryParse(stdin.readLineSync() ?? '0') ?? 0.0;
      myAccount.withdraw(amount);
    } else if (choice == '3') {
      print('Current Balance: ${myAccount.balance.toStringAsFixed(2)}');
    } else if (choice == '4') {
      print('Exiting...');
      break;
    } else {
      print('Invalid choice, please try again.');
    }
    print(
      '--------------------------------------------------------------------',
    );
  }
  // Task 2: Employee
  Developer dev = Developer('eng Mega', 10000000000000, 'Flutter');
 // اقبض الي انا عاوزه بقا 🤣🤣
 // 
  Designer designer = Designer('darch alrhanan', 200, 'Figma');

  dev.displayInfo();
  print('-------------------');
  designer.displayInfo();
  // Task 3: Payment Method
   // ياريت دا يكون المطلوب 
  PaymentMethod paymentMethod = CreditCardPayment(
    cardNumber: '51518791164174',
    cardHolderName: 'mega beeh',
    expiryDate: '2022-12-31',
    cvv: 123,
    otp: 4567,
  );
  paymentMethod.pay(100);
  paymentMethod = CashPayment(01025047038);
  paymentMethod.pay(50);
  // Task 4: Notification Service
  List<NotificationService> notifications = [
    EmailNotification('moamen send you an email click for more info'),
    SmsNotification('facebook cod is : 55875'),
    PushNotification('update your app'),
  ];

  for (var notification in notifications) {
    notification.sendNotification("");
  }
  // Task 5: Shopping Cart
  ShoppingCart cart = ShoppingCart();

  Product laptop = Electronics('Laptop', 1200);
  Product phone = Electronics('Smartphone', 800);
  Product jacket = Clothing('Winter Jacket', 150);
  Product shirt = Clothing('T-Shirt', 40);

  cart.addProduct(laptop);
  cart.addProduct(phone);
  cart.addProduct(jacket);
  cart.addProduct(shirt);

  print('--- Shopping Cart ---');
  cart.displayCart();

  print('Removing Smartphone...');
  cart.removeProduct(phone);

  print('--- Updated Shopping Cart ---');
  cart.displayCart();
}