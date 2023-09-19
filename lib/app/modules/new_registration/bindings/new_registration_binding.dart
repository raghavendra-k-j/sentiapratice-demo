import 'package:get/get.dart';

import '../controllers/new_registration_controller.dart';

class NewRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewRegistrationController>(
      () => NewRegistrationController(),
    );
  }
}
