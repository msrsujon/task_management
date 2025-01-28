import 'package:task_management/ui/data/models/task_model.dart';

class CompleteTaskListByStatusModel {
  String? status;
  List<TaskModel>? taskList;

  CompleteTaskListByStatusModel({this.status, this.taskList});

  CompleteTaskListByStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskList = <TaskModel>[];
      json['data'].forEach((v) {
        taskList!.add(new TaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.taskList != null) {
      data['data'] = this.taskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
