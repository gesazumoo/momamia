import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momamia/model/kindergarten.dart';
import 'package:momamia/model/menu.dart';

class ApiService {
  static const String baseUrl = 'http://main.gesazumoo.kro.kr/api/webhook';
  static const String menuUrl = 'menu';
  static const String kindergartenUrl = 'kindergarten';
  static const String menuDetailUrl =
      'cbc05dd7-bf74-45ba-8658-062e7c70af71/menu';

  static Future<List<MenuModel>> getMenus() async {
    final url = Uri.parse('$baseUrl/$menuUrl');
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

  static Future<List<KindergartenModel>> getKindergartens() async {
    final url = Uri.parse('$baseUrl/$kindergartenUrl');
    final res = await http.get(url);
    final List<KindergartenModel> kinderList = [];
    if (res.statusCode == 200) {
      final List<dynamic> menus = jsonDecode(res.body);
      for (var menu in menus) {
        kinderList.add(KindergartenModel.fromJson(menu['json']));
      }
      return kinderList;
    }
    throw Error();
  }

  static Future<MenuModel> getMenuDetail(String id) async {
    final url = Uri.parse('$baseUrl/$menuDetailUrl/$id');
    print(url);
    final res = await http.get(url);
    final MenuModel menuDetail;
    try {
      if (res.statusCode == 200) {
        final menu = jsonDecode(res.body);
        menuDetail = MenuModel.fromJson(menu[0]['json']);
        return menuDetail;
      }
    } catch (e) {
      print(e);
    }
    throw Error();
  }
}
