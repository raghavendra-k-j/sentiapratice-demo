import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentiapractice/values/pallet.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Default',
        primarySwatch: Pallet.primary,
        appBarTheme: const AppBarTheme(
          foregroundColor: Pallet.onPrimary,
        ),
        scaffoldBackgroundColor: Pallet.background,
      ),
      title: "Sentia Care",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
