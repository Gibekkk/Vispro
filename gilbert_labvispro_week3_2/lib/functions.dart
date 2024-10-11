import 'dart:io'; // Import library untuk input/output
import 'dart:math'; // Import library untuk operasi matematika acak
import 'dart:async'; // Import library untuk mengatur asynchronous programming

// Fungsi untuk membersihkan layar terminal
void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); // Escape sequence untuk menghapus layar dan memindahkan kursor ke posisi 0;0
}

// Fungsi untuk delay dalam milidetik
Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds)); // Tunggu selama waktu yang ditentukan
}

// Fungsi untuk menghasilkan angka random antara min dan max (inclusive)
int random(int min, int max) {
  return min + Random().nextInt(max - min); // Hitung dan kembalikan angka random dalam rentang yang ditentukan
}

// Fungsi untuk menghasilkan angka random antara 0 dan max (exclusive)
int randomMax(int max) {
  return Random().nextInt(max); // Kembalikan angka random dari 0 hingga max-1
}

// Fungsi untuk mendapatkan ukuran terminal
getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines]; // Kembalikan ukuran kolom dan baris terminal
}

// Fungsi untuk memindahkan kursor ke baris dan kolom tertentu
void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H'); // Escape sequence untuk memindahkan kursor ke posisi yang ditentukan
}

void printFlag(){
  clearScreen();
  moveTo(0, 0);
  print("Thanks for waiting, but the flag is not here!");
}