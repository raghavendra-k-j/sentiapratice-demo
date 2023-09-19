import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../values/pallet.dart';
import '../controllers/new_registration_controller.dart';
import '../tabs/basic_details.dart';

class NewRegistrationView extends GetView<NewRegistrationController> {
  const NewRegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        toolbarHeight: 42,
        title: const Text(
          'New Registration',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallet.onPrimary,
                foregroundColor: Pallet.primary,
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabsItemsView(),
          Expanded(child: BasicDetailsTab()),
        ],
      ),
    );
  }
}

class TabsItemsView extends GetView<NewRegistrationController> {
  const TabsItemsView({super.key});

  Widget buildTabItem(String label, int position) {
    return Material(
      child: InkWell(
        onTap: () {
          controller.selectedTapPosition.value = position;
        },
        child: Obx(() {
          bool isSelected = (position == controller.selectedTapPosition.value);
          return Ink(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Pallet.tabBackgroundColor,
              border: Border(
                right: const BorderSide(
                  color: Pallet.tabItemBorderColor,
                  width: 1.0,
                ),
                bottom: BorderSide(
                  color:
                      isSelected ? Pallet.primary : Pallet.tabBackgroundColor,
                  width: isSelected ? 4.0 : 0.0,
                ),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Pallet.tabBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Pallet.tabItemBorderColor,
            width: 1.0,
          ),
        ),
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildTabItem("Basic Details", 0),
            buildTabItem("Contact Details", 1),
            buildTabItem("Health Details", 2),
            buildTabItem("Documents", 3),
            buildTabItem("Previous History", 5),
            buildTabItem("Change Hospital", 6),
            buildTabItem("Risks", 7),
            buildTabItem("Miscellaneous", 4),
          ],
        ),
      ),
    );
  }
}
