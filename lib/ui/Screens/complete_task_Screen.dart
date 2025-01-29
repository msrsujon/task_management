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
  get completeTaskListModel => null;

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
      itemCount: completeTaskListModel?.taskList!.length ?? 0,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return TaskItemWidget(
          color: Colors.green,
          taskModel: completeTaskListModel!.taskList![index],
        );
      },
    );
  }

  Widget buildTaskStatusSummaryWidget() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: completeTaskListModel?.taskByStatusList?.length ?? 0,
            itemBuilder: (context, index) {
              final model = completeTaskListModel!.taskByStatusList![index];
              return TaskStatusSummaryCounterWidget(
                  title: model.sId ?? '', count: model.sum.toString());
            }));
  }
}
