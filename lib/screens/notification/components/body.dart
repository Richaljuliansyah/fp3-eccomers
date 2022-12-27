import 'notif_menu.dart';

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
          //SizedBox(height: 20),
         
          NotifMenu(
            text: "Flash sale 12.12",
            icon: "assets/icons/gift.svg",
            press: () {},
          ),
          NotifMenu(
            text: "Keranjang kamu sudah penuh, ayo segera lakukan check out",
            icon: "assets/icons/keranjang.svg",
            press: () {},
          ),
          NotifMenu(
            text: "Diskon 50 % untuk produk terbaru",
            icon: "assets/icons/tas.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
