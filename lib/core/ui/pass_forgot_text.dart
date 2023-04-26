import 'package:fitness_app/core/utils/text_config.dart';
import 'package:flutter/material.dart';

class PassForgotText extends StatelessWidget {
  const PassForgotText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO go to forgot password page
      },
      child: Text(
        TextConfig.formMessages.forgotPassText,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
