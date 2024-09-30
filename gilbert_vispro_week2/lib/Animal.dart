class Animal {
  String? _suara;
  String? _makan;

  Animal(String suara, String makan) {
    this._suara = suara;
    this._makan = makan;
  }

  void sound() => print(this._suara);
  void eat() => print(this._makan);
}

class Dog extends Animal {
  Dog(String suara, String makan) : super(suara, makan);
}

class Cat extends Animal {
  Cat(String suara, String makan) : super(suara, makan);
}
