import 'dart:io';
import 'package:gilbert_vispro_week2/ATM.dart';
void main() {
  ATM akun = new ATM(50000);
  bool exit = false;
  while (!exit) {
    stdout.write("""Pilihan Fitur:
  1. Check Balance
  2. Withdraw
  3. Deposit
  4. Exit
  Masukkan Pilihan: """);
    int? pilihan = int.parse(stdin.readLineSync()!);
    switch (pilihan) {
      case 1:
        print("Saldo Kamu: ${akun.checkBalance()}");
        break;
      case 2:
        stdout.write("Masukkan Nominal Withdraw: ");
        akun.withdraw(int.parse(stdin.readLineSync()!));
        break;
      case 3:
        stdout.write("Masukkan Nominal Deposit: ");
        akun.deposit(int.parse(stdin.readLineSync()!));
        break;
      case 4:
      default:
        exit = true;
    }
  }
  print("Program dihentikan!");
}
