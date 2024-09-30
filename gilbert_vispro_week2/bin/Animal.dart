import 'package:gilbert_vispro_week2/Animal.dart';
void main(){
  Dog anjing = new Dog("Anjing Menggonggong", "Anjing Makan");
  Cat kucing = new Cat("Kucing Mengeong", "Kucing Makan");

  anjing.sound();
  anjing.eat();
  
  kucing.sound();
  kucing.eat();
}