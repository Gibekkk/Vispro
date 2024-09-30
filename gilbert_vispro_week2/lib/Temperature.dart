import 'dart:io';

class Temperature {
  double? _temperature;

  Temperature(double temperature) {
    this._temperature = temperature;
  }

  double getTemperature() { return this._temperature!; }

  double toReamure(double temperature) {
    return temperature * 4 / 5;
  }

  double toFahrenheit(double temperature) {
    return (temperature * 9 / 5) + 32;
  }

  double toKelvin(double temperature) {
    return temperature + 273;
  }

  double temperatureConvert() {
    stdout.write("""Pilihan Suhu:
  1. Reamur
  2. Fahrenheit
  3. Kelvin
  Masukkan Pilihan: """);
    int? pilihan = int.parse(stdin.readLineSync()!);
    switch (pilihan) {
      case 1:
        this._temperature = toReamure(this._temperature!);
        print("Temperatur (Reamur): ${getTemperature()}");
        break;
      case 2:
        this._temperature = toFahrenheit(this._temperature!);
        print("Temperatur (Fahrenheit): ${getTemperature()}");
        break;
      case 3:
        this._temperature = toKelvin(this._temperature!);
        print("Temperatur (Kelvin): ${getTemperature()}");
        break;
      default:
        this._temperature = toReamure(this._temperature!);
        print("Temperatur (Reamur): ${getTemperature()}");
    }
    return this._temperature!;
  }
}
