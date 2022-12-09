// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ecommerce/components/product_card.dart';
import 'package:simple_ecommerce/models/product.dart';

import '../../../size_config.dart';
import 'section_title.dart';
import 'package:http/http.dart' as http;

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  _loadProduct() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    final response = await http.get(
        Uri.parse('https://api1.sib3.nurulfikri.com/api/barang'),
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        });

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
      print('token : ${localStorage.getString('token')}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular) {
                    // components/product_card.dart
                    return ProductCard(product: demoProducts[index]);
                  }

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
