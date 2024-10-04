import 'dart:io';
import '../lib/colorCode.dart' as color;
import 'gilbert_labvispro2_2.dart' as main;

final Map<String, List<String>> fireworkFrame = {
  '1': [ // Frame pertama: Kembang api muncul
    '       *       ',
    '      * *      ',
    '     * * *     ',
    '      * *      ',
    '       *       ',
  ],
  '2': [ // Frame kedua: Kembang api meledak
    '       *       ',
    '     * * *     ',
    '   * * * * *   ',
    '     * * *     ',
    '       *       ',
  ],
  '3': [ // Frame ketiga: Ledakan penuh
    '      * * *      ',
    '   * * * * * *   ',
    ' * * * * * * * * ',
    '   * * * * * *   ',
    '      * * *      ',
  ],
};

// Function buat pindahin kursor ke koordinat tertentu
void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

// Function buat nge-print frame menggunakan fireworkFrame
void printFireworkFrame(String frameKey, int centerX, int centerY, colorSelects) {
  List<String> frame = fireworkFrame[frameKey] ?? [];
  String bgColor = color.getBackgroundColor(colorSelects[1]); // Ambil warna latar belakang
  String fontColor = frameKey == '2' ? color.RESET + colorSelects[1] : bgColor + color.BLACK;
  if(frameKey == '2') bgColor = color.RESET;
  for (var i = 0; i < frame.length; i++) {
    moveTo(centerY - (frame.length ~/ 2) + i, centerX - (frame[i].length ~/ 2));
    String line = frame[i];
    for (var char in line.split('')) {
      if (char == ' ') {
        stdout.write(bgColor + ' ' + color.RESET); // Gunakan warna latar belakang untuk spasi
      } else {
        stdout.write(fontColor + char + color.RESET); // Gunakan warna untuk karakter
      }
    }
  }
}

// Function buat nge-clear layar
void clearScreen() {
  stdout.write('\x1B[2J\x1B[0;0H');
}

Future<void> kembangApi(centerX, centerY, colorSelects) async {
  String fontColor = colorSelects[1];
  clearScreen();

  // Frame 1: Kembang api muncul
  print(color.getBackgroundColor(fontColor));
  clearScreen();
  printFireworkFrame('1', centerX, centerY, colorSelects);
  await main.delay(300); // Delay 300 milidetik

  // Frame 2: Kembang api mulai meledak
  clearScreen();
  print(color.BG_BLACK);
  clearScreen();
  printFireworkFrame('2', centerX, centerY, colorSelects);
  await main.delay(300);

  // Frame 3: Ledakan penuh
  clearScreen();
  print(color.getBackgroundColor(fontColor));
  clearScreen();
  printFireworkFrame('3', centerX, centerY, colorSelects);
  await main.delay(300);
  print(color.BG_BLACK + color.RESET);
  clearScreen();
}
