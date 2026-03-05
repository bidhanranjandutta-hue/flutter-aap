class User {
  final String id;
  final String name;
  final String email;

  const User({required this.id, required this.name, required this.email});

  // Factory constructor to simulate JSON deserialization if needed
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  // Method to simulate JSON serialization if needed
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}
