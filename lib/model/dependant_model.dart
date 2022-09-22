class DependantModel {
  String? name;
  int? age;

  DependantModel();

  DependantModel.declare(this.name, this.age);
  clone() => DependantModel.declare(name, age);
}
