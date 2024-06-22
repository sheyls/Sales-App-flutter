class User {
  String name;
  String lastName;
  String email;
  String password;
  String? token;

  User({
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    lastName: json['lastName'],
    email: json['email'],
    password: json['password'],
    token: json['token'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'lastName': lastName,
    'email': email,
    'password': password,
    'token': token,
  };
}
