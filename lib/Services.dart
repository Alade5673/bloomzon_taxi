import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Balance.dart';
// import 'Wallet.dart';
//
class Services {
  static const ROOT = 'https://bloomzon.com/driver/wallet.php';
  static const _GET_ALL_ACTION = 'GET_ALL';
//
//
  static Future<List<Balance>?> getBalance() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(Uri.parse(ROOT));
      print('getWallet Response: ${response.body}');
      if (200 == response.statusCode) {
        List <Balance> list = parseResponse(response.body);
        return list;
      } else {
        // return List<Balance>();
      }
    } catch (e) {
      // return List<Balance>(); // return an empty list on exception/error
    }
  }

  static List<Balance> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Balance>((json) => Balance.fromJson(json)).toList();
  }
}