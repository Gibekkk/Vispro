import 'dart:io';

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
    var hasilLoop = loop(
        true, "awal", items, currenWeight, maxWeight, foundItem, insertedItems);
    items = hasilLoop[0];
    currenWeight = hasilLoop[1];
    maxWeight = hasilLoop[2];
    foundItem = hasilLoop[3];
    insertedItems = hasilLoop[4];
    stdout.write("List Barang:\n");
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
