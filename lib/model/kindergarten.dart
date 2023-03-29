class KindergartenModel {
  final String id;
  final String name;
  final String address;
  final String? location;
  final String? note;

  KindergartenModel({
    required this.id,
    required this.name,
    required this.address,
    this.location,
    this.note,
  });

  KindergartenModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        address = json['address'],
        location = json['location'],
        note = json['note'];
}
