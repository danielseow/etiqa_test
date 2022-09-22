import 'package:etiqa_test/components/text_form_field.dart';
import 'package:etiqa_test/model/plan_model.dart';
import 'package:flutter/material.dart';

class DependantComponent extends StatefulWidget {
  final PlanModel planModel;
  final Function addDependantCallBack;
  final Function removeDependantCallBack;
  const DependantComponent(
      {Key? key,
      required this.planModel,
      required this.addDependantCallBack,
      required this.removeDependantCallBack})
      : super(key: key);

  @override
  State<DependantComponent> createState() => _DependantComponentState();
}

class _DependantComponentState extends State<DependantComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add Dependant",
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
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xfff3f7ff),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Dependant ${index + 1}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.close),
                          color: Colors.red,
                          onPressed: () {
                            widget.removeDependantCallBack(index);
                          },
                        ),
                      ],
                    ),
                    const Text("Name"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField.nameTextFormField(
                        widget.planModel.dependantModelList![index]),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Age"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField.ageTextFormField(
                        widget.planModel.dependantModelList![index]),
                  ],
                ),
              );
            },
            itemCount: widget.planModel.dependantModelList?.length ?? 0,
          ),
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
                    widget.addDependantCallBack();
                  }
                : null,
            child: const Text("+ Add dependant"),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
