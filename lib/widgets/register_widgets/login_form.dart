import 'package:aroom_pro/widgets/loading_widget.dart';
import 'package:aroom_pro/widgets/register_widgets/social_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _enteredEmail = '';
  String _enteredPassword = '';
  bool isScure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Form(
        key: _formKey,
        child: isLoading
            ? const LoadingWidget()
            : Column(
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
                    onSaved: (newValue) => _enteredEmail = newValue!,
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter valid email';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 18),
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
                    onSaved: (newValue) => _enteredPassword = newValue!,
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          value.length < 6) {
                        return 'Please enter Strong password';
                      } else {
                        return null;
                      }
                    },
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
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 18),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          isLoading = !isLoading;
                        });
                        _signInWithEmailAndPassword(
                            _enteredEmail, _enteredPassword, context);
                      }
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 16),
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      elevation: 3,
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Or login with',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const SocialButtons(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  )
                ],
              ),
      ),
    );
  }

  void _signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Failed to login'),
            content: Text(e.message ?? 'An unknown error occurred, try again'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    isLoading = !isLoading;
                  });
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
}
