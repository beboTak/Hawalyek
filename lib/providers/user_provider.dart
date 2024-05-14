import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _userName = '';
  int _gender = 0;
  String _phoneNumber = '';
  String _password = '';
  String? _passwordConfirmed;
  String _governorate = 'القاهرة';
  String _city = 'مايو 15';
  String _street = '';
  String? _birthDate; // Changed the type to String
  dynamic? _profilePic;
  bool _showPassword = true;
  bool _loadImage = false;
  Uint8List ? _showPImage;
  // Getters
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get userName => _userName;
  int get gender => _gender;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
  String? get passwordConfirmed => _passwordConfirmed;
  String get governorate => _governorate;
  String get city => _city;
  String get street => _street;
  String? get birthDate => _birthDate;
  bool get showPassword => _showPassword;
  bool get loadImage=> _loadImage;
  Uint8List? get showPImage=>_showPImage;
  // Setters
  set firstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  set lastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  set gender(int value) {
    _gender = value;
    notifyListeners();
  }

  set phoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  set passwordConfirmed(String? value) {
    _passwordConfirmed = value;
    notifyListeners();
  }

  set governorate(String value) {
    _governorate = value;
    notifyListeners();
  }

  set city(String value) {
    _city = value;
    notifyListeners();
  }

  set street(String value) {
    _street = value;
    notifyListeners();
  }

  set birthDate(String? value) {
    _birthDate = value;
    notifyListeners();
  }

  set showPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }
  set loadImage(bool value) {
    _loadImage = value;
    notifyListeners();
  }

  // Function to load and temporarily store the profile picture
  Future<bool> loadProfilePicture() async {
    try {
      final ImagePicker _picker = ImagePicker();
      var image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // Convert the image to bytes
        final File file = File(image.path);
        List<int> imageBytes = await file.readAsBytes();
        _profilePic = imageBytes;
        String base64Image = base64Encode(imageBytes);
        _showPImage = Uint8List.fromList(imageBytes);
        // _profilePic = base64Image;
        notifyListeners();

        return true; // Image upload successful
      } else {
        return false; // No image selected
      }
    } catch (e) {
      print('Error loading profile picture: $e');
      return false; // Image upload failed
    }
  }

  // Function to get the temporarily stored profile picture
  dynamic? getTempProfilePicture() {
    return _profilePic;
  }

}
