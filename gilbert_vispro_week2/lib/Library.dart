import 'dart:io';

class Library {
  var _bookList = <Book>[];

  void insertBook() {
    stdout.write("Masukkan Judul Buku: ");
    String? title = stdin.readLineSync()!;
    stdout.write("Masukkan Author Buku: ");
    String? author = stdin.readLineSync()!;
    stdout.write("Masukkan Tahun Rilis Buku: ");
    int? year = int.parse(stdin.readLineSync()!);
    Book book = new Book(title, author, year);
    addBook(book);
  }

  void deleteBook() {
    displayBooks();
    int? pilihan = int.parse(stdin.readLineSync()!);
    if (pilihan < 1 || pilihan > getBookList().length) {
      pilihan = 1;
    }
    pilihan -= 1;
    removeBook(getBookList()[pilihan]);
  }

  void addBook(Book book) {
    this._bookList.add(book);
    print("Buku dimasukkan!");
  }

  void removeBook(Book book) {
    this._bookList.remove(book);
    print("Buku dihapus!");
  }

  List<Book> getBookList() {
    return this._bookList;
  }

  void displayBooks() {
    stdout.write("Daftar Buku:\n");
    int i = 0;
    for (Book book in getBookList()) {
      stdout.write("${i + 1}. ");
      book.bookData();
      stdout.write("\n");
      i++;
    }
  }
}

class Book {
  String? _title;
  String? _author;
  int? _year;

  Book(String title, String author, int year) {
    this._title = title;
    this._author = author;
    this._year = year;
  }

  void bookData() {
    stdout.write("${getTitle()} [${getAuthor()}] (${getYear()})");
  }

  void setTitle(String title) => this._title = title;
  void setAuthor(String author) => this._author = author;
  void setYear(int year) => this._year = year;

  String getTitle() {
    return this._title!;
  }

  String getAuthor() {
    return this._author!;
  }

  int getYear() {
    return this._year!;
  }
}
