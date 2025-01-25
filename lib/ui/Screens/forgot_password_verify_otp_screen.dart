import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_management/ui/Screens/set_password_screen.dart';
import 'package:task_management/ui/Screens/sign_in_screen.dart';
import 'package:task_management/ui/utilies/apps_colors.dart';
import 'package:task_management/ui/widgets/backgroun_screen.dart';

class ForgotPasswordVerifyOtpScreen extends StatefulWidget {
  const ForgotPasswordVerifyOtpScreen({super.key});

  static const String name = '/forgot-password-otp';

  @override
  State<ForgotPasswordVerifyOtpScreen> createState() =>
      _ForgotPasswordVerifyOtpScreenState();
}

class _ForgotPasswordVerifyOtpScreenState
    extends State<ForgotPasswordVerifyOtpScreen> {
  final TextEditingController _pinTEController = TextEditingController();
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
                    'PIN Verification',
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'A 6 digit of OTP has been sent to your email adress',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  //**************** pic code

                  buildPinCodeTextField(context),
                  //********* pin code ses
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SetPasswordScreen.name);
                    },
                    child: Text("Verify"),
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

  PinCodeTextField buildPinCodeTextField(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      controller: _pinTEController,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        inactiveColor: Colors.pinkAccent,
      ),
      appContext: context,
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
    _pinTEController.dispose();
    super.dispose();
  }
}
