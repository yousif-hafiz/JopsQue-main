import 'package:get/get.dart';

class LanguageController extends GetxController {
  final List<String> flages = [
    "assets/image/square flags/England.png",
    "assets/image/square flags/Indonesia.png",
    "assets/image/square flags/Saudi Arabia.png",
    "assets/image/square flags/China.png",
    "assets/image/square flags/Netherlands.png",
    "assets/image/square flags/France.png",
    "assets/image/square flags/Germany.png",
    "assets/image/square flags/Japan.png",
    "assets/image/square flags/South Korea.png",
    "assets/image/square flags/Portugal.png",
  ];

  final List<String> nameOfLang = [
    'English',
    'Indonesia',
    'Arabic',
    'Chinese',
    'Dutch',
    'French',
    'German',
    'Japanese',
    'Korean',
    'Portuguese',
  ];

  RxString selectLang = "English".obs;
}
