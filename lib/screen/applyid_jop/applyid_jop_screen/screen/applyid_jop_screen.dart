import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:graduated_project/model/jops.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/saved_icon.dart';



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../rejected_apply_job/screen/RejectedApplyiedJopScreen.dart';
import '../controller/applyed_job_controller.dart';

class ApplyidJopScreen extends StatelessWidget {
  const ApplyidJopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApplyidJopController controller = Get.put(ApplyidJopController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Applied Job"),
      ),
      body: Column(children: [
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 50,
          child: CustomSlidingSegmentedControl<int>(
            children: {
              0: Text(
                "Active",
                style: TextStyle(
                    color: controller.pageNumber.value == 0
                        ? Colors.white
                        : const Color.fromARGB(255, 93, 98, 110)),
              ),
              1: Text(
                "Rejected",
                style: TextStyle(
                    color: controller.pageNumber.value == 1
                        ? Colors.white
                        : const Color.fromARGB(255, 93, 98, 110)),
              ),
            },

            fixedWidth: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0XFFF4F4F5)),
            thumbDecoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: const Color(0XFF091A7A)),
            //curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 200),
            onValueChanged: (index) {
              controller.pageNumber.value = index;
              controller.pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear);
            },
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              controller.pageNumber.value = value;
            },
            controller: controller.pageController,
            children: const [
              ActiveApplyidJop(),
              RejectedApplyiedJop(),
            ],
          ),
        ),
      ]),
    );
  }
}

/*class ActiveJobsController extends GetxController {
  JopProvider controller = Get.put(JopProvider());
  //final activeJop = [].obs;
  /*List<AppliedJopItem> activeJop = [];
  List<JopsItem> allJops = [];
  User? user;
  List<SavedJopsItem> savedJops = [];*/


  Future<void> getJops() async {
    Dio dio = Dio();
    String token = controller.user?.token ?? await LocalDataBase.getToken();
    int userID = controller.user?.id ?? await LocalDataBase.getID();

    List? savedJopsId = await LocalDataBase.getSaveJops(userID);

    final response = await dio.get(
      "https://project2.amit-learning.com/api/jobs",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    List listOfJops = response.data['data'];
    controller.allJops.clear();
    controller.activeJop.clear();

    if (listOfJops.isEmpty) {
    } else {
      for (var element in response.data['data']) {
        Jops jop = Jops.fromJson(element);
        if (savedJopsId != null && savedJopsId.isNotEmpty) {
          for (var savejop in savedJopsId) {
            if (savejop == jop.id.toString()) {
              controller.savedJops.add(SavedJopsItem(jop: jop));
              jop.isSaved = true;
            }
          }
        }

        controller.allJops.add(JopsItem(
          jop: jop,
        ));

        controller.activeJop.add(AppliedJopItem(
          jop: jop,
        ));
      }
    }
  }
}*/

/*class ActiveAppliedJop extends StatelessWidget {
  const ActiveAppliedJop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActiveJobsController _controller = Get.put(ActiveJobsController());
    JopProvider controller = Get.put(JopProvider());

    return Obx(() {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
            color: const Color(0xffE5E7EB),
            width: double.infinity,
            height: 35,
            child: Text(
              "   ${controller.activeJop.length} Jops",
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff6B7280),
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
             Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.activeJop.length,
                itemBuilder: (context, index) {
                  return controller.activeJop[index];
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1.5,
                ),
              ),
            ),
        ],
      );
    });
  }
}*/

class ActiveApplyidJop extends StatelessWidget {
  const ActiveApplyidJop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
            color: const Color(0xffE5E7EB),
            width: double.infinity,
            height: 35,
            child: Text(
              "   ${ref.watch(providerr).activeJop.length} Jops",
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff6B7280),
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ref.watch(providerr).activeJop[index],
                  separatorBuilder: (context, index) => const Divider(
                        thickness: 1.5,
                      ),
                  itemCount: ref.watch(providerr).activeJop.length),
            ),
          )
        ],
      );
    });
  }
}

