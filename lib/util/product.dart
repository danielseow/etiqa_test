import 'package:etiqa_test/model/product_model.dart';

class Product {
  static const products = [
    {
      "plan_name": "Product ABC",
      "plan_list": [
        {
          "name": "Rider A",
          "min_premium": 100,
          "max_premium": 500,
          "min_sum_insured": 100000,
          "max_sum_insured": 200000
        }
      ]
    },
    {
      "plan_name": "Product DEF",
      "plan_list": [
        {
          "name": "Rider A",
          "min_premium": 100,
          "max_premium": 500,
          "min_sum_insured": 100000,
          "max_sum_insured": 200000
        },
        {
          "name": "Rider B",
          "min_premium": 200,
          "max_premium": 1000,
          "min_sum_insured": 200000,
          "max_sum_insured": null
        }
      ]
    },
    {
      "plan_name": "Product GHI",
      "plan_list": [
        {
          "name": "Rider A",
          "min_premium": 100,
          "max_premium": 500,
          "min_sum_insured": 100000,
          "max_sum_insured": 200000
        },
        {
          "name": "Rider B",
          "min_premium": 200,
          "max_premium": 1000,
          "min_sum_insured": 200000,
          "max_sum_insured": null
        },
        {
          "name": "Rider C",
          "min_premium": 300,
          "max_premium": 2000,
          "min_sum_insured": 300000,
          "max_sum_insured": 500000
        }
      ]
    }
  ];

  static final productModel = (products).map((i) => ProductModel.fromJson(i)).toList();
}
