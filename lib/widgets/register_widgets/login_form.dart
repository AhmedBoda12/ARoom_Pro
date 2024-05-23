import 'package:aroom_pro/widgets/register_widgets/social_buttons.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isScure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Welcome Back',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                      'Fill out the information below in order to access your account.')),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onPrimary,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black12.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: isScure,
                keyboardType: TextInputType.visiblePassword,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isScure = !isScure;
                      });
                    },
                    icon: isScure
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onPrimary,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black12.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  elevation: 3,
                ),
                child: const Text('Get Started'),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Or sign up with',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              const SocialButtons(),
              TextButton(onPressed: () {}, child: Text('Forgot Password?'))
            ],
          ),
        ),
      ),
    );
  }
}
