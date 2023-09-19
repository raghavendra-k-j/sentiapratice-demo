// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentiapractice/values/pallet.dart';

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
        border: Border.all(color: Pallet.onBackgroundSurfaceStroke, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(() => AccordionHeader(
                isExpanded: isAccordionVisible.value,
                title: title,
                onTap: () {
                  isAccordionVisible.value = !isAccordionVisible.value;
                  print("Accordion.build: ");
                },
              )),
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
  const AccordionHeader(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isExpanded});
  final String title;
  final bool isExpanded;
  final void Function() onTap;

  Widget buildTitle() {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
    return Material(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48),
        child: InkWell(
          onTap: onTap,
          child: Ink(
            decoration: const BoxDecoration(color: Pallet.surface),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTitle(),
                buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
