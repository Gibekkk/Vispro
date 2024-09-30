class Vehicle {
  String? _name;
  int? _speed;

  int getSpeed() {
    return this._speed!;
  }

  String getName() {
    return this._name!;
  }

  Vehicle(String name, int speed) {
    this._name = name;
    this._speed = speed;
  }

  void move() {
    String kecepatan = "Normally";
    if (getSpeed() < 30) {
      kecepatan = "Slowly";
    } else if (getSpeed() > 60) {
      kecepatan = "Fastly";
    }
    print("The ${getName()} moves ${kecepatan}");
  }
}

class Car extends Vehicle {
  Car(String name, int speed) : super(name, speed);
}

class Bike extends Vehicle {
  Bike(String name, int speed) : super(name, speed);
}

