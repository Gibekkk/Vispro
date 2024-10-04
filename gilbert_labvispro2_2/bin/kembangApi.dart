import 'dart:io';
import '../lib/colorCode.dart' as color;
import 'gilbert_labvispro2_2.dart' as main;

final Map<String, List<String>> fireworkFrame = {
  '1': [
    // Frame pertama: Kembang api muncul (kecil)
    '       *       ',
    '      * *      ',
    '     * * *     ',
    '      * *      ',
    '       *       ',
  ],
  '2': [
    // Frame kedua: Kembang api mulai membesar
    '       *       ',
    '     * * *     ',
    '    * * * *    ',
    '     * * *     ',
    '       *       ',
  ],
  '3': [
    // Frame ketiga: Ledakan sedang terjadi
    '      * *      ',
    '    * * * *    ',
    '   * * * * *   ',
    '    * * * *    ',
    '      * *      ',
  ],
  '4': [
    // Frame keempat: Ledakan lebih intens
    '      * *      ',
    '   * * * * *   ',
    '  * * * * * *  ',
    '   * * * * *   ',
    '      * *      ',
  ],
  '5': [
    // Frame kelima: Puncak ledakan
    '     * * *     ',
    '  * * * * * *  ',
    ' * * * * * * * ',
    '  * * * * * *  ',
    '     * * *     ',
  ],
  '6': [
    // Frame keenam: Mulai meredup dari puncak
    '      * * *      ',
    '   * * * * * *   ',
    '  * * * * * * *  ',
    '   * * * * * *   ',
    '      * * *      ',
  ],
  '7': [
    // Frame ketujuh: Ledakan mulai menghilang
    '       * *       ',
    '     * * * *     ',
    '    * * * * *    ',
    '     * * * *     ',
    '       * *       ',
  ],
  '8': [
    // Frame kedelapan: Semakin menghilang
    '       * *       ',
    '     * * * *     ',
    '     * * * *     ',
    '     * * * *     ',
    '       * *       ',
  ],
  '9': [
    // Frame kesembilan: Hampir hilang
    '       *         ',
    '      * *        ',
    '     * * *       ',
    '      * *        ',
    '       *         ',
  ],
  '10': [
    // Frame kesepuluh: Menghilang sepenuhnya
    '                 ',
    '                 ',
    '                 ',
    '                 ',
    '                 ',
  ],
};

// Function buat pindahin kursor ke koordinat tertentu
void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

// Function buat nge-print frame menggunakan fireworkFrame
void printFireworkFrame(
    String frameKey, int centerX, int centerY, colorSelects) {
  List<String> frame = fireworkFrame[frameKey] ?? [];
  String bgColor =
      color.getBackgroundColor(colorSelects[1]); // Ambil warna latar belakang
  // String fontColor = int.parse(frameKey) % 2 == 0 ? color.RESET + colorSelects[1] : bgColor + color.BLACK;
  String fontColor = bgColor + color.BLACK;
  if (int.parse(frameKey) % 2 == 0) bgColor = color.RESET;
  for (var i = 0; i < frame.length; i++) {
    moveTo(centerY - (frame.length ~/ 2) + i, centerX - (frame[i].length ~/ 2));
    String line = frame[i];
    for (var char in line.split('')) {
      // if (char == ' ') {
      //   stdout.write(bgColor +
      //       ' ' +
      //       color.RESET); // Gunakan warna latar belakang untuk spasi
      // } else {
      //   stdout.write(
      //       fontColor + char + color.RESET); // Gunakan warna untuk karakter
      // }
      stdout.write(fontColor + char + color.RESET);
    }
  }
}

// Function buat nge-clear layar
void clearScreen() {
  stdout.write('\x1B[2J\x1B[0;0H');
}

void changeBackground(String colorSelect) {
  print(color.getBackgroundColor(colorSelect));
  clearScreen();
}

Future<void> kembangApi(centerX, centerY, colorSelects) async {
  String fontColor = colorSelects[1];
  clearScreen();
  for (int i = 1; i <= fireworkFrame.length; i++) {
    // if (i % 2 == 0) {
    //   changeBackground(color.BLACK);
    // } else {
    //   changeBackground(fontColor);
    // }
    changeBackground(fontColor);
    printFireworkFrame(i.toString(), centerX, centerY, colorSelects);
    await main.delay(1000 ~/ fireworkFrame.length); // Delay 300 milidetik
    // clearScreen();
  }
}
