import 'dart:convert';

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
  dynamic profilePic;

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
    this.profilePic,
  });


}