import 'package:flutter/material.dart';
import 'package:task_management/ui/data/models/task-count_by_s_Model.dart';
import 'package:task_management/ui/data/models/task_list_by_status_model.dart';
import 'package:task_management/ui/data/services/network_caller.dart';
import 'package:task_management/ui/utilies/centered_circular_progress_indicator.dart';
import 'package:task_management/ui/widgets/backgroun_screen.dart';
import 'package:task_management/ui/widgets/snack_bar_message.dart';

import '../data/models/completeTaskListByStatusModel.dart';
import '../data/utils/urls.dart';
import '../widgets/TaskItemWidget.dart';
import '../widgets/TaskStatusSummeryCounterWidget.dart';
import '../widgets/tm_app_bar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getTaskCountByStatusInProgress = false;
  bool _getNewTaskListInProgress = false;
  TaskCountByStatusModel? taskCountByStatusModel;
  TaskListByStatusModel? newTaskListModel;

  CompleteTaskListByStatusModel? completeTaskListModel;

  @override
  void initState() {
    super.initState();
    _getTaskCountByStatus();
    _getNewTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(
        fromUpdateProfile: false,
      ),
      body: BackgroundScreen(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTaskStatusSummaryWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Visibility(
                      visible: _getNewTaskListInProgress == false,
                      replacement: const CenteredCircularProgressIndicator(),
                      child: buildTaskListView()),
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
      itemCount: newTaskListModel?.taskList!.length ?? 0,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return TaskItemWidget(
          color: Colors.blue,
          taskModel: newTaskListModel!.taskList![index],
        );
      },
    );
  }

  Widget buildTaskStatusSummaryWidget() {
    return SizedBox(
      height: 120,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Visibility(
          visible: _getTaskCountByStatusInProgress == false,
          replacement: const CenteredCircularProgressIndicator(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount:
                    taskCountByStatusModel?.taskByStatusList?.length ?? 0,
                itemBuilder: (context, index) {
                  final model =
                      taskCountByStatusModel!.taskByStatusList![index];
                  return TaskStatusSummaryCounterWidget(
                      title: model.sId ?? '', count: model.sum.toString());
                }),
          ),
        ),
      ),
    );
  }

  Future<void> _getTaskCountByStatus() async {
    _getTaskCountByStatusInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.taskCountUrl);

    if (response.isSuccess) {
      taskCountByStatusModel =
          TaskCountByStatusModel.fromJson(response.responseData!);
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
    _getTaskCountByStatusInProgress = false;
    setState(() {});
  }

  Future<void> _getNewTaskList() async {
    _getNewTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.taskNewListUrl('new'));

    if (response.isSuccess) {
      newTaskListModel = TaskListByStatusModel.fromJson(response.responseData!);
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
    _getNewTaskListInProgress = false;
    setState(() {});
  }

  Future<void> _getCompletTaskList() async {
    _getNewTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.taskNewListUrl('complete'));

    if (response.isSuccess) {
      completeTaskListModel =
          CompleteTaskListByStatusModel.fromJson(response.responseData!);
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
    _getNewTaskListInProgress = false;
    setState(() {});
  }
}
