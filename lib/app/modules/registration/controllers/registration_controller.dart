import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  //Constants Data
  List<String> categories = [
    "Select Category",
    "BPL",
    "Without Ration Card",
    "Camp Patient",
    "Employees",
    "Super Speciality",
    "General",
    "VIP",
    "VVIP"
  ];
  List<String> bloodGroups = [
    "A",
    "B",
    "AB",
    "0",
  ];

  // UI States
  RxInt selectedTabPosition = RxInt(0);

  // Form Fields and States
  Rx<String?> selectedCategory = Rx("Select Category");
  Rx<String> selectedBloodGroup = Rx('');
  Rx<String> selectedBloodRh = Rx('');
  Rx<String> menstrualCycleType = Rx('');

  Rx<String> selectedHusbandBloodGroup = Rx('');
  Rx<String> selectedHusbandBloodRh = Rx('');

  TextEditingController gravidaEC = TextEditingController();
  TextEditingController paraEC = TextEditingController();
  TextEditingController livingChildrenEC = TextEditingController();
  TextEditingController miscarriagesEC = TextEditingController();
}
