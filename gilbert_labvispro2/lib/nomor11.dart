import 'dart:io';

kerja() {
  try {
    int energiChatting = 1, energiVideo = 2, energiGame = 3;
    int menitChatting = 60, menitVideo = 30, menitGame = 45;
    int durasiChatting = 5, durasiVideo = 5, durasiGame = 5;
    int baterai = 100, totalEnergi = 0;
    totalEnergi += ((menitChatting / durasiChatting) * energiChatting).round();
    totalEnergi += ((menitVideo / durasiVideo) * energiVideo).round();
    totalEnergi += ((menitGame / durasiGame) * energiGame).round();
    baterai -= totalEnergi;
    stdout.write("Sisa Baterai: ${baterai}%");
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

void main() {
  kerja();
}
