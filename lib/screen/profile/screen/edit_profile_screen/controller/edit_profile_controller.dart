import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../../provider/provider.dart';


class EditProfileController extends GetxController {
  JopProvider cont = JopProvider();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool first = true;
}