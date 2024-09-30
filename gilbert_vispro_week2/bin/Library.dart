import 'dart:io';
import 'package:gilbert_vispro_week2/Library.dart';
void main() {
  Library perpus = new Library();
  perpus.addBook(new Book("Buku 1", "Ko Rei", 2001));
  perpus.addBook(new Book("Buku 2", "Aaron", 2020));
  perpus.addBook(new Book("Buku 3", "Derick", 2021));
  perpus.addBook(new Book("Valorant", "Tino", 2024));
  perpus.addBook(new Book("How To Rizz", "Aryo", 2030));
  perpus.displayBooks();

  bool exit = false;
  while (!exit) {
    stdout.write("""Pilihan Fitur:
  1. Add Book
  2. Remove Book
  3. Display Book
  4. Exit
  Masukkan Pilihan: """);
    int? pilihan = int.parse(stdin.readLineSync()!);
    switch (pilihan) {
      case 1:
        perpus.insertBook();
        break;
      case 2:
        perpus.deleteBook();
        break;
      case 3:
        perpus.displayBooks();
        break;
      case 4:
      default:
        exit = true;
    }
  }
  print("Program dihentikan!");
}
