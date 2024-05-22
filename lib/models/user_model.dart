import 'dart:typed_data';

class UserProfile {
  String firstName;
  String lastName;
  String userName;
  int gender;
  String phoneNumber;
  String password;
  String? passwordConfirmed;
  String governorate;
  String city;
  String street;
  String? birthDate;
  Uint8List? profilePicBytes; // Changed to Uint8List for image bytes

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.gender,
    required this.phoneNumber,
    required this.governorate,
    required this.city,
    required this.street,
    required this.password,
    this.passwordConfirmed,
    this.birthDate,
    this.profilePicBytes,
  });
}
