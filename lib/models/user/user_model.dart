class UserModel {
  String? name;
  int? age;
  int? rollNumber;

  UserModel({this.name, this.age, this.rollNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    rollNumber = json['roll_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['roll_number'] = rollNumber;
    return data;
  }
}
