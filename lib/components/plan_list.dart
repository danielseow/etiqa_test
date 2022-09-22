import 'package:etiqa_test/model/plan_model.dart';
import 'package:etiqa_test/util/product.dart';
import 'package:flutter/material.dart';

class PlanListComponent extends StatefulWidget {
  final Function planNameCallBack;
  final PlanModel planModel;
  const PlanListComponent({Key? key, required this.planNameCallBack, required this.planModel})
      : super(key: key);

  @override
  State<PlanListComponent> createState() => _PlanListComponentState();
}

class _PlanListComponentState extends State<PlanListComponent> {
  String selectedValue = "";
  final productModel = Product.productModel;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.planModel.planName ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 20,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: productModel.length,
          itemBuilder: (context, index) {
            return customRadioButton(
              productModel[index].planName,
            );
          },
        ));
  }

  Widget customRadioButton(final planName) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: planName == selectedValue ? Theme.of(context).primaryColor : Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      width: 180,
      child: RadioListTile<String>(
        activeColor: Theme.of(context).primaryColor,
        controlAffinity: ListTileControlAffinity.trailing,
        value: planName,
        groupValue: selectedValue,
        title: Text(
          planName,
          style: TextStyle(
              color: planName == selectedValue ? Theme.of(context).primaryColor : Colors.black),
        ),
        onChanged: (value) {
          setState(() {
            selectedValue = value!;
            widget.planNameCallBack(selectedValue);
          });
        },
      ),
    );
  }
}
