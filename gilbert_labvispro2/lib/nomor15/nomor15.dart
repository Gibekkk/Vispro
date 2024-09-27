import 'dart:io';
import 'package:gilbert_labvispro2/nomor9/nomor9_itemSort.dart' as itemSort;
import 'package:gilbert_labvispro2/nomor9/nomor9_print.dart' as print;

kerja() {
  try {
    var items = [
      ["Fondasi (A)", 1, 5],
      ["Struktur (B)", 1, 4],
      ["Atap (C)", 1, 3],
      ["Dinding (D)", 1, 4],
      ["Instalasi Listrik (E)", 1, 2],
      ["Finishing (F)", 1, 1]
    ];
    int maxWeight = items.length, currenWeight = 0;

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
