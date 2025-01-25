import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/utilies/apps_colors.dart';
import 'package:task_management/ui/widgets/backgroun_screen.dart';

import 'forgot_password_verify_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const String name = '/forgot-pass';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _EmailTEController = TextEditingController();
  final TextEditingController _PasswortTEController = TextEditingController();
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
                    'Your Email Address',
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'A 6 digit of OTP will be sent to your email adress',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _EmailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ForgotPasswordVerifyOtpScreen.name);
                    },
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  RichText(
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
                              Navigator.pop(context);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _EmailTEController.dispose();
    _PasswortTEController.dispose();
    super.dispose();
  }
}
