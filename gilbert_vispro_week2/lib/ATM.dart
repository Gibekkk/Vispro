class ATM {
  int? _balance;

  ATM(int balance) {
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
