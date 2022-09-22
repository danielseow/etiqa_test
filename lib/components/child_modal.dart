import 'package:etiqa_test/model/plan_model.dart';
import 'package:etiqa_test/model/product_model.dart';
import 'package:flutter/material.dart';

class ChildModal extends StatefulWidget {
  final List<PlanList> planList;
  final Function childPlanCallBack;
  final PlanModel planModel;
  ChildModal({
    Key? key,
    required this.planList,
    required this.planModel,
    required this.childPlanCallBack,
  }) : super(key: key);

  @override
  State<ChildModal> createState() => _ChildModalState();
}

class _ChildModalState extends State<ChildModal> {
  List<PlanList> tempPlanList = [];

  @override
  void initState() {
    tempPlanList = [...widget.planModel.checkedChildPlanModelList!];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Select Child Plan",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.planList.length,
                    itemBuilder: (context, index) {
                      bool checked = false;
                      for (var element in tempPlanList) {
                        if (widget.planList[index].name == element.name) {
                          checked = true;
                          break;
                        }
                      }
                      return CheckboxListTile(
                        activeColor: Theme.of(context).primaryColor,
                        checkboxShape: const CircleBorder(),
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checked,
                        onChanged: (value) {
                          if (value!) {
                            setState(() {
                              tempPlanList.add(widget.planList[index]);
                            });
                          } else {
                            setState(() {
                              tempPlanList.remove(widget.planList[index]);
                            });
                          }
                        },
                        title: Text(widget.planList[index].name!),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    widget.childPlanCallBack(tempPlanList);
                    Navigator.pop(context);
                  });
                },
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(25),
                    backgroundColor: Theme.of(context).primaryColor),
                child: const Text(
                  "Add Plans",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
