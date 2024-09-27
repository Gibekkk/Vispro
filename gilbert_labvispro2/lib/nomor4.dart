import 'dart:io';

kerja() {
  try {
    stdout.write("Masukkan Suhu (Celcius): ");
    double? celcius = double.parse(stdin.readLineSync()!);
    double fahrenheit = ((9 / 5) * celcius) + 32;
    stdout.write("Suhu Dalam Fahrenheit: ${fahrenheit}");
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

void main() {
  kerja();
}
