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

List resetFlag(List vertices, var nodeName) {
  var node = vertices[findIndex(nodeName)];
  for (int i = 0; i < node[1].length; i++) {
    vertices[findIndex(nodeName)][1][i][2] = false;
  }
  return vertices;
}

bool isInList(List array1D, List array2D) {
  for (var row in array2D) {
    if (row.length == array1D.length) {
      int match = 0;
      for (int i = 0; i < array1D.length; i++) {
        if (array1D[i] == row[i]) match++;
      }
      if (match == array1D.length) return true;
    }
  }
  return false;
}

printResults(
    firstNode, similarPath, pathsVisited, distanceVisited, shortestPath) {
  print("\nBruteforce Results: ");
  print("First Node Chosen: $firstNode");
  print("Paths Visited: ");
  for (int i = 0; i < pathsVisited.length; i++) {
    var pathDisplay = "";
    pathsVisited[i].forEach((path) => pathDisplay += "$path-");
    pathDisplay += firstNode;
    pathDisplay += ", Distance: ${distanceVisited[i]}";
    print("${i + 1}. ${pathDisplay}");
  }
  var pathDisplay = "";
  shortestPath[0].forEach((path) => pathDisplay += "$path-");
  pathDisplay += firstNode;
  pathDisplay += ", Distance: ${shortestPath[1]}";
  print("\nShortest Path: ${pathDisplay}");
  if (similarPath.length > 1) {
    print("Similar Paths: ");
    for (int i = 0; i < similarPath.length; i++) {
      var pathDisplay = "";
      similarPath[i][0].forEach((path) => pathDisplay += "$path-");
      pathDisplay += firstNode;
      pathDisplay += ", Distance: ${similarPath[i][1]}";
      print("${i + 1}. ${pathDisplay}");
    }
  }
}

void main() {
  var vertices = makeVertice();
  var pathsVisited = [];
  var distanceVisited = [];
  var firstNode = "A";
  var finding = true;
  var similarPath = [];
  List? shortestPath = null;
  while (finding) {
    var path = [];
    num distance = 0;
    var location = vertices[findIndex(firstNode)];
    path.add(firstNode);
    while (path.length < vertices.length) {
      bool changed = false;
      for (int i = 0; i < location[1].length; i++) {
        if (!location[1][i][2] && !path.contains(location[1][i][0])) {
          path.add(location[1][i][0]);
          location = vertices[findIndex(location[1][i][0])];
          changed = true;
        }
      }
      if (!changed) {
        if (path.length <= 1) {
          finding = false;
          printResults(firstNode, similarPath, pathsVisited, distanceVisited,
              shortestPath);
          return;
        } else {
          var finishedPath = path.last;
          vertices = resetFlag(vertices, finishedPath);
          path.removeLast();
          location = vertices[findIndex(path.last)];
          for (int i = 0; i < location[1].length; i++) {
            if (location[1][i][0] == finishedPath) {
              vertices[findIndex(location[0])][1][i][2] = true;
            }
          }
        }
      }
    }
    var lastNode = vertices[findIndex(path.last)];
    bool pathAvailable = false;
    for (int i = 0; i < lastNode[1].length; i++) {
      if (lastNode[1][i][0] == firstNode) {
        distance += lastNode[1][i][1];
        pathAvailable = true;
      }
    }
    if (!isInList(path, pathsVisited) && pathAvailable) {
      for (int i = 0; i < path.length - 1; i++) {
        vertices[findIndex(path[i])][1].forEach((destination) =>
            {if (destination[0] == path[i + 1]) distance += destination[1]});
      }
      pathsVisited.add(path);
      distanceVisited.add(distance);
      if (shortestPath == null || shortestPath[1] > distance) {
        shortestPath = [path, distance];
        similarPath = [
          [path, distance]
        ];
      } else if (shortestPath[1] == distance && similarPath.length > 0) {
        similarPath.add([path, distance]);
      }
    } else {
      var finishedPath = path.last;
      vertices = resetFlag(vertices, finishedPath);
      path.removeLast();
      location = vertices[findIndex(path.last)];
      for (int i = 0; i < location[1].length; i++) {
        if (location[1][i][0] == finishedPath) {
          vertices[findIndex(location[0])][1][i][2] = true;
        }
      }
    }
  }
}
