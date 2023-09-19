import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentiapractice/app/modules/registration/values/pallet.dart';

class Accordion extends StatelessWidget {
  final Widget child;
  final String title;
  final RxBool isAccordionVisible = RxBool(true);
  Accordion({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Pallet.surface,
        // gradient: const LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     Color(0xFFFCF8FD),
        //     Color(
        //       0xFFF7FCFF,
        //     ),
        //     Color(
        //       0xFFF2FFF7,
        //     ),
        //   ],
        // ),
        border: Border.all(color: Pallet.onBackgroundSurfaceStroke, width: 0.5),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEBEAF1),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(
            () => AccordionHeader(
              isExpanded: isAccordionVisible.value,
              title: title,
              onTap: () {
                isAccordionVisible.value = !isAccordionVisible.value;
              },
            ),
          ),
          Obx(
            () => Visibility(
              visible: isAccordionVisible.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class AccordionHeader extends StatelessWidget {
  const AccordionHeader({
    super.key,
    required this.title,
    required this.onTap,
    required this.isExpanded,
  });

  final String title;
  final bool isExpanded;
  final void Function() onTap;

  Widget buildTitle() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Pallet.primary,
        ),
      ),
    );
  }

  Widget buildButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(0),
        child: Icon(
          !isExpanded ? Icons.expand_more : Icons.expand_less,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
            color: Pallet.surface, borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: buildTitle()),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }
}
