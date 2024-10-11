import 'dart:io';
import 'dart:math';
import 'functions.dart'; // Import functions dari file sebelah

// Set ukuran terminal grid
final int width = getScreenSize()[0] - 3; // Batas kanan terminal dikurangi 3
final int height = getScreenSize()[1] - 3; // Batas bawah terminal dikurangi 3

// Buat posisi awal ular di tengah-tengah grid dengan margin dari border
int posAwalX = random(3, width); // Random posisi awal dengan minimal 3 dari border kiri-kanan
int posAwalY = random(3, height); // Random posisi awal dengan minimal 3 dari border atas-bawah

// Ular awal punya panjang 5
List<Point<int>> snake = [
  Point(posAwalX, posAwalY),
  Point(posAwalX - 1, posAwalY),
  Point(posAwalX - 2, posAwalY),
  Point(posAwalX - 3, posAwalY),
  Point(posAwalX - 4, posAwalY)
];

// Random posisi makanan dengan margin dari border
Point<int> food = Point(random(3, width), random(3, height));

void main() async {
  // Disable echo dan input line-mode biar lancar
  stdin.echoMode = false;
  stdin.lineMode = false;

  // Timer loop dengan delay 100 ms
  while (true) {
    autoMoveSnake();
    drawGrid();
    await delay(100); // Delay tiap frame 100ms
  }
}

// Fungsi buat auto-move ular ke arah makanan
void autoMoveSnake() {
  final head = snake.first; // Ambil posisi kepala ular

  // Cari langkah pathfinding ke makanan
  Point<int>? nextMove = findNextMove(head, food);

  if (nextMove != null) {
    snake.insert(0, nextMove); // Geser kepala ke langkah berikutnya

    if (nextMove == food) {
      // Kalau kepala ketemu makanan, panjangin badan ular
      placeFood(); // Buat makanan baru
    } else {
      snake.removeLast(); // Kalau gak makan, hapus ekor (pindahin posisi ular)
    }
  }
}

// Algoritma pathfinding simple
Point<int>? findNextMove(Point<int> start, Point<int> target) {
  List<Point<int>> directions = [
    Point(0, 1), // Atas
    Point(1, 0), // Kanan
    Point(0, -1), // Bawah
    Point(-1, 0) // Kiri
  ];

  Point<int>? bestMove;
  int shortestDist = 9999; // Inisialisasi jarak terpendek dummy

  for (var direction in directions) {
    Point<int> newPos = Point(start.x + direction.x, start.y + direction.y);

    // Validasi newPos: gak nabrak tembok dan bukan bagian ular
    if (newPos.x >= 0 && newPos.x < width && newPos.y >= 0 && newPos.y < height) {
      int dist = (newPos.x - target.x).abs() + (newPos.y - target.y).abs();
      if (dist < shortestDist) {
        shortestDist = dist;
        bestMove = newPos;
      }
    }
  }

  return bestMove; // Balikin langkah terbaik
}

// Render grid ke terminal
void drawGrid() async {
  clearScreen(); // Hapus layar terminal

  int i = 1;
  int posisiX = 0;
  int posisiY = 0;

  // Render badan ular
  for (var s in snake) {
    moveTo(s.y + 1, s.x + 1); // Pake fungsi lu buat move cursor
    if (i == 2 || i == snake.length - 1) {
      stdout.write('O');
      if (posisiX != s.x) {
        moveTo(s.y + 2, s.x + 1); stdout.write('O');
        moveTo(s.y + 3, s.x + 1); stdout.write('O');
        moveTo(s.y, s.x + 1); stdout.write('O');
        moveTo(s.y - 1, s.x + 1); stdout.write('O');
      } else {
        if (posisiY < s.y) {
          moveTo(s.y + 1, s.x + 2); stdout.write('O');
          moveTo(s.y + 1, s.x + 3); stdout.write('O');
          moveTo(s.y + 1, s.x); stdout.write('O');
          moveTo(s.y + 1, s.x - 1); stdout.write('O');
        } else {
          moveTo(s.y + 1, s.x + 2); stdout.write('O');
          moveTo(s.y + 1, s.x + 3); stdout.write('O');
          moveTo(s.y + 1, s.x); stdout.write('O');
          moveTo(s.y + 1, s.x - 1); stdout.write('O');
        }
      }
    } else {
      stdout.write('O');
    }
    posisiX = s.x;
    posisiY = s.y;
    i++;
  }

  // Render kepala ular
  moveTo(snake.first.y + 1, snake.first.x + 1);
  stdout.write('H'); // Tanda kepala ular

  // Render makanan
  moveTo(food.y + 1, food.x + 1);
  stdout.write('X'); // Tanda makanan
}

// Fungsi buat taruh makanan di lokasi random
void placeFood() {
  food = Point(random(3, width), random(3, height)); // Random lokasi makanan
  while (snake.contains(food)) {
    food = Point(random(3, width), random(3, height)); // Re-random kalau makanan muncul di badan ular
  }
}
