class Students {
  String? _name;
  String? _studentID;
  int? _grade;

  Students(String name, String studentID, int grade) {
    this._name = name;
    this._studentID = studentID;
    this._grade = grade;
  }

  bool isPassed() {
    return this._grade! >= 70;
  }

  void printData() {
    print(
        "Student ${getName()} [${getStudentID()}] - (${getGrade()}) ${isPassed() ? "PASSED" : "FAILED"}");
  }

  void setName(String name) => this._name = name;
  void setStudentID(String studentID) => this._studentID = studentID;
  void setGrade(int grade) => this._grade = grade;

  String getName() {
    return this._name!;
  }

  String getStudentID() {
    return this._studentID!;
  }

  int getGrade() {
    if (this._grade! > 100) {
      setGrade(100);
    }
    if (this._grade! < 0) {
      setGrade(0);
    }
    return this._grade!;
  }
}