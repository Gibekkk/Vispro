import 'dart:io';

piramid(int iteratorJ, int length, int lastOrder, var dataArr) {
  int i = 0;
  int order = lastOrder;
  String text = "";
  while (i <= iteratorJ) {
    order = (order > dataArr.length - 1) ? 0 : order;
    text += (i <= iteratorJ) ? "${dataArr[order]}" : "";
    order++;
    i++;
    text += (i <= iteratorJ) ? " " : "";
  }
  int consoleWidth = length * 2 + 2;

  int padding = ((consoleWidth - text.length) / 2).round();

  String paddedText = ' ' * padding + text;
  stdout.write("${paddedText}");
  text = "";
  stdout.write("\n");
  if (iteratorJ < length - 1)
    piramid(iteratorJ + 1, length, order, dataArr);
}
