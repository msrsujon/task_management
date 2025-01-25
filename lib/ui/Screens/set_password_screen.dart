import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/Screens/sign_in_screen.dart';
import 'package:task_management/ui/Screens/sign_up_screen.dart';
import 'package:task_management/ui/utilies/apps_colors.dart';
import 'package:task_management/ui/widgets/backgroun_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  static const String name = '/Set-password';

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _PasswordTEController = TextEditingController();
  final TextEditingController _ConfirmPasswortTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundScreen(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Set Password',
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Minimum leangth password 8 character letters and Number contribution',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _PasswordTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _ConfirmPasswortTEController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Confirm"),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  buildsSignInSection(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText buildsSignInSection(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Have an account?",
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: '  Sign in',
            style: TextStyle(
              color: AppColors.themeColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamedAndRemoveUntil(
                    context, SignInScreen.name, (value) => false);
              },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _PasswordTEController.dispose();
    _ConfirmPasswortTEController.dispose();
    super.dispose();
  }
}
