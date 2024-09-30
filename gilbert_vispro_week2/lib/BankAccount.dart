class BankAccount {
  int? _balance;

  BankAccount(int balance) {
    this._balance = balance;
  }

  void setBalance(int balance) => this._balance = balance;
  int checkBalance() {
    return this._balance!;
  }

  void deposit(int nominal) {
    if (nominal >= 50000) {
      setBalance(checkBalance() + nominal);
      print("Deposit Success");
    } else {
      print("Deposit Fail");
    }
  }

  void withdraw(int nominal) {
    if (checkBalance() >= nominal && nominal >= 50000) {
      setBalance(checkBalance() - nominal);
      print("Withdraw Success");
    } else {
      print("Withdraw Fail");
    }
  }
}

class SavingsAccount extends BankAccount {
  double _interestRate = 1;
  SavingsAccount(int balance) : super(balance);

  void applyInterest() {
      setBalance(checkBalance() + ((checkBalance() * (this._interestRate / 100)).round()));
      print("Suku Bunga Ditambahkan!");
  }
}