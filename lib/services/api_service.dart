import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = '내서버 주소';
  static const String menus = 'menu가져오는 url';

  static getMenus() async {
    final url = Uri.http('authority', 'dd');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final jsonRes = jsonDecode(res.body) as Map<String, dynamic>;
      print('$jsonRes');
    } else {
      print('Request failed with status.');
    }
  }
}
