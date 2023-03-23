import 'package:intl/intl.dart';

class MenuModel {
  final String id;
  final String note;
  final String createDate;
  final String? updateDate;
  final String eatingDate;
  final String cookId;
  final String menu;
  final String kindergartenId;

  MenuModel({
    required this.id,
    required this.note,
    required this.createDate,
    this.updateDate,
    required this.eatingDate,
    required this.cookId,
    required this.menu,
    required this.kindergartenId,
  });

  static String convertToDate(String? dateString) {
    if (dateString == null) return '';
    final dateTime = DateTime.parse(dateString);
    final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  MenuModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        note = json['note'],
        createDate = convertToDate(json['createDate']),
        updateDate = convertToDate(json['updateDate']),
        eatingDate = convertToDate(json['eatingDate']),
        cookId = json['cookId'],
        menu = json['menu'],
        kindergartenId = json['kindergartenId'];
}
