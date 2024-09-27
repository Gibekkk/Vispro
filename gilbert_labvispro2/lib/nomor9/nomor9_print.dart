import 'dart:io';

kerja(var data) {
  int i = 0;
  stdout.write("List Barang:\n");
  while (i < data.length) {
    stdout.write("${i + 1}. ${data[i][0]}");
    if(i < data.length - 1) stdout.write("\n");
    i++;
  }
}
