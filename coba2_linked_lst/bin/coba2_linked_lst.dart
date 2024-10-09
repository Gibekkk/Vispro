import 'dart:io'; // Import library buat input/output
class Node {
  int? data; // Data yang disimpen dalam node, nullable biar aman kalo gak ada data
  Node? next; // Pointer ke node berikutnya, juga nullable

  Node(this.data); // Constructor buat inisialisasi node dengan data
}

// Fungsi buat nge-print seluruh linked list
void traverseAndPrint(Node head) {
  Node? currentNode = head; // Mulai dari head (node pertama)
  while (currentNode !=  null) {
    stdout.write('${currentNode.data} -> '); // Print data tiap node dan tanda panah
    currentNode = currentNode.next; // Lanjut ke node berikutnya
  }
  stdout.write('null'); // Tanda akhir dari linked list
}

// Fungsi buat masukin node baru ke posisi tertentu
Node insertNodeAtPosition(Node head, Node newNode, int position) {
  // Kalau posisi yang dimau itu pertama (head), update newNode jadi head
  if (position == 1) {
    newNode.next = head;
    return newNode;
  }

  // Mulai dari head buat nyari posisi yang diinginkan
  Node? currentNode = head;
  for (int i = 1; i < position - 1; i++) {
    if (currentNode == null) {
      break; // Stop kalau posisi lebih dari panjang list
    }
    currentNode = currentNode.next;
  }

  // Sisipkan node baru di posisi yang ditarget
  newNode.next = currentNode!.next; // currentNode gak boleh null di sini, jadi pakai '!'
  currentNode.next = newNode; // Hubungkan node baru ke current node
  return head; // Balikin head baru
}

// Fungsi buat tukar node ke posisi tertentu
Node swapNode(Node head, Node node1, Node node2) {
  if (node1 == head) {
    head = node2;
  }
  if (node2 == head) {
    head = node1;
  }
  Node? swapper = node1.next;
  node1.next = node2.next;
  node2.next = swapper;

  // Mulai dari head buat nyari posisi yang diinginkan
  Node? currentNode = head;
    while (currentNode!.next != null) {
      if(currentNode.next == node1){
        currentNode.next = node2;
      }
      else if(currentNode.next == node2){
        currentNode.next = node1;
      }
      currentNode = currentNode.next;
    }
  return head; // Balikin head baru
}

void main() {
  // Buat beberapa node (elemen linked list)
  Node node1 = new Node(7);
  Node node2 = new Node(3);
  Node node3 = new Node(2);
  Node node4 = new Node(9);

  // Hubungkan node-node ini
  node1.next = node2;
  node2.next = node3;
  node3.next = node4;

  // Print list sebelum insert
  stdout.write('Original list: ');
  traverseAndPrint(node1);

  // Insert node baru dengan value 97 di posisi 2
  Node newNode = Node(97);
  node1 = insertNodeAtPosition(node1, newNode, 2);

  // Print list setelah insert
  stdout.write('\nAfter insertion: ');
  traverseAndPrint(node1);

  node1 = swapNode(node1, node3, node1);

  // Print list setelah insert
  stdout.write('\nAfter Swapping: ');
  traverseAndPrint(node1);
}
