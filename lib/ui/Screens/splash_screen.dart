import 'package:flutter/material.dart';
import 'package:task_management/ui/Screens/main_navbar_screen.dart';
import 'package:task_management/ui/Screens/sign_in_screen.dart';
import 'package:task_management/ui/controllers/auth_controller.dart';
import '../widgets/app_logo.dart';
import '../widgets/backgroun_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveTONextScreen();
  }

  Future<void> moveTONextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    bool isUserLoggedIn = await AuthController.isUserLoggedIn();
    if (isUserLoggedIn) {
      Navigator.pushReplacementNamed(context, MainNavbarScreen.name);
    } else {
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: Center(
          child: AppLogo(),
        ),
      ),
    );
  }
}
