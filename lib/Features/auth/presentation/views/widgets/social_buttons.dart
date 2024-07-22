import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SignInButton(
          Buttons.GoogleDark,
          elevation: 3,
          padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          onPressed: () {},
        ),
        SignInButton(
          Buttons.AppleDark,
          elevation: 3,
          padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
