class UserModel {
  String nombre;
  String apellido;
  String email;
  String password;
  String? token;

  UserModel({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.password,
    this.token,
  });

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  // Create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nombre: json['nombre'],
      apellido: json['apellido'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }
}
