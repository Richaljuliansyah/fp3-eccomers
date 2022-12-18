import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ecommerce/api/api_const.dart';
import 'package:simple_ecommerce/models/barang.dart';

class BarangCallApiService {
  Future<List<Barang>?> getBarang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('${ApiConst.baseUrl}barang');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token').toString()}'
      });

      // var data = jsonDecode(response.body);

      // print(data);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var rest = data['data'] as List;
        List<Barang> barang =
            rest.map<Barang>((json) => Barang.fromJson(json)).toList();
        return barang;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
