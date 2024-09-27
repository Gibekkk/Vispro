kerja(var items, int currenWeight, int maxWeight) {
  int i = 0;
  var highestPriorityItem = ["", 0, 0];
  while (i < items.length) {
    int priority = items[i][2] as int,
        currentPriority = highestPriorityItem[2] as int,
        itemWeight = items[i][1] as int;
    if (priority > currentPriority && currenWeight + itemWeight <= maxWeight) {
      highestPriorityItem = items[i];
    }
    i++;
  }
  return highestPriorityItem;
}
