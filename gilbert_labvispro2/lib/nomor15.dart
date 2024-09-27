import 'dart:io';

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
    var hasilLoop = loop(
        true, "awal", items, currenWeight, maxWeight, foundItem, insertedItems);
    items = hasilLoop[0];
    currenWeight = hasilLoop[1];
    maxWeight = hasilLoop[2];
    foundItem = hasilLoop[3];
    insertedItems = hasilLoop[4];
    stdout.write("Urutan Tugas:\n");
    loop(true, "print", items, currenWeight, maxWeight, foundItem,
        insertedItems);
  } on Exception catch (_, e) {
    stderr.write(e);
  }
}

loop(bool boolean, String jenisLoop, var items, int currenWeight, int maxWeight,
    bool foundItem, var insertedItems) {
  int i = 0;
  var highestPriorityItem = ["", 0, 0];
  while (boolean) {
    switch (jenisLoop) {
      case "awal":
        var highestPriorityItem = loop(true, "sort", items, currenWeight,
            maxWeight, foundItem, insertedItems);
        if (highestPriorityItem != ["", 0, 0]) {
          foundItem = true;
          insertedItems.add(highestPriorityItem);
          items.remove(highestPriorityItem);
          currenWeight += highestPriorityItem[1] as int;
        }
        boolean = foundItem && currenWeight < maxWeight;
        break;
      case "sort":
        int priority = items[i][2] as int,
            currentPriority = highestPriorityItem[2] as int,
            itemWeight = items[i][1] as int;
        if (priority > currentPriority &&
            currenWeight + itemWeight <= maxWeight) {
          highestPriorityItem = items[i];
        }
        i++;
        boolean = i < items.length;
        break;
      case "print":
        stdout.write("${i + 1}. ${insertedItems[i][0]}");
        if (i < insertedItems.length - 1) stdout.write("\n");
        i++;
        boolean = i < insertedItems.length;
        break;
    }
  }

  switch (jenisLoop) {
    case "awal":
      return [items, currenWeight, maxWeight, foundItem, insertedItems];
    case "sort":
      return highestPriorityItem;
    case "print":
      break;
  }
}

void main() {
  kerja();
}
