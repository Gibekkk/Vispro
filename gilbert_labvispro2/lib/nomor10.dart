import 'dart:io';

kerja() {
  try {
    var customers = [
      "Nasabah A",
      "Nasabah B",
      "Nasabah C",
      "Nasabah D",
      "Nasabah E"
    ];
    int i = 0;
    stdout.write("Simulasi Loket:\n");
    while (i < customers.length) {
      print("${customers[i]} di Loket ${i % 2 + 1}");
      i++;
    }
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

void main() {
  kerja();
}
