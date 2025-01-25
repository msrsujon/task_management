import 'package:flutter/material.dart';
import 'package:task_management/ui/Screens/add_new_task_screen.dart';
import 'package:task_management/ui/Screens/cancel_task_Screen.dart';
import 'package:task_management/ui/Screens/complete_task_Screen.dart';
import 'package:task_management/ui/Screens/new_task_Screen.dart';
import 'package:task_management/ui/Screens/progress_task_Screen.dart';

class MainNavbarScreen extends StatefulWidget {
  const MainNavbarScreen({super.key});

  static const String name = '/home';

  @override
  State<MainNavbarScreen> createState() => _MainNavbarScreenState();
}

class _MainNavbarScreenState extends State<MainNavbarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _Screen = const [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompleteTaskScreen(),
    CancelTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            _selectedIndex = index;
            setState(() {});
          },
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.new_label_outlined), label: 'New '),
            NavigationDestination(
                icon: Icon(Icons.refresh_outlined), label: 'Progress '),
            NavigationDestination(icon: Icon(Icons.done), label: 'Complete '),
            NavigationDestination(
                icon: Icon(Icons.cancel_outlined), label: 'Cancel '),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewTaskScreen.name);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
