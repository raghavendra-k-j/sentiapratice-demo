import 'package:flutter/material.dart';
import 'package:sentiapractice/values/pallet.dart';

class TextFeildRow extends StatelessWidget {
  final String label;
  final bool isRequired;
  final TextEditingController? editingController;
  final String hint;
  final TextAlign textAlign;
  final int labelFlex;
  final int fieldFlex;
  final bool requiredRightBorder;
  const TextFeildRow({
    super.key,
    required this.label,
    this.isRequired = false,
    this.editingController,
    required this.hint,
    this.textAlign = TextAlign.start,
    this.labelFlex = 1,
    this.fieldFlex = 1,
    this.requiredRightBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: const BorderSide(
            color: Pallet.onSurfaceFormRowDivider,
            width: 1.0,
          ),
          right: requiredRightBorder
              ? const BorderSide(
                  color: Pallet.onSurfaceFormRowDivider,
                  width: 1.0,
                )
              : BorderSide.none,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Pallet.onSurfaceFormLabel,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    fontFamily: 'Default',
                  ),
                  children: [
                    TextSpan(
                      text: label,
                    ),
                    if (isRequired)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                controller: editingController,
                textAlign: textAlign,
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: hint ?? "",
                  hintStyle: const TextStyle(
                    color: Pallet.onSurfaceFormFeildHint,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRadioButton extends StatefulWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onChanged;

  const CustomRadioButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.isSelected);
      },
      child: Row(
        children: [
          Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.isSelected ? Colors.blue : Colors.grey,
                width: 2.0,
              ),
            ),
            child: Center(
              child: widget.isSelected
                  ? const Icon(
                      Icons.check,
                      size: 16.0,
                      color: Colors.blue,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: widget.isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
