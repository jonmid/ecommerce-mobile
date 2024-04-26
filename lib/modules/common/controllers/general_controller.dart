import 'dart:ui';

import 'package:get/get.dart';

class GeneralController extends GetxController {
  var language = 'es'.obs;

  void changeLanguage(String value) {
    language.value = value;
    Get.updateLocale(Locale(value));
  }
}
