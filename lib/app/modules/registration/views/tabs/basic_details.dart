import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentiapractice/app/modules/registration/controllers/registration_controller.dart';
import 'package:sentiapractice/app/modules/registration/values/dimens.dart';
import 'package:sentiapractice/app/modules/registration/values/pallet.dart';
import 'package:sentiapractice/app/modules/registration/views/widgets/accordion.dart';
import 'package:sentiapractice/app/modules/registration/views/widgets/form_label.dart';
import 'package:sentiapractice/app/modules/registration/views/widgets/shadows.dart';
import 'package:sentiapractice/app/modules/registration/views/widgets/text_form_field.dart';

class BasicDetailsTab extends GetView<RegistrationController> {
  const BasicDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      var width = MediaQuery.of(context).size.width;
      if (width > 800) {
        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PersonalDetailsSection(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ObstetricHistorySection(),
                  PregnancyDetailsSection(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HusbandDetailsSection(),
                ],
              ),
            ),
          ],
        );
      } else {
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PersonalDetailsSection(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ObstetricHistorySection(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PregnancyDetailsSection(),
              ],
            ),
          ],
        );
      }
    });
  }
}

class PersonalDetailsSection extends GetView<RegistrationController> {
  const PersonalDetailsSection({super.key});

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormLabel(
          "Name",
          required: true,
        ),
        InputFieldShadow(
          child: TextFormField(
            decoration: FormWidgetStyles.inputFieldDecoration,
            style: FormWidgetStyles.inputFieldTextStyle,
          ),
        ),
      ],
    );
  }

  Widget buildAgeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormLabel(
          "Age",
          required: true,
        ),
        InputFieldShadow(
          child: TextFormField(
            decoration: FormWidgetStyles.inputFieldDecoration.copyWith(
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(
                  "Years",
                  style: TextStyle(
                    color: Pallet.formHintText,
                  ),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
            ),
            style: FormWidgetStyles.inputFieldTextStyle,
          ),
        ),
      ],
    );
  }

  Widget buildBirthdayField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormLabel("Birthday"),
        InputFieldShadow(
          child: TextFormField(
            decoration: FormWidgetStyles.inputFieldDecoration.copyWith(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    );
                  },
                  child: const Icon(Icons.calendar_month_outlined),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
            ),
            style: FormWidgetStyles.inputFieldTextStyle,
          ),
        ),
      ],
    );
  }

  Widget buildMobileNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormLabel(
          "Mobile Number",
          required: true,
        ),
        InputFieldShadow(
          child: TextFormField(
            decoration: FormWidgetStyles.inputFieldDecoration.copyWith(
              prefixIcon: InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 4.0),
                  child: Text("+91"),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
            ),
            style: FormWidgetStyles.inputFieldTextStyle,
          ),
        ),
      ],
    );
  }

  Widget buildAadhaarNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormLabel(
          "Aadhaar Number",
        ),
        InputFieldShadow(
          child: TextFormField(
            decoration: FormWidgetStyles.inputFieldDecoration,
            style: FormWidgetStyles.inputFieldTextStyle,
          ),
        ),
      ],
    );
  }

  Widget buildCategoryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormLabel(
          "Category",
          required: false,
        ),
        InputFieldShadow(
          child: DropdownButtonFormField(
            isDense: true,
            isExpanded: true,
            decoration: FormWidgetStyles.inputFieldDecoration,
            style: FormWidgetStyles.inputFieldTextStyle,
            value: "Select Category",
            items: controller.categories.asMap().entries.map((entry) {
              final index = entry.key;
              final category = entry.value;
              return DropdownMenuItem(
                value: category,
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: Dimen.formTextSize,
                    color: index == 0 ? Pallet.formHintText : Pallet.formText,
                    fontFamily: 'Default',
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget buildBloodGroupField() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormLabel(
              "Blood Group",
              required: false,
            ),
            Obx(
              () => ToggleSelector(
                groupValue: controller.selectedBloodGroup.value,
                onChange: (value) {
                  controller.selectedBloodGroup.value = value;
                },
                values: const ["A", "B", "AB", "O"],
              ),
            ),
          ],
        ),
        const SizedBox(
          width: Dimen.formFieldSpace,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormLabel(
              "Blood Rh",
              required: false,
            ),
            Obx(
              () => ToggleSelector(
                groupValue: controller.selectedBloodRh.value,
                onChange: (value) {
                  controller.selectedBloodRh.value = value;
                },
                values: const ["+ve", "-ve"],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildBottomSpace() {
    return const SizedBox(
      height: Dimen.formFieldSpace,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Accordion(
      title: "Personal Information",
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: Pallet.onSurfaceStroke,
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: buildNameField(),
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 120),
                    child: buildBirthdayField(context),
                  ),
                ),
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 100),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: Dimen.formFieldSpace),
                      child: buildAgeField(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: buildMobileNumberField(),
                ),
                const SizedBox(
                  width: Dimen.formFieldSpace,
                ),
                Expanded(
                  child: buildAadhaarNumberField(),
                ),
              ],
            ),
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: buildCategoryField(),
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: buildBloodGroupField()),
              ],
            ),
          ),
          buildBottomSpace(),
        ],
      ),
    );
  }
}

class ObstetricHistorySection extends GetView<RegistrationController> {
  const ObstetricHistorySection({super.key});

  Widget buildGravidaParaField() {
    return Builder(builder: (context) {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FormLabel(
                  "Gravida",
                  required: false,
                ),
                InputFieldShadow(
                  child: TextFormField(
                    controller: controller.gravidaEC,
                    decoration:
                        FormWidgetStyles.inputFieldDecorationWithAddRemove(
                            controller.gravidaEC),
                    textAlign: TextAlign.center,
                    style: FormWidgetStyles.inputFieldTextStyle,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: Dimen.formFieldSpace,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FormLabel(
                  "Para",
                  required: false,
                ),
                InputFieldShadow(
                  child: TextFormField(
                    controller: controller.paraEC,
                    decoration:
                        FormWidgetStyles.inputFieldDecorationWithAddRemove(
                      controller.paraEC,
                    ),
                    textAlign: TextAlign.center,
                    style: FormWidgetStyles.inputFieldTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget buildChildrenAndMiscarriagesField() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FormLabel(
                "Living Children",
                required: false,
              ),
              InputFieldShadow(
                child: TextFormField(
                  controller: controller.livingChildrenEC,
                  decoration:
                      FormWidgetStyles.inputFieldDecorationWithAddRemove(
                    controller.livingChildrenEC,
                  ),
                  textAlign: TextAlign.center,
                  style: FormWidgetStyles.inputFieldTextStyle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: Dimen.formFieldSpace,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FormLabel(
                "Miscarriages",
                required: false,
              ),
              InputFieldShadow(
                child: TextFormField(
                  controller: controller.miscarriagesEC,
                  decoration:
                      FormWidgetStyles.inputFieldDecorationWithAddRemove(
                    controller.miscarriagesEC,
                  ),
                  textAlign: TextAlign.center,
                  style: FormWidgetStyles.inputFieldTextStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMenstrualCycleField() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormLabel(
              "Menstrual Cycle",
              required: false,
            ),
            Obx(
              () => ToggleSelector(
                groupValue: controller.menstrualCycleType.value,
                onChange: (value) {
                  controller.menstrualCycleType.value = value;
                },
                values: const ["Regular", "Irregular"],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildBottomSpace() {
    return const SizedBox(
      height: Dimen.formFieldSpace,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Accordion(
      title: "Obstetric History",
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: Pallet.onSurfaceStroke,
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: buildGravidaParaField(),
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: buildChildrenAndMiscarriagesField(),
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: buildMenstrualCycleField(),
          ),
          buildBottomSpace(),
        ],
      ),
    );
  }
}

class PregnancyDetailsSection extends GetView<RegistrationController> {
  const PregnancyDetailsSection({super.key});

  Widget buildLmpAndEddField() {
    return LayoutBuilder(builder: (context, constraints) {
      double width = MediaQuery.of(context).size.width;
      if (width > 800) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FormLabel(
                    "LMP",
                    required: false,
                  ),
                  InputFieldShadow(
                    child: TextFormField(
                      decoration:
                          FormWidgetStyles.inputFieldDecoration.copyWith(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: InkWell(
                            onTap: () async {
                              await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 30)),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 30)),
                              );
                            },
                            child: const Icon(Icons.calendar_month_outlined),
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                      ),
                      style: FormWidgetStyles.inputFieldTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: Dimen.formFieldSpace,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FormLabel(
                    "EDD",
                    required: false,
                  ),
                  InputFieldShadow(
                    child: TextFormField(
                      decoration:
                          FormWidgetStyles.inputFieldDecoration.copyWith(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: InkWell(
                            onTap: () async {
                              await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 30)),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 30)),
                              );
                            },
                            child: const Icon(Icons.calendar_month_outlined),
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                      ),
                      style: FormWidgetStyles.inputFieldTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: Dimen.formFieldSpace,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FormLabel(
                    "Scan EDD",
                    required: false,
                  ),
                  InputFieldShadow(
                    child: TextFormField(
                      decoration:
                          FormWidgetStyles.inputFieldDecoration.copyWith(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: InkWell(
                            onTap: () async {
                              await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 30)),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 30)),
                              );
                            },
                            child: const Icon(Icons.calendar_month_outlined),
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                      ),
                      style: FormWidgetStyles.inputFieldTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const FormLabel(
                        "LMP",
                        required: false,
                      ),
                      InputFieldShadow(
                        child: TextFormField(
                          decoration:
                              FormWidgetStyles.inputFieldDecoration.copyWith(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: InkWell(
                                onTap: () async {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now()
                                        .subtract(const Duration(days: 30)),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 30)),
                                  );
                                },
                                child:
                                    const Icon(Icons.calendar_month_outlined),
                              ),
                            ),
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                          ),
                          style: FormWidgetStyles.inputFieldTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: Dimen.formFieldSpace,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const FormLabel(
                        "EDD",
                        required: false,
                      ),
                      InputFieldShadow(
                        child: TextFormField(
                          decoration:
                              FormWidgetStyles.inputFieldDecoration.copyWith(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: InkWell(
                                onTap: () async {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now()
                                        .subtract(const Duration(days: 30)),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 30)),
                                  );
                                },
                                child:
                                    const Icon(Icons.calendar_month_outlined),
                              ),
                            ),
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                          ),
                          style: FormWidgetStyles.inputFieldTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Dimen.formFieldSpace,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FormLabel(
                  "Scan EDD",
                  required: false,
                ),
                InputFieldShadow(
                  child: TextFormField(
                    decoration: FormWidgetStyles.inputFieldDecoration.copyWith(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: InkWell(
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 30)),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 30)),
                            );
                          },
                          child: const Icon(Icons.calendar_month_outlined),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                    ),
                    style: FormWidgetStyles.inputFieldTextStyle,
                  ),
                ),
              ],
            ),
          ],
        );
      }
    });
  }

  Widget buildGestationAgeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormLabel(
          "Gestation Age",
          required: false,
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              child: InputFieldShadow(
                child: TextFormField(
                  decoration: FormWidgetStyles.inputFieldDecoration.copyWith(
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text(
                        "Weeks",
                        style: TextStyle(
                          color: Pallet.formHintText,
                        ),
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                  ),
                  style: FormWidgetStyles.inputFieldTextStyle,
                ),
              ),
            ),
            const SizedBox(
              width: Dimen.formFieldSpace,
            ),
            SizedBox(
              width: 100,
              child: InputFieldShadow(
                child: TextFormField(
                  decoration: FormWidgetStyles.inputFieldDecoration.copyWith(
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text(
                        "Days",
                        style: TextStyle(
                          color: Pallet.formHintText,
                        ),
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                  ),
                  style: FormWidgetStyles.inputFieldTextStyle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildBottomSpace() {
    return const SizedBox(
      height: Dimen.formFieldSpace,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Accordion(
      title: "Pregnancy Details",
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: Pallet.onSurfaceStroke,
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: buildLmpAndEddField(),
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: buildGestationAgeField(),
          ),
          buildBottomSpace(),
        ],
      ),
    );
  }
}

class HusbandDetailsSection extends GetView<RegistrationController> {
  const HusbandDetailsSection({super.key});

  Widget buildHusbandNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormLabel(
          "Husband Name",
          required: false,
        ),
        InputFieldShadow(
          child: TextFormField(
            decoration: FormWidgetStyles.inputFieldDecoration,
            style: FormWidgetStyles.inputFieldTextStyle,
          ),
        ),
      ],
    );
  }

  Widget buildHusbandMobileNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormLabel(
          "Husband Mobile Number",
          required: true,
        ),
        InputFieldShadow(
          child: TextFormField(
            decoration: FormWidgetStyles.inputFieldDecoration.copyWith(
              prefixIcon: InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 4.0),
                  child: Text("+91"),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
            ),
            style: FormWidgetStyles.inputFieldTextStyle,
          ),
        ),
      ],
    );
  }

  Widget buildBloodGroupField() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormLabel(
              "Husband Blood Group",
              required: false,
            ),
            Obx(
              () => ToggleSelector(
                groupValue: controller.selectedHusbandBloodGroup.value,
                onChange: (value) {
                  controller.selectedHusbandBloodGroup.value = value;
                },
                values: const ["A", "B", "AB", "O"],
              ),
            ),
          ],
        ),
        const SizedBox(
          width: Dimen.formFieldSpace,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormLabel(
              "Blood Rh",
              required: false,
            ),
            Obx(
              () => ToggleSelector(
                groupValue: controller.selectedHusbandBloodRh.value,
                onChange: (value) {
                  controller.selectedHusbandBloodRh.value = value;
                },
                values: const ["+ve", "-ve"],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildBottomSpace() {
    return const SizedBox(
      height: Dimen.formFieldSpace,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Accordion(
      title: "Husband Details",
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: Pallet.onSurfaceStroke,
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: buildHusbandNameField(),
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: buildHusbandMobileNumberField(),
          ),
          Padding(
            padding: FormWidgetStyles.inputFieldPaddingLTR,
            child: buildBloodGroupField(),
          ),
          buildBottomSpace(),
        ],
      ),
    );
  }
}

class ToggleSelector extends StatelessWidget {
  final String groupValue;
  final void Function(String value) onChange;
  final List<String> values;

  const ToggleSelector(
      {super.key,
      required this.groupValue,
      required this.onChange,
      required this.values});

  Widget buildItem(String value) {
    bool isSelected = groupValue == value;
    return InkWell(
      onTap: () {
        if (groupValue == value) {
          onChange('');
        } else {
          onChange(value);
        }
      },
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 40,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimen.formFieldRadius),
          color: isSelected ? Pallet.primary.shade50 : Pallet.surface,
          border: Border.all(
              color: (isSelected) ? Pallet.primary : Pallet.primary.shade50,
              width: 1.0),
        ),
        child: Text(
          value,
          style: TextStyle(
            fontSize: Dimen.formTextSize,
            color: (!isSelected) ? Pallet.formText : Pallet.primary,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimen.formFieldRadius),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimen.formFieldRadius),
          border: Border.all(color: Pallet.formFieldStroke, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...values
                .map(
                  (e) => buildItem(e),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
