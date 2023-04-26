import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _iconButtonWrapper(
          IconButton(
            iconSize: 48,
            padding: const EdgeInsets.all(8),
            icon: SvgPicture.asset("assets/icons/apple.svg"),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 20),
        _iconButtonWrapper(
          IconButton(
            iconSize: 48,
            padding: const EdgeInsets.all(8),
            icon: SvgPicture.asset("assets/icons/google.svg"),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 20),
        _iconButtonWrapper(
          IconButton(
            iconSize: 48,
            padding: const EdgeInsets.all(8),
            icon: SvgPicture.asset("assets/icons/facebook.svg"),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

Widget _iconButtonWrapper(Widget iconButton) {
  return Material(
    child: Ink(
      decoration: const ShapeDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        shape: CircleBorder(),
      ),
      child: iconButton,
    ),
  );
}
