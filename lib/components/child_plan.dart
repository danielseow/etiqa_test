import 'package:etiqa_test/components/child_modal.dart';
import 'package:etiqa_test/components/text_form_field.dart';
import 'package:etiqa_test/model/child_plan_model.dart';
import 'package:etiqa_test/model/plan_model.dart';
import 'package:etiqa_test/model/product_model.dart';
import 'package:etiqa_test/util/product.dart';
import 'package:flutter/material.dart';

class ChildPlanComponent extends StatefulWidget {
  final PlanModel planModel;
  final bool isEdit;
  const ChildPlanComponent({Key? key, required this.planModel, required this.isEdit})
      : super(key: key);

  @override
  State<ChildPlanComponent> createState() => _ChildPlanComponentState();
}

class _ChildPlanComponentState extends State<ChildPlanComponent> {
  final productModel = Product.productModel; // list of plans
  ProductModel? planList;

  childPlancallback(value) {
    setState(() {
      widget.planModel.checkedChildPlanModelList = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isEdit) {
      widget.planModel.childPlanModelList!.clear();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Child Plan",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) {
              if (!widget.isEdit) {
                widget.planModel.childPlanModelList!.add(ChildPlanModel());
                widget.planModel.childPlanModelList![index].name =
                    widget.planModel.checkedChildPlanModelList![index].name!;
              }
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xfff3f7ff),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.planModel.checkedChildPlanModelList![index].name!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Premium",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "Min Premium: RM ${widget.planModel.checkedChildPlanModelList![index].minPremium}"),
                    Text(
                        "Max Premium: RM ${widget.planModel.checkedChildPlanModelList![index].maxPremium}"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField.premiumTextFormField(
                      widget.planModel.checkedChildPlanModelList![index].minPremium,
                      widget.planModel.checkedChildPlanModelList![index].maxPremium,
                      widget.planModel.childPlanModelList![index],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sum Insured",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "Min Sum Insured: RM ${widget.planModel.checkedChildPlanModelList![index].minSumInsured}"),
                    widget.planModel.checkedChildPlanModelList![index].maxSumInsured != null
                        ? Text(
                            "Max Sum Insured: RM ${widget.planModel.checkedChildPlanModelList![index].maxSumInsured}")
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField.sumInsuredTextFormField(
                      widget.planModel.checkedChildPlanModelList![index].minSumInsured,
                      widget.planModel.checkedChildPlanModelList![index].maxSumInsured,
                      widget.planModel.childPlanModelList![index],
                    ),
                  ],
                ),
              );
            },
            itemCount: widget.planModel.checkedChildPlanModelList?.length ?? 0,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
                disabledBackgroundColor: const Color(0xffe2e2e2),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(25)),
            onPressed: widget.planModel.planName != null
                ? () {
                    planList = productModel
                        .firstWhere((element) => element.planName == widget.planModel.planName);
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ChildModal(
                        planList: planList!.planList!,
                        planModel: widget.planModel,
                        childPlanCallBack: childPlancallback,
                      ),
                    );
                  }
                : null,
            child: const Text("+ Add child Plan"),
          ),
        ),
      ],
    );
  }
}
