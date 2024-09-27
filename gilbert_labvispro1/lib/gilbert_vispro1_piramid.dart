import 'dart:io'; // Mengimpor library dart:io untuk menggunakan fungsi input/output

piramid(int iteratorJ, int length, int lastOrder, var dataArr) { // Fungsi piramid dengan parameter iteratorJ, length, lastOrder, dan dataArr
  (length > 40) ? length = 40 : length; // Membatasi panjang piramid maksimal 40
  int i = 0; // Inisialisasi variabel i dengan nilai 0
  int order = lastOrder; // Inisialisasi variabel order dengan nilai lastOrder
  String text = ""; // Inisialisasi variabel text dengan string kosong
  while (i <= iteratorJ) { // Looping selama i kurang dari atau sama dengan iteratorJ
    order = (order > dataArr.length - 1) ? 0 : order; // Mengatur order agar tidak melebihi panjang dataArr
    text += (i <= iteratorJ) ? "${dataArr[order]}" : ""; // Menambahkan elemen dataArr ke text
    order++; // Increment order
    i++; // Increment i
    text += (i <= iteratorJ) ? " " : ""; // Menambahkan spasi ke text jika i kurang dari atau sama dengan iteratorJ
  }
  int consoleWidth = length * 2 + 2; // Menghitung lebar konsol

  int padding = ((consoleWidth - text.length) / 2).round(); // Menghitung padding untuk teks

  String paddedText = ' ' * padding + text; // Menambahkan padding ke teks
  stdout.write("${paddedText}"); // Menulis teks yang sudah dipadding ke stdout
  text = ""; // Mengosongkan variabel text
  stdout.write("\n"); // Menulis newline ke stdout
  if (iteratorJ < length - 1) // Jika iteratorJ kurang dari length - 1
    piramid(iteratorJ + 1, length, order, dataArr); // Memanggil fungsi piramid secara rekursif
}

