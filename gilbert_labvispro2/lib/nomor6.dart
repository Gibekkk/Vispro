import 'dart:io';

kerja() {
  try {
    int gaji = 4000000, bonus = 200000, bonusTrigger = 40;
    stdout.write("Masukkan Jam Kerja Per Minggu: ");
    int? jamKerja = int.parse(stdin.readLineSync()!);
    stdout
        .write("Gaji: Rp. ${(jamKerja > bonusTrigger) ? gaji + bonus : gaji}");
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

void main() {
  kerja();
}
