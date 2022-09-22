import 'package:etiqa_test/components/child_plan.dart';
import 'package:etiqa_test/components/dependant.dart';
import 'package:etiqa_test/components/plan_list.dart';
import 'package:etiqa_test/model/dependant_model.dart';
import 'package:etiqa_test/model/plan_model.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final PlanModel planModel;
  final bool isEdit;
  const FormPage({Key? key, required this.planModel, this.isEdit = false}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late PlanModel planModel;
  final formKey = GlobalKey<FormState>();
  late bool isEdit;

  @override
  void initState() {
    planModel = widget.planModel;
    isEdit = widget.isEdit;

    super.initState();
  }

  void planNameCallBack(value) {
    setState(() {
      isEdit = false;
      planModel = PlanModel()..planName = value;
    });
  }

  void selectedChildPlanCallBack(value) {
    setState(() {
      planModel.checkedChildPlanModelList!.add(value);
    });
  }

  void addDependantCallBack() {
    setState(() {
      planModel.dependantModelList!.add(DependantModel());
    });
  }

  void removeDependantCallBack(index) {
    setState(() {
      planModel.dependantModelList!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 15,
                  right: 15,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Plan",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PlanListComponent(
                        planModel: planModel,
                        planNameCallBack: planNameCallBack,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ChildPlanComponent(
                        planModel: planModel,
                        isEdit: isEdit,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DependantComponent(
                        planModel: planModel,
                        addDependantCallBack: addDependantCallBack,
                        removeDependantCallBack: removeDependantCallBack,
                      )
                    ],
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                      disabledBackgroundColor: const Color(0xffe2e2e2),
                      backgroundColor: Colors.black,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.all(25)),
                  onPressed: planModel.planName != null
                      ? () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pop(context, planModel);
                          }
                        }
                      : null,
                  child: const Text("Generate Plan"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
