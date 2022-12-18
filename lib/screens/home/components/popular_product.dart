import 'package:flutter/material.dart';
import 'package:simple_ecommerce/api/barang_call_api.dart';
import 'package:simple_ecommerce/components/product_card.dart';
import 'package:simple_ecommerce/models/barang.dart';
import 'package:simple_ecommerce/models/product.dart';
import 'package:simple_ecommerce/size_config.dart';

import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  List<Barang> _barang = [];

  @override
  void initState() {
    super.initState();
    _fetchBarang();
    // _loadProduct();
  }

  // _loadProduct() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();

  //   final response = await http.get(
  //       Uri.parse('https://api1.sib3.nurulfikri.com/api/barang'),
  //       headers: {
  //         'Authorization': 'Bearer ${localStorage.getString('token')}'
  //       });

  //   if (response.statusCode == 200) {
  //     print(jsonDecode(response.body));
  //   } else {
  //     print(response.statusCode);
  //     print('token : ${localStorage.getString('token')}');
  //   }
  // }

  _fetchBarang() async {
    _barang = (await BarangCallApiService().getBarang())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
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

                  return const SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Barang Dijual", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _barang.length,
                itemBuilder: (context, index) {
                  return Text(_barang[index].name);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
