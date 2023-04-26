import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:fitness_app/core/providers/form_field_providers.dart';
import 'package:fitness_app/core/ui/custom_form_button.dart';
import 'package:fitness_app/core/ui/custom_form_field.dart';
import 'package:fitness_app/core/ui/pass_forgot_text.dart';
import 'package:fitness_app/core/ui/social_login_row.dart';

class LoginForm extends ConsumerWidget {
  LoginForm({super.key});

  final log = Logger("LoginForm");
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mailController = ref.watch(mailFieldProvider);
    final passController = ref.watch(passwordFieldProvider);
    return Form(
      key: _formKey,
      child: Expanded(
        child: Column(
          children: [
            CustomFormField(
              formFieldType: FormFieldType.mail,
              controller: mailController,
            ),
            const SizedBox(height: 20),
            CustomFormField(
              formFieldType: FormFieldType.password,
              controller: passController,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SocialLoginRow(),
                Align(
                  alignment: Alignment.centerRight,
                  child: PassForgotText(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Spacer(),
            const CustomFormButton(formButtonType: FormButtonType.login),
          ],
        ),
      ),
    );
  }
}
