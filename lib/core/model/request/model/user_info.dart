class UserInfo {
  final String? id;
  final String? name;
  final String? email;

  UserInfo({required this.id, required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}