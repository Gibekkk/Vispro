import 'dart:io';

kerja() {
  try {
    int uang = 5000, hari = 30, tabungan = 0;
    int i = 0;
    while (i < hari) {
      tabungan += uang;
      i++;
    }
    stdout.write(
        "Total Tabungan Rp. ${uang} Selama ${hari} Hari: Rp. ${tabungan}");
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

void main() {
  kerja();
}