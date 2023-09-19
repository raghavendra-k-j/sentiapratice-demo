import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentiapractice/app/modules/registration/controllers/registration_controller.dart';
import 'package:sentiapractice/app/modules/registration/values/pallet.dart';

class TabsItemsView extends GetView<RegistrationController> {
  const TabsItemsView({super.key});

  Widget buildTabItem(String label, int position) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          controller.selectedTabPosition.value = position;
        },
        child: Obx(() {
          bool isSelected = (position == controller.selectedTabPosition.value);
          return Ink(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border(
                right: const BorderSide(
                  color: Pallet.tabItemStroke,
                  width: 1.0,
                ),
                bottom: BorderSide(
                  color: isSelected ? Pallet.primary : Pallet.tabBarBackground,
                  width: isSelected ? 4.0 : 0.0,
                ),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Pallet.tabItemText),
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
        // color: Pallet.tabBarBackground,
        border: Border(
          bottom: BorderSide(
            color: Pallet.tabItemStroke,
            width: 1.0,
          ),
        ),
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTabItem("Basic Details", 0),
                buildTabItem("Contact Details", 1),
                buildTabItem("Health Details", 2),
                buildTabItem("Documents", 3),
                buildTabItem("Previous History", 5),
                buildTabItem("Change Hospital", 6),
                buildTabItem("Risks", 7),
                buildTabItem("Miscellaneous", 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
