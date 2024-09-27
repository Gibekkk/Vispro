import 'dart:io';
import "dart:math" show pi;

kerja() {
  try {
    stdout.write("Masukkan Diameter Kebun: ");
    double? jariJari = int.parse(stdin.readLineSync()!) / 2;
    stdout.write("Luas Kebun: ${pi * jariJari * jariJari}");
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

void main() {
  kerja();
}
