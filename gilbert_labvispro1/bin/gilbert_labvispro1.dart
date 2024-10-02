import 'dart:math'; // Mengimpor library dart:math untuk menggunakan fungsi matematika
import 'dart:io'; // Mengimpor library dart:io untuk menggunakan fungsi input/output
import 'package:gilbert_labvispro1/gilbert_vispro1_piramid.dart' // Mengimpor package gilbert_labvispro1/gilbert_vispro1_piramid.dart
    as piramidRunner; // Memberi alias piramidRunner untuk package yang diimpor

void main(List<String> arguments) {
  // Fungsi utama program
  try {
    // Blok try untuk menangani eksepsi
    stdout.write("Masukkan Angka: "); // Menulis pesan ke stdout
    int? totalValue = int.parse(stdin
        .readLineSync()!); // Membaca input dari pengguna dan mengonversinya menjadi integer
    print("\nAngka Random: "); // Menulis pesan ke stdout
    var arrayNumber = ulangan(0, totalValue, 0,
        "randomNumber"); // Memanggil fungsi ulangan untuk menghasilkan angka random
    utama(arrayNumber); // Memanggil fungsi utama dengan parameter arrayNumber
  } on Exception catch (e) {
    // Menangkap eksepsi
    stderr.write("Error: ${e}"); // Menulis pesan error ke stderr
  }
}

utama(var arrayNumber) {
  // Fungsi utama dengan parameter arrayNumber
  int ulang = 1; // Inisialisasi variabel ulang dengan nilai 1
  stdout.write("""\nPilihan:
    1. Bubble Sort
    2. Inversi
    3. Shuffle
    4. Exit
    Masukkan Pilihan: """); // Menulis pesan ke stdout
  int? pilihan = int.parse(stdin
      .readLineSync()!); // Membaca input dari pengguna dan mengonversinya menjadi integer
  Stopwatch stopwatch = new Stopwatch()
    ..start(); // Membuat objek Stopwatch dan memulainya
  switch (pilihan) {
    // Switch case untuk menangani pilihan pengguna
    case 1: // Jika pilihan adalah 1
      arrayNumber = ulangan(arrayNumber, arrayNumber.length, 0,
          "sort"); // Memanggil fungsi ulangan untuk melakukan sorting
      break; // Keluar dari switch case
    case 2: // Jika pilihan adalah 2
      arrayNumber = ulangan(arrayNumber, 0, 0,
          "inversi"); // Memanggil fungsi ulangan untuk melakukan inversi
      break; // Keluar dari switch case
    case 3: // Jika pilihan adalah 3
      arrayNumber = ulangan(arrayNumber, 0, 0,
          "shuffle"); // Memanggil fungsi ulangan untuk melakukan shuffle
      break; // Keluar dari switch case
    case 4:
      ulang = 0;
    default: // Jika pilihan tidak sesuai dengan case yang ada
      arrayNumber = ulangan(arrayNumber, arrayNumber.length, 0,
          "sort"); // Memanggil fungsi ulangan untuk melakukan sorting
  }
  switch (ulang) {
    case 1:
      print("\nHasil: "); // Menulis pesan ke stdout
      ulangan(arrayNumber, 0, 0,
          "print"); // Memanggil fungsi ulangan untuk mencetak hasil
      stdout.write(
          'Proses Eksekusi: ${stopwatch.elapsed}'); // Menulis waktu eksekusi ke stdout

      stdout.write("""\n\nPilihan:
      1. Unordered Pyramid
      2. Ordered Pyramid
      Masukkan Pilihan: """); // Menulis pesan ke stdout
      int? piramid = int.parse(stdin.readLineSync()!); // Membaca input dari pengguna dan mengonversinya menjadi integer
      stdout.write("Masukkan Panjang Piramid: "); // Menulis pesan ke stdout
      int? piramidLength = int.parse(stdin.readLineSync()!); // Membaca input dari pengguna dan mengonversinya menjadi integer
      switch (piramid) { // Switch case untuk menangani pilihan pengguna
        case 1: // Jika pilihan adalah 1
          piramidRunner.piramid( // Memanggil fungsi piramid dari piramidRunner
              0, piramidLength, 0, ulangan(arrayNumber, 0, 0, "shuffle")); // Memanggil fungsi ulangan untuk melakukan shuffle
          break; // Keluar dari switch case
        case 2: // Jika pilihan adalah 2
          piramidRunner.piramid( // Memanggil fungsi piramid dari piramidRunner
              0, piramidLength, 0, ulangan(arrayNumber, 0, 0, "sort")); // Memanggil fungsi ulangan untuk melakukan sorting
          break; // Keluar dari switch case
        default: // Jika pilihan tidak sesuai dengan case yang ada
          piramidRunner.piramid( // Memanggil fungsi piramid dari piramidRunner
              0, piramidLength, 0, ulangan(arrayNumber, 0, 0, "shuffle")); // Memanggil fungsi ulangan untuk melakukan shuffle
      }
      break;
  }
  (ulang == 1) ? utama(arrayNumber) : print("Bye Bye");
}

ulangan(var data, int totalRepeat, int defaultIndex, String tipeUlangan) {
  // Fungsi ulangan dengan parameter data, totalRepeat, defaultIndex, dan tipeUlangan
  var returnData; // Variabel untuk menyimpan data yang akan dikembalikan
  var sortSwap =
      false; // Variabel untuk menandai apakah ada pertukaran dalam sorting
  switch (tipeUlangan) {
    // Switch case untuk menangani tipe ulangan
    case "randomNumber": // Jika tipe ulangan adalah randomNumber
      returnData =
          <int>[]; // Inisialisasi returnData sebagai list integer kosong
      break; // Keluar dari switch case
    case "sort": // Jika tipe ulangan adalah sort
      returnData = data; // Mengisi returnData dengan data
      totalRepeat = returnData.length -
          1; // Mengatur totalRepeat menjadi panjang returnData dikurangi 1
      break; // Keluar dari switch case
    case "inversi": // Jika tipe ulangan adalah inversi
      returnData = data; // Mengisi returnData dengan data
      totalRepeat = ((returnData.length % 2 ==
                  0) // Mengatur totalRepeat menjadi setengah dari panjang returnData
              ? returnData.length / 2
              : (returnData.length - 1) / 2)
          .round(); // Membulatkan hasil pembagian
      break; // Keluar dari switch case
    case "shuffle": // Jika tipe ulangan adalah shuffle
      returnData = data; // Mengisi returnData dengan data
      totalRepeat =
          returnData.length; // Mengatur totalRepeat menjadi panjang returnData
      break; // Keluar dari switch case
    case "print": // Jika tipe ulangan adalah print
      returnData = data; // Mengisi returnData dengan data
      totalRepeat =
          returnData.length; // Mengatur totalRepeat menjadi panjang returnData
      break; // Keluar dari switch case
  }
  while (defaultIndex < totalRepeat) {
    // Looping selama defaultIndex kurang dari totalRepeat
    switch (tipeUlangan) {
      // Switch case untuk menangani tipe ulangan
      case "randomNumber": // Jika tipe ulangan adalah randomNumber
        int randomInt =
            Random().nextInt(10); // Menghasilkan angka random antara 0 dan 9
        returnData.add(randomInt); // Menambahkan angka random ke returnData
        stdout.write(
            "Angka ke-${defaultIndex + 1}: ${randomInt}\n"); // Menulis angka random ke stdout
        break; // Keluar dari switch case
      case "sort": // Jika tipe ulangan adalah sort
        if (returnData[defaultIndex] > returnData[defaultIndex + 1]) {
          // Jika elemen saat ini lebih besar dari elemen berikutnya
          sortSwap = true; // Mengatur sortSwap menjadi true
          var temp = returnData[
              defaultIndex]; // Menyimpan elemen saat ini ke variabel sementara
          returnData[defaultIndex] = returnData[defaultIndex +
              1]; // Menukar elemen saat ini dengan elemen berikutnya
          returnData[defaultIndex + 1] =
              temp; // Menukar elemen berikutnya dengan elemen sementara
        }
        break; // Keluar dari switch case
      case "inversi": // Jika tipe ulangan adalah inversi
        var temp = returnData[
            defaultIndex]; // Menyimpan elemen saat ini ke variabel sementara
        returnData[
                defaultIndex] = // Menukar elemen saat ini dengan elemen yang berlawanan
            returnData[returnData.length - 1 - defaultIndex];
        returnData[returnData.length - 1 - defaultIndex] =
            temp; // Menukar elemen yang berlawanan dengan elemen sementara
        break; // Keluar dari switch case
      case "shuffle": // Jika tipe ulangan adalah shuffle
        int randomInt = Random().nextInt(returnData.length -
            1); // Menghasilkan angka random antara 0 dan panjang returnData dikurangi 1
        var temp = returnData[
            defaultIndex]; // Menyimpan elemen saat ini ke variabel sementara
        returnData[defaultIndex] = returnData[
            randomInt]; // Menukar elemen saat ini dengan elemen random
        returnData[randomInt] =
            temp; // Menukar elemen random dengan elemen sementara
        break; // Keluar dari switch case
      case "print": // Jika tipe ulangan adalah print
        stdout.write(// Menulis elemen saat ini ke stdout
            "Angka ke-${defaultIndex + 1}: ${returnData[defaultIndex]}\n");
        break; // Keluar dari switch case
    }
    defaultIndex++; // Menambah defaultIndex
  }
  return (sortSwap)
      ? ulangan(returnData, 0, 0, "sort")
      : returnData; // Jika ada pertukaran dalam sorting, panggil kembali fungsi ulangan untuk sorting, jika tidak, kembalikan returnData
}
