import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/model/doctor_model.dart';

class MyProvider extends ChangeNotifier {
  late int? price = 0;
  bool obscure = true;
  //
  String? selected = '10:30';
  IconData icons = Icons.visibility;
  //
  late DateTime? focusDate = DateTime.now();
  late DateTime? selectDate = DateTime.now();
  late String? doctorName = '', doctorField = '';
//
  late List<DoctorModel> _doctor = [];
  late String? username = '', userEmail = '', userPhone = '';

  //

  File? _imageFile;
  final ImagePicker _imagePicker = ImagePicker();

  File? get imageFile => _imageFile;
  Future<void> pickedImage() async {
    final picked = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _imageFile = File(picked.path);
      notifyListeners();
    }
  }

//
  void changeDateTime({DateTime? selectedDate, DateTime? focusedDate}) {
    focusDate = focusedDate;
    selectDate = selectedDate;

    notifyListeners();
  }

//
  void changeIcon() {
    icons = icons == Icons.visibility ? Icons.visibility_off_outlined : Icons.visibility;
    obscure = !obscure;
    notifyListeners();
  }

//
  void choiceTime(String choice) {
    selected = choice;
    notifyListeners();
  }

//
  void getDoctorName(String? name) {
    doctorName = name;

    notifyListeners();
  }

//
  void getDoctorField(String? field) {
    doctorField = field;

    notifyListeners();
  }

//
  void getDoctorDeposit(String? deposit) {
    price = int.parse(deposit!);

    notifyListeners();
  }

//
  void getUserInfo(String userName, String email, String phone) {
    username = userName;
    userEmail = email;
    userPhone = phone;

    notifyListeners();
  }
  //

  List<DoctorModel> get doctors => _doctor;
  void setDoctorModelData(List<DoctorModel> newDoctor) {
    _doctor = newDoctor;
    notifyListeners();
  }
}
