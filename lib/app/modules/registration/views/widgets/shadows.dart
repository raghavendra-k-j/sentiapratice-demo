import 'package:flutter/material.dart';
import 'package:sentiapractice/app/modules/registration/values/dimens.dart';
import 'package:sentiapractice/app/modules/registration/values/pallet.dart';

class InputFieldShadow extends PhysicalModel {
  InputFieldShadow({
    Key? key,
    BoxShape shape = BoxShape.rectangle,
    Clip clipBehavior = Clip.none,
    BorderRadius? borderRadius,
    double elevation = 0.5,
    Color color = Colors.transparent,
    Color shadowColor = Pallet.formFieldShadow,
    Widget? child,
  }) : super(
          key: key,
          shape: shape,
          clipBehavior: clipBehavior,
          borderRadius: borderRadius ??
              BorderRadius.circular(
                Dimen.formFieldRadius,
              ),
          elevation: elevation,
          color: color,
          shadowColor: shadowColor,
          child: child,
        );
}
