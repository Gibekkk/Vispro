import 'dart:io';

kerja() {
  try {
    double energiAC = 1.5, energiTV = 0.2, energiLampu = 0.1, totalEnergi = 0;
    int jamAC = 8, jamTV = 5, jamLampu = 12;
    totalEnergi += energiAC * jamAC;
    totalEnergi += energiTV * jamTV;
    totalEnergi += energiLampu * jamLampu;
    stdout.write("Konsumsi Energi Per Hari: ${totalEnergi} kWh");
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

void main() {
  kerja();
}
