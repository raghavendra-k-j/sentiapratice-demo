import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewRegistrationController extends GetxController {
  RxInt selectedTapPosition = RxInt(0);

  var nameEditingController = TextEditingController();
  var birthDayEditingController = TextEditingController();
  var ageEditingController = TextEditingController();
}
