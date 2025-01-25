import 'package:flutter/material.dart';
import 'package:task_management/ui/Screens/add_new_task_screen.dart';
import 'package:task_management/ui/Screens/forgot_password_screen.dart';
import 'package:task_management/ui/Screens/forgot_password_verify_otp_screen.dart';
import 'package:task_management/ui/Screens/main_navbar_screen.dart';
import 'package:task_management/ui/Screens/set_password_screen.dart';
import 'package:task_management/ui/Screens/sign_in_screen.dart';
import 'package:task_management/ui/Screens/sign_up_screen.dart';
import 'package:task_management/ui/Screens/update_profile_screen.dart';
import 'ui/Screens/splash_screen.dart';
import 'ui/utilies/apps_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            backgroundColor: AppColors.themeColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == SignInScreen.name) {
          widget = const SignInScreen();
        } else if (settings.name == SignUpScreen.name) {
          widget = const SignUpScreen();
        } else if (settings.name == ForgotPasswordScreen.name) {
          widget = const ForgotPasswordScreen();
        } else if (settings.name == ForgotPasswordVerifyOtpScreen.name) {
          widget = const ForgotPasswordVerifyOtpScreen();
        } else if (settings.name == SetPasswordScreen.name) {
          widget = const SetPasswordScreen();
        } else if (settings.name == MainNavbarScreen.name) {
          widget = const MainNavbarScreen();
        } else if (settings.name == AddNewTaskScreen.name) {
          widget = const AddNewTaskScreen();
        } else if (settings.name == UpdateProfileScreen.name) {
          widget = const UpdateProfileScreen();
        }
        return MaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}
