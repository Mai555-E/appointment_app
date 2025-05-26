import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  late DateTime? focusDate = DateTime.now();
  late DateTime? selectDate = DateTime.now();
  late String? doctorName = '', doctorField = '';
  late int? price =0;
  IconData icons = Icons.visibility;
  bool obscure = true;
//

  late String? username = '', userEmail = '', userPhone = '';
  //
  String? selected = '10:30';

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

  void getDoctorName(String? name) {
    doctorName = name;

    notifyListeners();
  }

  void getDoctorField(String? field) {
    doctorField = field;

    notifyListeners();
  }

  void getDoctorDeposit(int? deposit) {
    price = deposit;

    notifyListeners();
  }


  void getUserInfo(String userName, String email, String phone) {
    username = userName;
    userEmail = email;
    userPhone = phone;

    notifyListeners();
  }
}
