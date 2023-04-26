import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:fitness_app/core/providers/form_field_providers.dart';
import 'package:fitness_app/core/ui/custom_form_button.dart';
import 'package:fitness_app/core/ui/custom_form_field.dart';

class RegisterForm extends ConsumerWidget {
  RegisterForm({super.key});

  final log = Logger("RegisterForm");
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nameFieldProvider);
    final mailController = ref.watch(mailFieldProvider);
    final passController = ref.watch(passwordFieldProvider);
    return Form(
      key: _formKey,
      child: Expanded(
        child: Column(
          children: [
            CustomFormField(
              formFieldType: FormFieldType.name,
              controller: nameController,
            ),
            const SizedBox(height: 20),
            CustomFormField(
              formFieldType: FormFieldType.mail,
              controller: mailController,
            ),
            const SizedBox(height: 20),
            CustomFormField(
              formFieldType: FormFieldType.password,
              controller: passController,
            ),
            const Spacer(),
            const CustomFormButton(formButtonType: FormButtonType.login),
          ],
        ),
      ),
    );
  }
}
