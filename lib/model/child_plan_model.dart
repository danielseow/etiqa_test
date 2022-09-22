class ChildPlanModel {
  String? name;
  int? premium;
  int? sumInsured;

  ChildPlanModel();

  ChildPlanModel.declare(this.name, this.premium, this.sumInsured);
  clone() => ChildPlanModel.declare(name, premium, sumInsured);
}
