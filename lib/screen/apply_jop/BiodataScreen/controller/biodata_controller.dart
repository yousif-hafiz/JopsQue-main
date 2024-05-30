import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PhoneController extends GetxController {
  TextEditingController phone = TextEditingController();

  void changePhoneNumber(String value) {
    phone.text = value;
    update();
  }
}
