import 'package:get/get.dart';

class NotificationEditController extends GetxController {
  final List<String> keyOfJob = [
    "Your Job Search Alert",
    "Job Application Update",
    "Job Application Reminders",
    "Jobs You May Be Interested In",
    "Job Seeker Updates",
  ];

  final Map<String, bool> jobNotification = {
    "Your Job Search Alert": true,
    "Job Application Update": true,
    "Job Application Reminders": false,
    "Jobs You May Be Interested In": true,
    "Job Seeker Updates": false,
  };

  final List<String> keyOfOther = [
    "Show Profile",
    "All Message",
    "Message Nudges",
    // "",
    // "."
  ];

  final Map<String, bool> otherNotification = {
    "Show Profile": true,
    "All Message": true,
    "Message Nudges": true,
    // "": false,
    // ".": true,
  };

  void toggleJobNotification(String key) {
    jobNotification[key] = !jobNotification[key]!;
    update();
  }

  void toggleOtherNotification(String key) {
    otherNotification[key] = !otherNotification[key]!;
    update();
  }
}
