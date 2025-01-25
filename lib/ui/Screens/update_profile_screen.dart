import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/utilies/apps_colors.dart';
import 'package:task_management/ui/widgets/backgroun_screen.dart';

import '../widgets/tm_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  static const String name = '/update_profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _EmailTEController = TextEditingController();
  final TextEditingController _FirstNameTEController = TextEditingController();
  final TextEditingController _LastNameTEController = TextEditingController();
  final TextEditingController _MobileTEController = TextEditingController();
  final TextEditingController _PasswortTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: TMAppBar(
        fromUpdateProfile: true,
      ),
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
                    'Update Profile',
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            color: Colors.grey,
                          ),
                          child: const Text("photo"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "No Item selected",
                          maxLines: 1,
                        ),
                      ],
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
                    height: 8,
                  ),
                  TextFormField(
                    controller: _FirstNameTEController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _LastNameTEController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _MobileTEController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _PasswortTEController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_circle_right_outlined),
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
