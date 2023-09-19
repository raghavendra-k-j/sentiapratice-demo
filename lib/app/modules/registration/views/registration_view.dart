import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentiapractice/app/modules/registration/controllers/registration_controller.dart';
import 'package:sentiapractice/app/modules/registration/values/dimens.dart';
import 'package:sentiapractice/app/modules/registration/values/pallet.dart';
import 'package:sentiapractice/app/modules/registration/views/tabs/basic_details.dart';
import 'package:sentiapractice/app/modules/registration/views/widgets/tab_items_view.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Default',
        primarySwatch: Pallet.primary,
        appBarTheme: const AppBarTheme(
          foregroundColor: Pallet.onPrimary,
        ),
        scaffoldBackgroundColor: Pallet.background,
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: const BackButton(),
          toolbarHeight: Dimen.toolbarHeight,
          title: const Text(
            'New Registration',
            style: TextStyle(
              fontSize: Dimen.toolbarFontSize,
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
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFCF8FD),
                Color(
                  0xFFF7FCFF,
                ),
                Color(
                  0xFFF2FFF7,
                ),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TabsItemsView(),
              Expanded(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Obx(() {
                  switch (controller.selectedTabPosition.value) {
                    case 0:
                      return const BasicDetailsTab();
                    default:
                      return const BasicDetailsTab();
                  }
                }),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
