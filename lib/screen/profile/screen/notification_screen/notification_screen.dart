import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'controller/notification_controller.dart';

class NotificationEditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NotificationEditController controller =
        Get.put(NotificationEditController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Notification"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                    color: const Color(0xffE5E7EB),
                    width: double.infinity,
                    height: 40,
                    child: const Text(
                      "Job notification",
                      style: TextStyle(fontSize: 16, color: Color(0xff6B7280)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  GetBuilder<NotificationEditController>(
                    builder: (controller) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SwitchListTile.adaptive(
                            title: Text(controller.keyOfJob[index]),
                            value: controller
                                .jobNotification[controller.keyOfJob[index]]!,
                            onChanged: (value) {
                              controller.toggleJobNotification(
                                  controller.keyOfJob[index]);
                            },
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                          indent: 15,
                          endIndent: 20,
                          thickness: 1.5,
                        ),
                        itemCount: controller.keyOfJob.length,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                    color: const Color(0xffE5E7EB),
                    width: double.infinity,
                    height: 40,
                    child: const Text(
                      "Other notification",
                      style: TextStyle(fontSize: 16, color: Color(0xff6B7280)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  GetBuilder<NotificationEditController>(
                    builder: (controller) {
                      return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SwitchListTile.adaptive(
                              title: Text(controller.keyOfOther[index]),
                              value: controller.otherNotification[
                                  controller.keyOfOther[index]]!,
                              onChanged: (value) {
                                controller.toggleOtherNotification(
                                    controller.keyOfOther[index]);
                              },
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                indent: 15,
                                endIndent: 20,
                                thickness: 1.5,
                              ),
                          itemCount: controller.keyOfOther.length);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
