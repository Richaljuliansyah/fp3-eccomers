import 'package:flutter/material.dart';
import 'package:simple_ecommerce/models/cart.dart';
import 'package:simple_ecommerce/components/custom_bottom_nav_bar.dart';
import 'package:simple_ecommerce/enums.dart';

import 'components/body.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  static String routeName = "/wishlist";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar:
      CustomBottomNavBar(selectedMenu: MenuState.wishlist, email: email),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Wishlist",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
