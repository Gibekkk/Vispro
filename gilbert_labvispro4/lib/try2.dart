List makeVertice() {
  List vertices = [
    [
      "A",
      [
        ["B", 8, false],
        ["C", 3, false],
        ["D", 4, false],
        ["E", 10, false]
      ]
    ],
    [
      "B",
      [
        ["A", 8, false],
        ["C", 5, false],
        ["D", 2, false],
        ["E", 7, false]
      ]
    ],
    [
      "C",
      [
        ["A", 3, false],
        ["B", 5, false],
        ["D", 1, false],
        ["E", 6, false]
      ]
    ],
    [
      "D",
      [
        ["A", 4, false],
        ["B", 2, false],
        ["C", 1, false],
        ["E", 3, false]
      ]
    ],
    [
      "E",
      [
        ["A", 10, false],
        ["B", 7, false],
        ["C", 6, false],
        ["D", 3, false]
      ]
    ]
  ];
  return vertices;
}

findIndex(String firstNode) {
  return makeVertice().indexWhere((v) => v[0] == firstNode);
}

bool isInList(var array2D, var array1D) {
  for (var row in array2D) {
    if (row.length == array1D.length) {
      return true;  // GYATT, array1D ada nih bro!
    }
  }
  return false;  // MUNT, ga ketemu nih bro!
}

void main() {
  var vertices = makeVertice();
  var pathsVisited = [];
  var distanceVisited = [];
  var firstNode = "B";
  while (true) {
    var path = [];
    num distance = 0;
    var location = vertices[findIndex(firstNode)];
    path.add(firstNode);
    while (path.length < vertices.length) {
      for (int i = 0; i < location[1].length; i++) {
        if (!location[1][i][2] && !path.contains(location[1][i][0])) {
          distance += location[1][i][1];
          path.add(location[1][i][0]);
          location = vertices[findIndex(location[1][i][0])];
        // print(vertices);
        }
      }
    }
      if (isInList(pathsVisited, path)) {
        pathsVisited.add(path);
        distanceVisited.add(distance);
        vertices = makeVertice();
      } else {
        var finishedPath = path.last;
        path.removeLast();
        location = vertices[findIndex(path.last)];
        for (int i = 0; i < location[1].length; i++) {
          if (location[1][i][0] == finishedPath){
            print("p");
            vertices[findIndex(location[0])][1][i][2] = true;
            print(vertices);
          }
        }
      }
  }
}
