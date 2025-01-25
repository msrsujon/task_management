import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/Screens/forgot_password_screen.dart';
import 'package:task_management/ui/Screens/main_navbar_screen.dart';
import 'package:task_management/ui/Screens/sign_up_screen.dart';
import 'package:task_management/ui/controllers/auth_controller.dart';
import 'package:task_management/ui/data/models/user_model.dart';
import 'package:task_management/ui/data/services/network_caller.dart';
import 'package:task_management/ui/data/utils/urls.dart';
import 'package:task_management/ui/utilies/apps_colors.dart';
import 'package:task_management/ui/utilies/centered_circular_progress_indicator.dart';
import 'package:task_management/ui/widgets/backgroun_screen.dart';

import '../widgets/snack_bar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/Sign_in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _EmailTEController = TextEditingController();
  final TextEditingController _PasswortTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _siginInProgress = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundScreen(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context)
                    .size
                    .height, // Add height constraint here
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Get Started With',
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _EmailTEController,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _PasswortTEController,
                      obscureText: true,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Visibility(
                      visible: _siginInProgress == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _OnTapSignIn,
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgotPasswordScreen.name);
                      },
                      child: const Text('Forgot Password?'),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: '  Sign up',
                            style: const TextStyle(
                              color: AppColors.themeColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, SignUpScreen.name);
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
      ),
    );
  }

  void _OnTapSignIn() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  Future<void> _signIn() async {
    setState(() {
      _siginInProgress = true;
    });

    Map<String, dynamic> requestBody = {
      "email": _EmailTEController.text.trim(),
      "password": _PasswortTEController.text,
    };

    final NetworkResponse response =
        await NetworkCaller.postRequest(url: Urls.signInUrl, body: requestBody);
    if (response.isSuccess) {
      String token = response.responseData!['token'];
      UserModel userModel = UserModel.fromJson(response.responseData!['data']);
      await AuthController.saveUserData(token, userModel);
      Navigator.pushReplacementNamed(context, MainNavbarScreen.name);
    } else {
      _siginInProgress = false;
      setState(() {});

      if (response.statusCode == 401) {
        ShowSnakBarMessage(context, 'Email/Password invalid! try again');
      } else {
        ShowSnakBarMessage(context, 'login invalid! try again');
      }
    }
  }

  void _clearTextField() {
    _EmailTEController.clear();
    _PasswortTEController.clear();
  }

  @override
  void dispose() {
    _EmailTEController.dispose();
    _PasswortTEController.dispose();
    super.dispose();
  }
}
