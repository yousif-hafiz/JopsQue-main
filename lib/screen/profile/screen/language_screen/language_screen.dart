import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'controller/language_controller.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Language"),
        ),
        body: GetBuilder<LanguageController>(
          builder: (x) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return RadioListTile<String>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Row(
                    children: [
                      Image.asset(
                        controller.flages[index],
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(controller.nameOfLang[index]),
                    ],
                  ),
                  value: controller.nameOfLang[index],
                  groupValue: controller.selectLang.value,
                  onChanged: (value) {
                    controller.selectLang.value = value!;
                    controller.update();
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(
                indent: 15,
                endIndent: 20,
                thickness: 1.5,
              ),
              itemCount: controller.flages.length,
            );
          },
        ));
  }
}
