import 'package:aroom_pro/widgets/register_widgets/login_form.dart';
import 'package:aroom_pro/widgets/register_widgets/signup_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  static const String routeName = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Container(
          alignment: const AlignmentDirectional(0, -1),
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0, 0.5],
              begin: const AlignmentDirectional(0, 1),
              end: const AlignmentDirectional(0, -1),
              colors: [
                const Color(0xffff5a00),
                Theme.of(context).colorScheme.onPrimary,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 403,
                  height: 239,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: const AlignmentDirectional(0, 0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 0, 230, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/lamb.png',
                              width: 112,
                              height: 421,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-0.49, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/aroom_logo.png',
                              width: 321,
                              height: 424,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height,
                    constraints: const BoxConstraints(
                      maxWidth: 570,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const Alignment(0, 0),
                            child: TabBar(
                              tabAlignment: TabAlignment.center,
                              labelColor:
                                  Theme.of(context).colorScheme.onSurface,
                              unselectedLabelColor:
                                  Theme.of(context).colorScheme.tertiary,
                              labelPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      32, 0, 32, 0),
                              indicatorColor:
                                  Theme.of(context).colorScheme.primary,
                              labelStyle:
                                  Theme.of(context).textTheme.titleLarge,
                              unselectedLabelStyle:
                                  Theme.of(context).textTheme.titleLarge,
                              indicatorWeight: 3,
                              isScrollable: true,
                              dividerHeight: 0,
                              tabs: const [
                                Tab(
                                  text: 'Create Account',
                                ),
                                Tab(
                                  text: 'Log In',
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: TabBarView(
                              children: [
                                SignupForm(),
                                LoginForm(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
