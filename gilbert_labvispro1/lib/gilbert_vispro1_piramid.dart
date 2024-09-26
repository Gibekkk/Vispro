import 'dart:io';

piramid(int iteratorJ, int length, String jenisPiramid, int lastOrder) {
  int i = 0;
  int order = lastOrder;
  String text = "";
  while (i <= iteratorJ) {
    switch (jenisPiramid) {
      case "unordered":
        text += (i <= iteratorJ) ? "1" : "";
        break;
      default:
        order++;
        order = (order > 9) ? 1 : order;
        text += (i <= iteratorJ) ? "${order}" : "";
        break;
    }
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
    piramid(iteratorJ + 1, length, jenisPiramid, order);
}
