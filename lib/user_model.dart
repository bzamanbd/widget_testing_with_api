class UserModel {
  final int id;
  final String name, email;
  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(id: json['id'], name: json['name'], email: json['email']);

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    return result;
  }
}
