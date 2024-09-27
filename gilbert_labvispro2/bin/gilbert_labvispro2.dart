import 'dart:io';

import 'package:gilbert_labvispro2/nomor1.dart' as nomor1;
import 'package:gilbert_labvispro2/nomor2.dart' as nomor2;
import 'package:gilbert_labvispro2/nomor3.dart' as nomor3;
import 'package:gilbert_labvispro2/nomor4.dart' as nomor4;
import 'package:gilbert_labvispro2/nomor5.dart' as nomor5;
import 'package:gilbert_labvispro2/nomor6.dart' as nomor6;
import 'package:gilbert_labvispro2/nomor7.dart' as nomor7;
import 'package:gilbert_labvispro2/nomor8.dart' as nomor8;
import 'package:gilbert_labvispro2/nomor9.dart' as nomor9;
import 'package:gilbert_labvispro2/nomor10.dart' as nomor10;
import 'package:gilbert_labvispro2/nomor11.dart' as nomor11;
import 'package:gilbert_labvispro2/nomor15.dart' as nomor15;

void main(List<String> arguments) {
  try {
    bool soalBenar = false;
    while (!soalBenar) {
      soalBenar = true;
      stdout.write("Pilih Nomor Yang Akan Dikerjakan (1-11, 15): ");
      int? nomor = int.parse(stdin.readLineSync()!);
      switch (nomor) {
        case 1:
          nomor1.kerja();
          break;
        case 2:
          nomor2.kerja();
          break;
        case 3:
          nomor3.kerja();
          break;
        case 4:
          nomor4.kerja();
          break;
        case 5:
          nomor5.kerja();
          break;
        case 6:
          nomor6.kerja();
          break;
        case 7:
          nomor7.kerja();
          break;
        case 8:
          nomor8.kerja();
          break;
        case 9:
          nomor9.kerja();
          break;
        case 10:
          nomor10.kerja();
          break;
        case 11:
          nomor11.kerja();
          break;
        case 15:
          nomor15.kerja();
          break;
        default:
          stdout.write("Soal Invalid!\n");
          soalBenar = false;
          break;
      }
    }
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}
