import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CraftProvider extends ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _userName = '';
  String _phoneNumber = '';
  String _password = '';
  String? _passwordConfirmed;
  String _craftName =  "سباك";
  int _gender = 0;
  String? _birthDate;
  String _governorate = 'القاهرة';
  String _city = 'مايو 15';
  String _street = '';
  Uint8List? _profilePicBytes;
  Uint8List? _personalImageBytes;
  Uint8List? _nationalIdImageBytes;
  bool _showPassword = true;
  bool _loadImage = false;
  List<String> _crafts = [];

  // Getters
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get userName => _userName;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
  String? get passwordConfirmed => _passwordConfirmed;
  String get craftName => _craftName;
  int get gender => _gender;
  String? get birthDate => _birthDate;
  String get governorate => _governorate;
  String get city => _city;
  String get street => _street;
  Uint8List? get profilePicBytes => _profilePicBytes;
  Uint8List? get personalImageBytes => _personalImageBytes;
  Uint8List? get nationalIdImageBytes => _nationalIdImageBytes;
  bool get showPassword => _showPassword;
  bool get loadImage => _loadImage;
  List<String> get crafts => _crafts;
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

  set craftName(String value) {
    _craftName = value;
    notifyListeners();
  }

  set gender(int value) {
    _gender = value;
    notifyListeners();
  }

  set birthDate(String? value) {
    _birthDate = value;
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

  set crafts(List<String> crafts) {
    _crafts = crafts;
    notifyListeners();
  }
  // set profilePicBytes(Uint8List? value) {
  //   _profilePicBytes = value;
  //   notifyListeners();
  // }
  //
  // set personalImageBytes(Uint8List? value) {
  //   _personalImageBytes = value;
  //   notifyListeners();
  // }
  //
  // set nationalIdImageBytes(Uint8List? value) {
  //   _nationalIdImageBytes = value;
  //   notifyListeners();
  // }

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
        final File file = File(image.path);
        List<int> imageBytes = await file.readAsBytes();
        _profilePicBytes = Uint8List.fromList(imageBytes);
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

  // Function to load and temporarily store the personal image
  Future<bool> loadPersonalImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      var image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final File file = File(image.path);
        List<int> imageBytes = await file.readAsBytes();
        _personalImageBytes = Uint8List.fromList(imageBytes);
        notifyListeners();
        return true; // Image upload successful
      } else {
        return false; // No image selected
      }
    } catch (e) {
      print('Error loading personal image: $e');
      return false; // Image upload failed
    }
  }

  // Function to load and temporarily store the national ID image
  Future<bool> loadNationalIdImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      var image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final File file = File(image.path);
        List<int> imageBytes = await file.readAsBytes();
        _nationalIdImageBytes = Uint8List.fromList(imageBytes);
        notifyListeners();
        return true; // Image upload successful
      } else {
        return false; // No image selected
      }
    } catch (e) {
      print('Error loading national ID image: $e');
      return false; // Image upload failed
    }
  }
}
