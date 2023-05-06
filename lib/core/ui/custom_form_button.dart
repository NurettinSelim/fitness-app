import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:fitness_app/core/providers/form_field_providers.dart';
import 'package:fitness_app/core/services/auth_service.dart';

enum FormButtonType { login, register }

class CustomFormButton extends ConsumerWidget {
  const CustomFormButton({
    super.key,
    required this.formButtonType,
    required this.formKey,
  });
  final FormButtonType formButtonType;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final log = Logger("CustomFormButton:${formButtonType.name}");
    final mailController = ref.watch(mailFieldProvider);
    final passController = ref.watch(passwordFieldProvider);

    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () async {
          final authService = AuthService();

          //TODO validate values at FormField
          if (formKey.currentState!.validate()) {
            if (formButtonType == FormButtonType.login) {
              final authResult = await authService.signInWithEmail(
                context,
                mailController.text,
                passController.text,
              );

              if (authResult.authError != null) {
                log.info(authResult.authError.toString());
              }
            } else if (formButtonType == FormButtonType.register) {
              final authResult = await authService.registerWithEmail(
                context,
                mailController.text,
                passController.text,
                //TODO UPDATE HERE CANIM
                "DUMMY NAME",
              );

              if (authResult.authError != null) {
                log.info(authResult.authError.toString());
              }
            }
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
        child: Text(
          formButtonType == FormButtonType.login ? "Sign In" : "Register",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
