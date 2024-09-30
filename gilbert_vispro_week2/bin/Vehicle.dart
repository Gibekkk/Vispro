import 'dart:io';
import 'package:gilbert_vispro_week2/Vehicle.dart';
void main() {
  stdout.write("""Pilihan Kendaraan:
  1. Mobil
  2. Sepeda
  Masukkan Pilihan: """);
  int? pilihan = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan Nama Kendaraan: ");
  String? name = stdin.readLineSync()!;
  stdout.write("Masukkan Kecepatan Kendaraan: ");
  int? speed = int.parse(stdin.readLineSync()!);
  switch (pilihan) {
    case 1:
      Car kendaraan = new Car(name, speed);
      kendaraan.move();
      break;
    case 2:
      Bike kendaraan = new Bike(name, speed);
      kendaraan.move();
      break;
  }
}