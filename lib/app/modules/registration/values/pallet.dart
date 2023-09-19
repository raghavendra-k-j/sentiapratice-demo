import 'package:flutter/material.dart';

class Pallet {
  static const MaterialColor primary = MaterialColor(0xFF21BFB5, {
    50: Color(0xFFF4FCFC),
    100: Color(0xFFE9F9F8),
    200: Color(0xFFC8EFED),
    300: Color(0xFFA4E5E1),
    400: Color(0xFF64D3CC),
    500: Color(0xFF21BFB5),
    600: Color(0xFF1EAAA2),
    700: Color(0xFF14736D),
    800: Color(0xFF0F5652),
    900: Color(0xFF0A3835),
  });
  static const onPrimary = Color(0xFFFFFFFF);

  // Layers
  static const background = Color(0xFFF9FAFF);
  static const surface = Color(0xFFFFFFFF);
  static const onSurfaceStroke = Color(0xFFD1D5DB);

  // Card
  static const onBackgroundSurfaceStroke = Color(0xFFD1D5DB);

  // Tab Item
  static const tabBarBackground = Color(0xFFF9FAFF);
  static const tabItemText = Color(0xFF000000);
  static const tabItemStroke = Color(0xFFB3B0AD);

  // Form Colors
  static const formLabel = Color(0xFF374151);
  static const formLabelRequiredIndicator = Color(0xFFFF612F);

  static const formItemSeparatorStroke = Color(0xFFD1D5DB);
  static const formFieldStroke = Color(0xFFD1D5DB);
  static const formFieldStrokeFocused = primary;

  static const formFieldShadow = Color(0xFFFFFFFF);

  static const formText = Color(0xFF111111);
  static const formPrefixSuffixText = Color(0xFF374151);
  static const formTextDisabled = Color(0xFF777777);
  static const formFieldFillColor = Color(0xFFFFFFFF);

  static const formHintText = Color(0xFFA6A8AD);
  static const formError = Color(0xFFFF612F);
  static const formSuccess = Color(0xFF039C09);
}
