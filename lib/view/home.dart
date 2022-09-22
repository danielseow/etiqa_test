import 'package:etiqa_test/model/plan_model.dart';
import 'package:etiqa_test/view/form.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PlanModel> planModelList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Insurance App",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: planModelList.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                          child: Text(
                            "Your Plans",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Expanded(
                          child: planListView(),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text("You have not added any plans yet"),
                    ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(25),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormPage(planModel: PlanModel()),
                  ),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      planModelList.add(value);
                    });
                  }
                });
              },
              child: const Text(
                "ADD PLAN",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget planListView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(planModelList[index].planName!),
                        const Spacer(),
                        TextButton(
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Theme.of(context).primaryColorLight),
                            ),
                            onPressed: () {
                              final tempPlanModelList = [];
                              for (var element in planModelList) {
                                tempPlanModelList.add(element.clone());
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FormPage(planModel: tempPlanModelList[index], isEdit: true),
                                ),
                              ).then((value) {
                                if (value != null) {
                                  setState(() {
                                    planModelList[index] = value;
                                  });
                                }
                              });
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, childIndex) => Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(planModelList[index]
                                            .childPlanModelList![childIndex]
                                            .name!),
                                        Text(
                                            "RM ${planModelList[index].childPlanModelList![childIndex].premium!.toString()}"),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Sum Insured"),
                                        Text(
                                            "RM ${planModelList[index].childPlanModelList![childIndex].sumInsured!.toString()}"),
                                      ],
                                    ),
                                  ],
                                ),
                            separatorBuilder: (context, index) => const SizedBox(
                                  height: 10,
                                ),
                            itemCount: planModelList[index].childPlanModelList!.length),
                        planModelList[index].dependantModelList!.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("Dependants"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView.separated(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, dependantIndex) => Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(planModelList[index]
                                                  .dependantModelList![dependantIndex]
                                                  .name!),
                                              Text(planModelList[index]
                                                  .dependantModelList![dependantIndex]
                                                  .age!
                                                  .toString()),
                                            ],
                                          ),
                                      separatorBuilder: (context, index) => const SizedBox(
                                            height: 5,
                                          ),
                                      itemCount: planModelList[index].dependantModelList!.length),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: planModelList.length);
  }
}
