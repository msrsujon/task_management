import 'package:flutter/material.dart';
import 'package:task_management/ui/widgets/backgroun_screen.dart';

import '../widgets/TaskItemWidget.dart';
import '../widgets/TaskStatusSummeryCounterWidget.dart';
import '../widgets/tm_app_bar.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({super.key});

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: TMAppBar(
        fromUpdateProfile: false,
      ),
      body: BackgroundScreen(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //   buildTaskStatusSummaryWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: buildTaskListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildTaskListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return TaskItemWidget();
      },
    );
  }

  Widget buildTaskStatusSummaryWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskStatusSummaryCounterWidget(
              count: '09',
              title: 'new',
            ),
            TaskStatusSummaryCounterWidget(
              count: '12',
              title: 'Progress',
            ),
            TaskStatusSummaryCounterWidget(
              count: '15',
              title: 'Complete',
            ),
            TaskStatusSummaryCounterWidget(
              count: '10',
              title: 'Cancel',
            ),
          ],
        ),
      ),
    );
  }
}
