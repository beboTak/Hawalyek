import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../models/user_model.dart';

class BackendService {
  static const String baseUrl = 'http://hawalayk.runasp.net/api';

  Future<bool> registerUser(UserProfile user) async {
    try {
      var url = '$baseUrl/Auth/RegisterCustomer';
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add form fields
      request.fields['FirstName'] = user.firstName;
      request.fields['LastName'] = user.lastName;
      request.fields['UserName'] = user.userName;
      request.fields['Gender'] = user.gender.toString();
      request.fields['PhoneNumber'] = user.phoneNumber;
      request.fields['Password'] = user.password;
      request.fields['PasswordConfirmed'] = user.passwordConfirmed ?? '';
      request.fields['Goveronrate'] = user.governorate;
      request.fields['City'] = user.city;
      request.fields['Street'] = user.street;
      request.fields['BirthDate'] = user.birthDate ?? '';

      // Add profile picture file
      request.files.add(http.MultipartFile(
        'ProfilePic',
        http.ByteStream.fromBytes(user.profilePic),
        user.profilePic.length,
        filename: 'profile_pic.jpg',
        contentType: MediaType('image', 'jpeg'),
      ));

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        print('User registration successful.');
        return true; // Return true for successful registration
      } else {
        print('Failed to register user: ${response.body}');
        return false; // Return false for failed registration
      }
    } catch (e) {
      print('Error registering user: $e');
      return false; // Return false for any error
    }
  }

  Future<List<String>> getGovernorates() async {
    final url = Uri.parse('$baseUrl/Address/governorates');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      final List<String> governorates =
          data.map((item) => item.toString()).toList();
      return governorates;
    } else {
      throw Exception('Failed to load governorates');
    }
  }

  Future<List<String>> getCities(String governorateName) async {
    final url = Uri.parse('$baseUrl/Address/cities/$governorateName');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<String> cities = data.map((item) => item.toString()).toList();
      return cities;
    } else {
      throw Exception('Failed to load cities');
    }
  }
// You can add more methods for other API endpoints here...
}
