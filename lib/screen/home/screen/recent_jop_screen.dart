import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';

import 'package:get/get.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';

class RecentJopScreen extends StatelessWidget {
  const RecentJopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent Job"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
        child: Consumer(builder: (context, ref, _) {
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  ref.watch(providerr).allJops[index],
              separatorBuilder: (context, index) => const Divider(
                    thickness: 1.5,
                  ),
              itemCount: ref.watch(providerr).allJops.length);
        }),
      ),
    );
  }
}

/*class JopProvider extends GetxController {
  List<JopsItem> allJops = [].obs as List<JopsItem>;

}


class RecentJopScreen extends StatelessWidget {
  JopProvider controller = Get.put(JopProvider());
   RecentJopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent Job"),
      ),
      body: Padding(
        padding:
        const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
        child: Obx(() => ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) =>
          Get.find<JopProvider>().allJops[index],
          separatorBuilder: (context, index) => const Divider(
            thickness: 1.5,
          ),
          itemCount: Get.find<JopProvider>().allJops.length,
        )),
      ),
    );
  }
}*/
