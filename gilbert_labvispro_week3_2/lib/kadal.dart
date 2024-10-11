import 'dart:io';

import 'package:gilbert_labvispro_week3_2/functions.dart' as functions;

void kadalMaker(int panjangBadan, String arah, int xKepala, int yKepala) {
  int maxX = functions.getScreenSize()[0] - 3;
  int maxY = functions.getScreenSize()[1] - 3;
  int minX = 3;
  int minY = 3;
  if (xKepala < minX) xKepala = minX;
  if (xKepala > maxX) xKepala = maxX;
  if (yKepala < minY) yKepala = minY;
  if (yKepala > maxY) yKepala = maxY;
  functions.moveTo(yKepala, xKepala);
  stdout.write("Q");
  switch (arah) {
    case "atas":
      printKadalAtas(yKepala, xKepala, panjangBadan);
      break;
    case "bawah":
      printKadalBawah(yKepala, xKepala, panjangBadan);
      break;
    case "kanan":
      printKadalKanan(yKepala, xKepala, panjangBadan);
      break;
    case "kiri":
      printKadalKiri(yKepala, xKepala, panjangBadan);
      break;
  }
}

void printKadalAtas(int yKepala, int xKepala, int panjangBadan) {
  functions.moveTo(yKepala + 1, xKepala);
  stdout.write("#");
  functions.moveTo(yKepala + 1, xKepala - 1);
  stdout.write("#");
  functions.moveTo(yKepala + 1, xKepala - 2);
  stdout.write("#");
  functions.moveTo(yKepala + 1, xKepala + 1);
  stdout.write("#");
  functions.moveTo(yKepala + 1, xKepala + 2);
  stdout.write("#");
  for (int i = 0; i <= panjangBadan; i++) {
    functions.moveTo(yKepala + 1 + i, xKepala);
    stdout.write("#");
  }
  functions.moveTo(yKepala + panjangBadan + 2, xKepala);
  stdout.write("#");
  functions.moveTo(yKepala + panjangBadan + 2, xKepala - 1);
  stdout.write("#");
  functions.moveTo(yKepala + panjangBadan + 2, xKepala - 2);
  stdout.write("#");
  functions.moveTo(yKepala + panjangBadan + 2, xKepala + 1);
  stdout.write("#");
  functions.moveTo(yKepala + panjangBadan + 2, xKepala + 2);
  stdout.write("#");
  functions.moveTo(yKepala + panjangBadan + 3, xKepala);
  stdout.write("#");
}

void printKadalBawah(int yKepala, int xKepala, int panjangBadan) {
  functions.moveTo(yKepala - 1, xKepala);
  stdout.write("#");
  functions.moveTo(yKepala - 1, xKepala - 1);
  stdout.write("#");
  functions.moveTo(yKepala - 1, xKepala - 2);
  stdout.write("#");
  functions.moveTo(yKepala - 1, xKepala + 1);
  stdout.write("#");
  functions.moveTo(yKepala - 1, xKepala + 2);
  stdout.write("#");
  for (int i = 0; i <= panjangBadan; i++) {
    functions.moveTo(yKepala - 1 - i, xKepala);
    stdout.write("#");
  }
  functions.moveTo(yKepala - panjangBadan - 2, xKepala);
  stdout.write("#");
  functions.moveTo(yKepala - panjangBadan - 2, xKepala - 1);
  stdout.write("#");
  functions.moveTo(yKepala - panjangBadan - 2, xKepala - 2);
  stdout.write("#");
  functions.moveTo(yKepala - panjangBadan - 2, xKepala + 1);
  stdout.write("#");
  functions.moveTo(yKepala - panjangBadan - 2, xKepala + 2);
  stdout.write("#");
  functions.moveTo(yKepala - panjangBadan - 3, xKepala);
  stdout.write("#");
}

void printKadalKanan(int yKepala, int xKepala, int panjangBadan) {
  functions.moveTo(yKepala, xKepala - 1);
  stdout.write("#");
  functions.moveTo(yKepala - 1, xKepala - 1);
  stdout.write("#");
  functions.moveTo(yKepala - 2, xKepala - 1);
  stdout.write("#");
  functions.moveTo(yKepala + 1, xKepala - 1);
  stdout.write("#");
  functions.moveTo(yKepala + 2, xKepala - 1);
  stdout.write("#");
  for (int i = 0; i <= panjangBadan; i++) {
    functions.moveTo(yKepala, xKepala - 1 - i);
    stdout.write("#");
  }
  functions.moveTo(yKepala, xKepala - panjangBadan - 2);
  stdout.write("#");
  functions.moveTo(yKepala - 1, xKepala - panjangBadan - 2);
  stdout.write("#");
  functions.moveTo(yKepala - 2, xKepala - panjangBadan - 2);
  stdout.write("#");
  functions.moveTo(yKepala + 1, xKepala - panjangBadan - 2);
  stdout.write("#");
  functions.moveTo(yKepala + 2, xKepala - panjangBadan - 2);
  stdout.write("#");
  functions.moveTo(yKepala, xKepala - panjangBadan - 3);
  stdout.write("#");
}

void printKadalKiri(int yKepala, int xKepala, int panjangBadan) {
  functions.moveTo(yKepala, xKepala + 1);
  stdout.write("#");
  functions.moveTo(yKepala - 1, xKepala + 1);
  stdout.write("#");
  functions.moveTo(yKepala - 2, xKepala + 1);
  stdout.write("#");
  functions.moveTo(yKepala + 1, xKepala + 1);
  stdout.write("#");
  functions.moveTo(yKepala + 2, xKepala + 1);
  stdout.write("#");
  for (int i = 0; i <= panjangBadan; i++) {
    functions.moveTo(yKepala, xKepala + 1 + i);
    stdout.write("#");
  }
  functions.moveTo(yKepala, xKepala + panjangBadan + 2);
  stdout.write("#");
  functions.moveTo(yKepala - 1, xKepala + panjangBadan + 2);
  stdout.write("#");
  functions.moveTo(yKepala - 2, xKepala + panjangBadan + 2);
  stdout.write("#");
  functions.moveTo(yKepala + 1, xKepala + panjangBadan + 2);
  stdout.write("#");
  functions.moveTo(yKepala + 2, xKepala + panjangBadan + 2);
  stdout.write("#");
  functions.moveTo(yKepala, xKepala + panjangBadan + 3);
  stdout.write("#");
}

void jalan(String arah, int yKepala, int xKepala, int panjangBadan){
  functions.clearScreen();
  switch(arah){
    case "kanan":
      xKepala++;
      break;
    case "kiri":
      xKepala--;
      break;
    case "atas":
      yKepala--;
      break;
    case "bawah":
      yKepala++;
      break;
  }
  kadalMaker(panjangBadan, arah, xKepala, yKepala);
}

void main() async {
  functions.clearScreen();
  kadalMaker(2, "kiri", 15, 15);
  await functions.delay(500);
  jalan("kanan", 15, 15, 2);
  functions.moveTo(functions.getScreenSize()[1], 0);
}
