import 'package:etiqa_test/model/child_plan_model.dart';
import 'package:etiqa_test/model/dependant_model.dart';
import 'package:etiqa_test/model/product_model.dart';

class PlanModel {
  String? planName;
  List<PlanList>? checkedChildPlanModelList;
  List<DependantModel>? dependantModelList;
  List<ChildPlanModel>? childPlanModelList;

  PlanModel() {
    checkedChildPlanModelList = [];
    dependantModelList = [];
    childPlanModelList = [];
  }

  PlanModel.declare(this.planName, this.checkedChildPlanModelList, this.dependantModelList,
      this.childPlanModelList);

  clone() {
    List<DependantModel> tempDependantModelList = [];
    List<ChildPlanModel> tempChildPlanModelList = [];
    for (var element in dependantModelList!) {
      tempDependantModelList.add(element.clone());
    }
    for (var element in childPlanModelList!) {
      tempChildPlanModelList.add(element.clone());
    }
    return PlanModel.declare(
        planName, checkedChildPlanModelList, tempDependantModelList, tempChildPlanModelList);
  }
}
