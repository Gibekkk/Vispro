import 'dart:io';

kerja() {
  try {
    int hargaApel = 5000, hargaJeruk = 4000, totalHarga = 0;
    stdout.write("Masukkan Jumlah Apel: ");
    int? jumlahApel = int.parse(stdin.readLineSync()!);
    stdout.write("Masukkan Jumlah Jeruk: ");
    int? jumlahJeruk = int.parse(stdin.readLineSync()!);
    totalHarga = (jumlahApel * hargaApel) + (jumlahJeruk * hargaJeruk);
    stdout.write("Total Harga: Rp. ${totalHarga}");
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

void main() {
  kerja();
}
