// class LoginModel {
//   String email;
//   String password;
//   String phone;
//   int userType; // 0: admin, 1: company, 2: user
//   String tagline;
//   String name;

//   LoginModel({
//     required this.email,
//     required this.password,
//     required this.phone,
//     required this.userType,
//     required this.tagline,
//     required this.name,
//   });

//   // Factory constructor to create instance from JSON
//   factory LoginModel.fromJson(Map<String, dynamic> json) {
//     return LoginModel(
//       email: json['email'] as String,
//       password: json['password'] as String,
//       phone: json['phone'] as String,
//       userType: int.parse(json['userType']),
//       tagline: json['tagline'] as String,
//       name: json['name'] as String,
//     );
//   }

//   // Method to convert instance to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'email': email,
//       'password': password,
//       'phone': phone,
//       'userType': userType.toString(),
//       'tagline': tagline,
//       'name': name,
//     };
//   }
// }

// class LoginResponse {
//   String message;
//   String token;
//   int status;

//   LoginResponse({
//     required this.message,
//     required this.token,
//     required this.status,
//   });

//   // Factory constructor to create instance from JSON
//   factory LoginResponse.fromJson(Map<String, dynamic> json) {
//     return LoginResponse(
//       message: json['message'] as String,
//       token: json['token'] as String,
//       status: json['status'] as int,
//     );
//   }
// }
