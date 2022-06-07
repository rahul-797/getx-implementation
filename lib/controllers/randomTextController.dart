import 'dart:math';

import 'package:get/get.dart';

class RandomTextController extends GetxController {
  Random random = Random();
  final chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  var randomString = "dawe43rw34".obs;

  RxString getRandomString(int length) {
    randomString.value = String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
    return randomString;
  }
}
