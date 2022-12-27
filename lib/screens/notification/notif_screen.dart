// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_ecommerce/components/custom_bottom_nav_bar.dart';
import 'package:simple_ecommerce/enums.dart';

import 'components/body.dart';

class NotifScreen extends StatelessWidget {
  const NotifScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  static String routeName = "/notification";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        title: Text(
          "Notification",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: Body(),
      bottomNavigationBar:
      CustomBottomNavBar(selectedMenu: MenuState.notification, email: email),
    );
  }
}
