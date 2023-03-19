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

  MenuModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        note = json['note'],
        createDate = json['createDate'],
        updateDate = json['updateDate'],
        eatingDate = json['eatingDate'],
        cookId = json['cookId'],
        menu = json['menu'],
        kindergartenId = json['kindergartenId'];
}
