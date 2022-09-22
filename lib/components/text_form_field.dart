import 'package:etiqa_test/model/child_plan_model.dart';
import 'package:etiqa_test/model/dependant_model.dart';
import 'package:etiqa_test/util/text_form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField {
  static Widget premiumTextFormField(int? min, int? max, ChildPlanModel childPlanModel) {
    return TextFormField(
      initialValue: childPlanModel.premium != null ? childPlanModel.premium.toString() : "",
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        hintText: "Premium",
        prefix: Text("RM "),
      ),
      validator: (value) {
        childPlanModel.premium = int.parse(value! == "" ? "0" : value);
        return TextFormFieldValidator.premiumValidator(value, min, max);
      },
    );
  }

  static Widget sumInsuredTextFormField(int? min, int? max, ChildPlanModel childPlanModel) {
    return TextFormField(
      initialValue: childPlanModel.sumInsured != null ? childPlanModel.sumInsured.toString() : "",
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        hintText: "Sum Insured",
        prefix: Text("RM "),
      ),
      validator: (value) {
        childPlanModel.sumInsured = int.parse(value! == "" ? "0" : value);
        return TextFormFieldValidator.sumInsuredValidator(value, min, max);
      },
    );
  }

  static Widget nameTextFormField(DependantModel dependantModel) {
    return TextFormField(
      initialValue: dependantModel.name != null ? dependantModel.name.toString() : "",
      keyboardType: TextInputType.name,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[a-zA-Z]'),
        ),
      ],
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        hintText: "Name",
      ),
      validator: (value) {
        dependantModel.name = value!;
        return TextFormFieldValidator.nameValidator(value);
      },
    );
  }

  static Widget ageTextFormField(DependantModel dependantModel) {
    return TextFormField(
      initialValue: dependantModel.age != null ? dependantModel.age.toString() : "",
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        hintText: "Age",
      ),
      validator: (value) {
        dependantModel.age = int.parse(value! == "" ? "0" : value);
        return TextFormFieldValidator.ageValidator(value);
      },
    );
  }
}
