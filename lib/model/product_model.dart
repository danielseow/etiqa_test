class ProductModel {
  String? planName;
  List<PlanList>? planList;

  ProductModel({this.planName, this.planList});

  ProductModel.fromJson(Map<String, dynamic> json) {
    planName = json['plan_name'];
    if (json['plan_list'] != null) {
      planList = <PlanList>[];
      json['plan_list'].forEach((v) {
        planList!.add(PlanList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plan_name'] = planName;
    if (planList != null) {
      data['plan_list'] = planList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlanList {
  String? name;
  int? minPremium;
  int? maxPremium;
  int? minSumInsured;
  int? maxSumInsured;

  PlanList({this.name, this.minPremium, this.maxPremium, this.minSumInsured, this.maxSumInsured});

  PlanList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    minPremium = json['min_premium'];
    maxPremium = json['max_premium'];
    minSumInsured = json['min_sum_insured'];
    maxSumInsured = json['max_sum_insured'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['min_premium'] = minPremium;
    data['max_premium'] = maxPremium;
    data['min_sum_insured'] = minSumInsured;
    data['max_sum_insured'] = maxSumInsured;
    return data;
  }
}
