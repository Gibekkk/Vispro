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

void main() {
  List vertices = makeVertice(); // List of all vertices (nodes)
  var firstNode = "B";
  var paths = [];
  while (true) {
    var path = [];
    var pathDist = [];
    num distance = 0;
    var location;
    String stuckTry = "0";
    while (path.length < vertices.length) {
      bool changeNode = false;
      if (path.length == 0) {
        path.add(firstNode);
        location = vertices[findIndex(firstNode)];
      }
      for (int i = 0; i < location[1].length; i++) {
        if (!location[1][i][2] && !path.contains(location[1][i][0])) {
          if (location[1][i][0] != stuckTry) {
            distance += location[1][i][1];
            path.add(location[1][i][0]);
            print(path);
            print(vertices);
            if (path.length == vertices.length) {
              vertices[findIndex(location[0])][1][i][2] = true;
            }
            location = vertices[findIndex(location[1][i][0])];
            changeNode = true;
          } else {
            vertices[findIndex(location[0])][1][i][2] = true;
          }
        }
      }
      if (!changeNode) {
        var stuckLocation = vertices[findIndex(location[0]) - 1];
        stuckTry = location[0];
        for (int i = 0; i < stuckLocation[1].length; i++) {
          if (stuckLocation[1][i][0] == location[0]) {
            vertices[findIndex(stuckLocation[0])][1][i][2] = true;
            path.removeLast();
          }
        }
      } else {
        stuckTry = "0";
      }
    }
    for (int i = 0; i < location[1].length; i++) {
      if (location[1][i][0] == firstNode) {
        path.add(firstNode);
        distance += location[1][i][1];
        pathDist.add(distance);
      }
    }
    if (location[0] == firstNode) break;
    paths.add([path, pathDist]);
    print([path, pathDist]);
  }
}
