import 'dart:io';

kerja() {
  try {
    int tarifPertama = 2000,
        durasiPertama = 2,
        tarifSelanjutnya = 1000,
        totalTarif = 0;
    stdout.write("Masukkan Durasi Parkir: ");
    int? durasi = int.parse(stdin.readLineSync()!);
    int i = 0;
    while (i < durasi) {
      totalTarif += (i < durasiPertama) ? tarifPertama : tarifSelanjutnya;
      i++;
    }
    stdout.write("Total Tarif: Rp. ${totalTarif}");
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

void main() {
  kerja();
}
