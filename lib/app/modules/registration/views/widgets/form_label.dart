import 'package:flutter/cupertino.dart';
import 'package:sentiapractice/app/modules/registration/values/pallet.dart';

class FormLabel extends StatelessWidget {
  final String label;
  final bool required;
  final EdgeInsetsGeometry margin;
  final int? maxLines;

  const FormLabel(
    this.label, {
    super.key,
    this.required = false,
    this.margin = const EdgeInsets.only(bottom: 2),
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: RichText(
        maxLines: maxLines,
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(
                fontFamily: 'Default',
                color: Pallet.formLabel,
              ),
            ),
            if (required)
              const TextSpan(
                text: ' *',
                style: TextStyle(
                  fontFamily: 'Default',
                  color: Pallet.formLabelRequiredIndicator,
                ),
              )
          ],
        ),
      ),
    );
  }
}
