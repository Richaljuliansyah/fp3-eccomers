import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ecommerce/screens/credit_card/credit_card_screen.dart';
import 'package:simple_ecommerce/screens/home/home_screen.dart';
import 'package:simple_ecommerce/screens/my_account/account_screen.dart';
import 'package:simple_ecommerce/screens/settings/setting_screen.dart';
import 'package:simple_ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:http/http.dart' as http;

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  void logout() async {
    final response = await http
        .post(Uri.parse('https://api1.sib3.nurulfikri.com/api/logout'));

    if (response.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/universal-access-solid.svg",
            press: () => {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => accountScreen()))
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/gears-solid.svg",
            press: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => settingScreen()));
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/question-solid.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Add payment",
            icon: "assets/icons/credit-card-solid.svg",
            press: () {
              Navigator.pushNamed(context, CreditCardScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/arrow-right-from-bracket-solid.svg",
            press: () {
              logout();
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
