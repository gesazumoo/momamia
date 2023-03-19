import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momamia/model/menu.dart';

class ApiService {
  static const String baseUrl = 'http://main.gesazumoo.kro.kr/api/webhook';
  static const String getMenuList = 'menu';

  static Future<List<MenuModel>> getMenus() async {
    final url = Uri.parse('$baseUrl/$getMenuList');
    final res = await http.get(url);
    final List<MenuModel> menuList = [];
    if (res.statusCode == 200) {
      final List<dynamic> menus = jsonDecode(res.body);
      for (var menu in menus) {
        menuList.add(MenuModel.fromJson(menu['json']));
      }
      return menuList;
    }
    throw Error();
  }
}
