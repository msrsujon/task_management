import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/data/services/network_caller.dart';
import 'package:task_management/ui/widgets/backgroun_screen.dart';
import 'package:task_management/ui/widgets/snack_bar_message.dart';
import 'package:task_management/ui/widgets/tm_app_bar.dart';

import '../data/utils/urls.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add_new_task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subTEController = TextEditingController();
  final TextEditingController _desNameTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewTaskInProgress = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: TMAppBar(fromUpdateProfile: false),
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
                    'Add New Task',
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _subTEController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your title here';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    maxLines: 6,
                    controller: _desNameTEController,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your title here';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Description',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Visibility(
                    visible: _addNewTaskInProgress == false,
                    replacement: const CircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _createNewTask();
                        }
                      },
                      child: Icon(Icons.arrow_circle_right_outlined),
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

  Future<void> _createNewTask() async {
    _addNewTaskInProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "title": _subTEController.text.trim(),
      "description": _desNameTEController.text.trim(),
      "status": "New"
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.createTaskUrl, body: requestBody);

    _addNewTaskInProgress = false;
    setState(() {});
    if (response.isSuccess) {
      clearTextField();
      ShowSnakBarMessage(context, 'New Task added');
    } else {
      ShowSnakBarMessage(context, 'New Task add fail! try again');
    }
  }

  void clearTextField() {
    _subTEController.clear();
    _desNameTEController.clear();
  }

  @override
  void dispose() {
    _subTEController.dispose();
    _desNameTEController.dispose();
    super.dispose();
  }
}
