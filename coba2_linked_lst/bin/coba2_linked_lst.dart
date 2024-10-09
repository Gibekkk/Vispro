import 'dart:io'; // Import library untuk input/output

class Node {
  int? data; // Data yang disimpan dalam node, nullable untuk keamanan jika tidak ada data
  Node? next; // Pointer ke node berikutnya, juga nullable

  Node(this.data); // Constructor untuk inisialisasi node dengan data
}

// Fungsi untuk traversing dan mencetak seluruh linked list
void traverseAndPrint(Node head) {
  int i = 1;
  Node? currentNode = head; // Mulai dari head (node pertama)
  while (currentNode != null) {
    stdout.write('${i}. ${currentNode.data}\n'); // Print data tiap node
    currentNode = currentNode.next; // Lanjut ke node berikutnya
    i++;
  }
}

// Fungsi untuk memasukkan node baru ke posisi tertentu
Node insertNodeAtPosition(Node head, Node newNode, int position) {
  // Jika posisi yang dimasukkan adalah pertama (head), update newNode menjadi head
  if (position == 1) {
    newNode.next = head;
    return newNode;
  }

  // Mulai dari head untuk mencari posisi yang diinginkan
  Node? currentNode = head;
  int i = 1;
  while (currentNode != null && i < position - 1) {
    currentNode = currentNode.next; // Traverse ke posisi sebelumnya
    i++;
  }

  // Sisipkan node baru di posisi yang ditarget
  if (currentNode != null) {
    newNode.next = currentNode.next;
    currentNode.next = newNode;
  }
  
  return head; // Mengembalikan head yang baru
}

// Fungsi untuk menukar node pada posisi tertentu
Node swapNode(Node head, int pos1, int pos2) {
  if (pos1 == pos2) return head; // Jika posisi yang ditukar sama, tidak perlu swap

  // Mencari node pada posisi pos1
  Node? prevNode1 = null;
  Node? node1 = head;
  int i = 1;
  while (node1 != null && i < pos1) {
    prevNode1 = node1;
    node1 = node1.next;
    i++;
  }

  // Mencari node pada posisi pos2
  Node? prevNode2 = null;
  Node? node2 = head;
  i = 1;
  while (node2 != null && i < pos2) {
    prevNode2 = node2;
    node2 = node2.next;
    i++;
  }

  // Jika node1 atau node2 tidak ditemukan, kembalikan head
  if (node1 == null || node2 == null) return head;

  // Jika node1 tidak ada di posisi head, hubungkan node2 dengan node sebelum node1
  if (prevNode1 != null) {
    prevNode1.next = node2;
  } else {
    head = node2;
  }

  // Jika node2 tidak ada di posisi head, hubungkan node1 dengan node sebelum node2
  if (prevNode2 != null) {
    prevNode2.next = node1;
  } else {
    head = node1;
  }

  // Swap next pointers dari node1 dan node2
  Node? temp = node1.next;
  node1.next = node2.next;
  node2.next = temp;

  return head; // Mengembalikan head yang baru setelah swap
}

// Fungsi untuk menghapus node pada posisi tertentu
Node deleteNode(Node head, int position) {
  if (position == 1) {
    return head.next ?? head; // Mengembalikan head baru setelah menghapus node pertama
  }

  // Mencari node pada posisi yang ingin dihapus
  Node? currentNode = head;
  Node? prevNode = null;
  int i = 1;
  while (currentNode != null && i < position) {
    prevNode = currentNode;
    currentNode = currentNode.next;
    i++;
  }

  // Jika node yang ingin dihapus ditemukan, hubungkan node sebelumnya dengan node setelahnya
  if (currentNode != null && prevNode != null) {
    prevNode.next = currentNode.next;
  }

  return head; // Mengembalikan head yang baru setelah menghapus node
}

void main() {
  // Membuat beberapa node (elemen linked list)
  Node node1 = Node(7);
  Node node2 = Node(3);
  Node node3 = Node(2);
  Node node4 = Node(9);

  // Menghubungkan node-node ini
  node1.next = node2;
  node2.next = node3;
  node3.next = node4;

  // Mencetak list sebelum insert
  stdout.write('Linked list awal: \n');
  traverseAndPrint(node1);

  // Memasukkan node baru dengan nilai 97 di posisi 3
  Node newNode = Node(97);
  node1 = insertNodeAtPosition(node1, newNode, 3);

  // Mencetak list setelah insert
  stdout.write('\nSetelah insert: \n');
  traverseAndPrint(node1);

  // Menukar node pada posisi 2 dan 5
  node1 = swapNode(node1, 2, 5);

  // Mencetak list setelah swap
  stdout.write('\nSetelah swap: \n');
  traverseAndPrint(node1);

  // Menghapus node pada posisi 3
  node1 = deleteNode(node1, 3);

  // Mencetak list setelah delete
  stdout.write('\nSetelah delete: \n');
  traverseAndPrint(node1);
}
