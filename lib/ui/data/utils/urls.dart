class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';
  static const String registrationUrl = '$_baseUrl/registration';
  static const String signInUrl = '$_baseUrl/login';
  static const String createTaskUrl = '$_baseUrl/createTask';
  static const String taskCountUrl = '$_baseUrl/taskStatusCount';
  static String taskNewListUrl(String status) =>
      '$_baseUrl/listTaskByStatus/$status';
}
