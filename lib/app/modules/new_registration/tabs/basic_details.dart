import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentiapractice/app/modules/new_registration/widgets/TextFeildRow.dart';
import 'package:sentiapractice/app/modules/new_registration/widgets/accordion_header.dart';

import '../controllers/new_registration_controller.dart';

class BasicDetailsTab extends GetView<NewRegistrationController> {
  const BasicDetailsTab({super.key});

  Widget buildPersonalDetailsCard() {
    return Builder(builder: (ctx) {
      return Accordion(
        title: "Personal Details",
        child: Column(
          children: [
            TextFeildRow(
              label: "Full Name",
              hint: "Riya Malhotra",
              isRequired: true,
              editingController: controller.nameEditingController,
            ),
            TextFeildRow(
              label: "Birthday",
              hint: "dd-mm-yyyy",
              isRequired: true,
              editingController: controller.birthDayEditingController,
            ),
            TextFeildRow(
              label: "Age",
              hint: "18",
              isRequired: true,
              editingController: controller.ageEditingController,
            ),
            TextFeildRow(
              label: "Mobile Number",
              hint: "9876 5432 10",
              isRequired: true,
              editingController: controller.ageEditingController,
            ),
            TextFeildRow(
              label: "Aadhaar Number",
              hint: "1234 5678 9012",
              isRequired: true,
              editingController: controller.ageEditingController,
            ),
            TextFeildRow(
              label: "Category",
              hint: "Select Category",
              isRequired: true,
              editingController: controller.ageEditingController,
            ),
            TextFeildRow(
              label: "Occupation",
              hint: "Select Occupation",
              isRequired: true,
              editingController: controller.ageEditingController,
            ),
            TextFeildRow(
              label: "Blood Group",
              hint: "Select Blood Group",
              isRequired: true,
              editingController: controller.ageEditingController,
            ),
            TextFeildRow(
              label: "Rh Factor",
              hint: "Select Rh Factor",
              isRequired: true,
              editingController: controller.ageEditingController,
            ),
          ],
        ),
      );
    });
  }

  Widget buildObstetricDetailsCard() {
    return Builder(builder: (ctx) {
      return Accordion(
        title: "Obstetric Details",
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFeildRow(
                    requiredRightBorder: true,
                    label: "Gravida",
                    hint: "1",
                    isRequired: true,
                    editingController: controller.nameEditingController,
                    textAlign: TextAlign.end,
                  ),
                ),
                Expanded(
                  child: TextFeildRow(
                    label: "Para",
                    hint: "1",
                    isRequired: true,
                    editingController: controller.ageEditingController,
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFeildRow(
                    label: "Living Children",
                    hint: "1",
                    isRequired: true,
                    editingController: controller.nameEditingController,
                    requiredRightBorder: true,
                    textAlign: TextAlign.end,
                  ),
                ),
                Expanded(
                  child: TextFeildRow(
                    label: "Miscarriages",
                    hint: "1",
                    isRequired: true,
                    textAlign: TextAlign.end,
                    editingController: controller.ageEditingController,
                  ),
                )
              ],
            ),
            TextFeildRow(
              label: "Menstrual Cycle",
              hint: "",
              isRequired: true,
              editingController: controller.birthDayEditingController,
            ),
          ],
        ),
      );
    });
  }

  Widget buildPregnancyDetailsCard() {
    return Builder(builder: (ctx) {
      return Accordion(
        title: "Pregnancy Details",
        child: const Column(
          children: [
            TextFeildRow(
              label: "LMP",
              hint: "",
            ),
            TextFeildRow(
              label: "EDD",
              hint: "",
            ),
            TextFeildRow(
              label: "Scan EDD",
              hint: "",
            ),
            TextFeildRow(
              label: "Gestation Age",
              hint: "",
            ),
          ],
        ),
      );
    });
  }

  Widget buildHusbandDetailsCard() {
    return Builder(builder: (ctx) {
      return Accordion(
        title: "Husband Details",
        child: Column(
          children: [
            TextFeildRow(
              label: "Name",
              hint: "",
              isRequired: false,
              editingController: controller.nameEditingController,
            ),
            const TextFeildRow(
              label: "Mobile",
              hint: "",
              isRequired: false,
            ),
            const TextFeildRow(
              label: "Blood Group",
              hint: "",
              isRequired: false,
            ),
            const TextFeildRow(
              label: "Occupation",
              hint: "",
              isRequired: false,
            ),
            const TextFeildRow(
              label: "Mobile Numer",
              hint: "",
              isRequired: false,
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildPersonalDetailsCard(),
              buildObstetricDetailsCard(),
              buildPregnancyDetailsCard(),
              buildHusbandDetailsCard(),
            ],
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    buildPersonalDetailsCard(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    buildObstetricDetailsCard(),
                    buildPregnancyDetailsCard(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    buildHusbandDetailsCard(),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
