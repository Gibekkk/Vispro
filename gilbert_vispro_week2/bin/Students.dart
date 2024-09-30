import 'dart:io';
import 'package:gilbert_vispro_week2/Students.dart';
void main() {
  stdout.write("Masukkan Nama Mahasiswa: ");
  String? name = stdin.readLineSync()!;
  stdout.write("Masukkan ID Mahasiswa: ");
  String? studentID = stdin.readLineSync()!;
  stdout.write("Masukkan Nilai: ");
  int? grade = int.parse(stdin.readLineSync()!);

  Students siswa = new Students(name, studentID, grade);
  siswa.printData();
}
