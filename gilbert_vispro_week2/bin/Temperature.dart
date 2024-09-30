import 'dart:io';
import 'package:gilbert_vispro_week2/Temperature.dart';
void main(){
  stdout.write("Masukkan Temperatur (Celcius): ");
  Temperature temperatur = new Temperature(double.parse(stdin.readLineSync()!));
  temperatur.temperatureConvert();
}