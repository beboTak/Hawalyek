import 'dart:typed_data';

class CraftProfile {
  String firstName;
  String lastName;
  String userName;
  String phoneNumber;
  String password;
  String? passwordConfirmed;
  String craftName;
  int gender;
  String? birthDate;
  Uint8List? profilePicBytes;
  String governorate;
  String city;
  String street;
  Uint8List? personalImageBytes;
  Uint8List? nationalIdImageBytes;

  CraftProfile({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
    required this.password,
    this.passwordConfirmed,
    required this.craftName,
    required this.gender,
    this.birthDate,
    this.profilePicBytes,
    required this.governorate,
    required this.city,
    required this.street,
    this.personalImageBytes,
    this.nationalIdImageBytes,
  });

  // Convert CraftProfile to JSON
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'password': password,
      'passwordConfirmed': passwordConfirmed,
      'craftName': craftName,
      'gender': gender,
      'birthDate': birthDate,
      'profilePicBytes': profilePicBytes != null ? profilePicBytes!.toList() : null,
      'governorate': governorate,
      'city': city,
      'street': street,
      'personalImageBytes': personalImageBytes != null ? personalImageBytes!.toList() : null,
      'nationalIdImageBytes': nationalIdImageBytes != null ? nationalIdImageBytes!.toList() : null,
    };
  }

  // Create CraftProfile from JSON
  factory CraftProfile.fromJson(Map<String, dynamic> json) {
    return CraftProfile(
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      passwordConfirmed: json['passwordConfirmed'],
      craftName: json['craftName'],
      gender: json['gender'],
      birthDate: json['birthDate'],
      profilePicBytes: json['profilePicBytes'] != null ? Uint8List.fromList(List<int>.from(json['profilePicBytes'])) : null,
      governorate: json['governorate'],
      city: json['city'],
      street: json['street'],
      personalImageBytes: json['personalImageBytes'] != null ? Uint8List.fromList(List<int>.from(json['personalImageBytes'])) : null,
      nationalIdImageBytes: json['nationalIdImageBytes'] != null ? Uint8List.fromList(List<int>.from(json['nationalIdImageBytes'])) : null,
    );
  }
}
