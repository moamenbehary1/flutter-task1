



class BankAccount {
  String _accountNumber;
  double _balance;

  BankAccount(this._accountNumber, [this._balance = 0]);

  double get balance => _balance;
  String get accountNumber => _accountNumber;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Successfully deposited ${amount.toStringAsFixed(2)}.');
    } else {
      print('Error: Deposit amount must be greater than zero.');
    }
  }

  bool withdraw(double amount) {
    if (amount <= 0) {
      print('Error: Withdrawal amount must be greater than zero.');
      return false;
    }
    if (amount > _balance) {
      print('Transaction failed: no enough money');
      return false;
    }
    _balance -= amount;
    print('Successfully withdrew ${amount.toStringAsFixed(2)}.');
    return true;
  }
}
