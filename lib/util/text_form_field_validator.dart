import 'package:flutter/src/widgets/framework.dart';

class TextFormFieldValidator {
  static premiumValidator(String premium, int? min, int? max) {
    if (premium.isEmpty) {
      return 'Premium cannot be empty';
    } else if (min != null && int.parse(premium) < min) {
      return 'It must be more than $min';
    } else if (max != null && int.parse(premium) > max) {
      return 'It must be less than $max';
    }
    return null;
  }

  static sumInsuredValidator(String sumInsured, int? min, int? max) {
    if (sumInsured.isEmpty) {
      return 'Sum Insured cannot be empty';
    } else if (min != null && int.parse(sumInsured) < min) {
      return 'It must be more than $min';
    } else if (max != null && int.parse(sumInsured) > max) {
      return 'It must be less than $max';
    }
    return null;
  }

  static nameValidator(String name) {
    if (name.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  static ageValidator(String age) {
    if (age.isEmpty) {
      return 'Age cannot be empty';
    }
    return null;
  }
}
