import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../models/craft_model.dart';
import '../models/user_model.dart';

class BackendService {
  static const String baseUrl = 'http://forflutter.runasp.net/api';
  Future<Map<String, dynamic>> registerUser(UserProfile user) async {
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
      if (user.profilePicBytes != null) {
        request.files.add(http.MultipartFile.fromBytes(
          'ProfilePic',
          user.profilePicBytes!,
          filename: 'profile_pic.jpg',
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        print('User registration successful. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return {'success': true, 'statusCode': response.statusCode, 'body': response.body};
      } else {
        print('Failed to register user. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return {'success': false, 'statusCode': response.statusCode, 'body': response.body};
      }
    } catch (e) {
      print('Error registering user: $e');
      if (e is SocketException) {
        print('SocketException: No Internet connection.');
      } else if (e is HttpException) {
        print('HttpException: ${e.message}');
      } else if (e is FormatException) {
        print('FormatException: ${e.message}');
      } else {
        print('Unexpected error: $e');
      }
      return {'success': false, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> registerCraftsman(CraftProfile craftProfile) async {
    try {
      var url = '$baseUrl/Auth/RegisterCraftsman';
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add form fields
      request.fields['FirstName'] = craftProfile.firstName;
      request.fields['LastName'] = craftProfile.lastName;
      request.fields['UserName'] = craftProfile.userName;
      request.fields['Gender'] = craftProfile.gender.toString();
      request.fields['PhoneNumber'] = craftProfile.phoneNumber;
      request.fields['Password'] = craftProfile.password;
      request.fields['PasswordConfirmed'] = craftProfile.passwordConfirmed ?? '';
      request.fields['CraftName'] = craftProfile.craftName?? '';
      request.fields['Goveronrate'] = craftProfile.governorate;
      request.fields['City'] = craftProfile.city;
      request.fields['Street'] = craftProfile.street;
      request.fields['BirthDate'] = craftProfile.birthDate ?? '';

      // Add profile picture file
      if (craftProfile.profilePicBytes != null) {
        request.files.add(http.MultipartFile.fromBytes(
          'ProfilePic',
          craftProfile.profilePicBytes!,
          filename: 'profile_pic.jpg',
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      // Add personal image file
      if (craftProfile.personalImageBytes != null) {
        request.files.add(http.MultipartFile.fromBytes(
          'PersonalImage',
          craftProfile.personalImageBytes!,
          filename: 'personal_image.jpg',
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      // Add national ID image file
      if (craftProfile.nationalIdImageBytes != null) {
        request.files.add(http.MultipartFile.fromBytes(
          'NationalIdImage',
          craftProfile.nationalIdImageBytes!,
          filename: 'national_id_image.jpg',
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        print('Craftsman registration successful. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return {'success': true, 'statusCode': response.statusCode, 'body': response.body};
      } else {
        print('Failed to register craftsman. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return {'success': false, 'statusCode': response.statusCode, 'body': response.body};
      }
    } catch (e) {
      print('Error registering craftsman: $e');
      if (e is SocketException) {
        print('SocketException: No Internet connection.');
      } else if (e is HttpException) {
        print('HttpException: ${e.message}');
      } else if (e is FormatException) {
        print('FormatException: ${e.message}');
      } else {
        print('Unexpected error: $e');
      }
      return {'success': false, 'error': e.toString()};
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

  Future<List<String>> getCraftsNames() async {
    final url = Uri.parse('$baseUrl/Enum/CraftsNameValues');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<String> craftsNames = data.map((item) => item.toString()).toList();
      return craftsNames;
    } else {
      throw Exception('Failed to load crafts names');
    }
  }
// You can add more methods for other API endpoints here...
}
