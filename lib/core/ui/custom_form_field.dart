import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/text_config.dart';
import 'package:fitness_app/core/utils/theme_helper.dart';

enum FormFieldType {
  name,
  mail,
  password,
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.formFieldType,
    required this.controller,
  });
  final FormFieldType formFieldType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Center(
        child: _getFormFieldByType(formFieldType, controller),
      ),
    );
  }
}

Widget _getFormFieldByType(
    FormFieldType formFieldType, TextEditingController controller) {
  switch (formFieldType) {
    case FormFieldType.mail:
      return TextFormField(
        decoration: ThemeHelper.formFieldDecoration.copyWith(
          labelText: TextConfig.formMessages.emailLabel,
        ),
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        validator: (value) {
          if (value == null || value == "") {
            return TextConfig.errorMessages.emptyValue;
          }
          if (!EmailValidator.validate(value)) {
            return TextConfig.errorMessages.incorrectMail;
          }

          return null;
        },
      );
    case FormFieldType.password:
      return TextFormField(
        decoration: ThemeHelper.formFieldDecoration.copyWith(
          labelText: TextConfig.formMessages.passwordLabel,
        ),
        obscureText: true,
        controller: controller,
        validator: (value) {
          if (value == null || value == "") {
            return TextConfig.errorMessages.emptyValue;
          }
          if (value.length <= 6) {
            return TextConfig.errorMessages.shortPassword;
          }

          return null;
        },
      );
    case FormFieldType.name:
      return TextFormField(
        decoration: ThemeHelper.formFieldDecoration.copyWith(
          labelText: TextConfig.formMessages.nameLabel,
        ),
        controller: controller,
        validator: (value) {
          if (value == null || value == "") {
            return TextConfig.errorMessages.emptyValue;
          }

          return null;
        },
      );
  }
}
