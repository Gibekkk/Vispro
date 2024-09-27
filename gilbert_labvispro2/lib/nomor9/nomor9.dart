import 'dart:io';
import 'package:gilbert_labvispro2/nomor9/nomor9_itemSort.dart' as itemSort;
import 'package:gilbert_labvispro2/nomor9/nomor9_print.dart' as print;

kerja() {
  try {
    int maxWeight = 10, currenWeight = 0;
    var items = [
      ["Makanan", 3, 50],
      ["Pakaian", 2, 30],
      ["Alat Masak", 4, 40],
      ["Tenda", 5, 70],
      ["Sleeping Bag", 2, 20]
    ];

    var insertedItems = [];

    bool foundItem = false;
    do {
      var highestPriorityItem = itemSort.kerja(items, currenWeight, maxWeight);
      if (highestPriorityItem != ["", 0, 0]) {
        foundItem = true;
        insertedItems.add(highestPriorityItem);
        items.remove(highestPriorityItem);
        currenWeight += highestPriorityItem[1] as int;
      }
    } while (foundItem && currenWeight < maxWeight);
    print.kerja(insertedItems);
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

void main() {
  kerja();
}
