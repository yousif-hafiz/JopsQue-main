import 'dart:ffi';

import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:graduated_project/model/jops.dart';
import 'package:graduated_project/widgets/custom_chip.dart';
import 'package:graduated_project/widgets/saved_icon.dart';

import '../../widgets/custom_elvated_button.dart';
import '../apply_jop/apply_jop_screen.dart';
import 'controller/jop_detail_controller.dart';
import 'job_detail_company/job_detail_company_screen.dart';
import 'job_detail_people/people_screen.dart';
import 'jop_detail_descreption/jop_detail_descreption_screen.dart';

import 'package:get/get.dart';


class JopDetailScreen extends StatelessWidget {
  const JopDetailScreen({super.key, required this.jop});

  final Jops jop;

  @override
  Widget build(BuildContext context) {
    //SavedIconController controller1 = Get.put(SavedIconController());
    JopDetailController controller = Get.put(JopDetailController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Detail"),
        actions: [
          SizedBox(width: 30, child: SavedIcon(jops: jop)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.network(
            jop.image,
            height: 60,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            jop.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "${jop.compName} • ${jop.location.split(",").last} ",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomChip(
                text: jop.jobTimeType,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomChip(
                text: jop.jobType,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          CustomSlidingSegmentedControl<int>(
            children: {
              0: Text(
                "Desicription",
                style: TextStyle(
                    color: controller.pageNumber.value == 0
                        ? Colors.white
                        : const Color.fromARGB(255, 93, 98, 110)),
              ),
              1: Text(
                "Company",
                // "   Company   ",
                style: TextStyle(
                    color: controller.pageNumber.value == 1
                        ? Colors.white
                        : const Color(0XFF6B7280)),
              ),
              2: Text(
                "People",
                // "   Company   ",
                style: TextStyle(
                    color: controller.pageNumber.value == 2
                        ? Colors.white
                        : const Color(0XFF6B7280)),
              ),
            },

            fixedWidth: 107,
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
            // curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 200),
            onValueChanged: (index) {
              controller.pageNumber.value = index;
              controller.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView(
              // padEnds: false,

              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                controller.pageNumber.value = value;
              },
              controller: controller.pageController,
              children: [
                JopDetailDescreptionScreen(jops: jop),
                JopDetailCompanyScreen(jops: jop),
                JopDetailPeopleScreen(jops: jop)
              ],
            ),
          ),
          CustomElvatedButton(
              text: const Text("Apply now"),
              onpress: () {
                Get.to(
                      () => ApplyJopScreen(
                    jop: jop,
                  ),
                );
              },
              color: const Color(0xff3366FF)),

          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}


/*class JopDetailScreen extends StatefulWidget {
  const JopDetailScreen({super.key, required this.jop});

  final Jops jop;

  @override
  State<JopDetailScreen> createState() => _JopDetailScreenState();
}

class _JopDetailScreenState extends State<JopDetailScreen> {
  int currentText = 0;
  int pageNumber = 0;
  final PageController _pageController = PageController();
  late List listLocation = widget.jop.location.split(" ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Detail"),
        actions: [
          SizedBox(width: 30, child: SavedIcon(jops: widget.jop)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.network(
            widget.jop.image,
            height: 60,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.jop.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "${widget.jop.compName} • ${listLocation[listLocation.length - 2]} ${listLocation.last} ",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomChip(
                text: widget.jop.jobTimeType,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomChip(
                text: widget.jop.jobType,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          CustomSlidingSegmentedControl<int>(
            children: {
              0: Text(
                "Desicription",
                style: TextStyle(
                    color: pageNumber == 0
                        ? Colors.white
                        : const Color.fromARGB(255, 93, 98, 110)),
              ),
              1: Text(
                "Company",
                // "   Company   ",
                style: TextStyle(
                    color: pageNumber == 1
                        ? Colors.white
                        : const Color(0XFF6B7280)),
              ),
              2: Text(
                "People",
                // "   Company   ",
                style: TextStyle(
                    color: pageNumber == 2
                        ? Colors.white
                        : const Color(0XFF6B7280)),
              ),
            },

            fixedWidth: 107,
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
            // curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 200),
            onValueChanged: (index) {
              setState(() {
                pageNumber = index;

                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView(
              // padEnds: false,

              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  pageNumber = value;
                });
              },
              controller: _pageController,
              children: [
                JopDetailDescreptionScreen(jops: widget.jop),
                JopDetailCompanyScreen(jops: widget.jop),
                JopDetailPeopleScreen(jops: widget.jop)
              ],
            ),
          ),
          CustomElvatedButton(
              text: const Text("Apply now"),
              onpress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ApplyJopScreen(
                    jop: widget.jop,
                  ),
                ));
              },
              color: const Color(0xff3366FF)),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}*/

/*import 'dart:ffi';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:graduated_project/apply_jop/apply_jop_screen.dart';
import 'package:graduated_project/jop_detail/job_detail_people/people_screen.dart';
import 'package:graduated_project/model/jops.dart';
import 'package:graduated_project/widgets/custom_chip.dart';
import 'package:graduated_project/widgets/saved_icon.dart';

import '../widgets/custom_elvated_button.dart';
import 'job_detail_company/job_detail_company_screen.dart';
import 'jop_detail_descreption/jop_detail_descreption_screen.dart';

import 'package:get/get.dart';

class JopDetailScreen extends StatelessWidget {
  JopDetailScreen({super.key, required this.jop});

  final Jops jop;

  final JopDetailController controller = Get.put(JopDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Detail"),
        actions: [
          SizedBox(width: 30, child: SavedIcon(jops: jop)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.network(
            controller.jop?.image ?? '',
            height: 60,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            controller.jop?.name ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          Obx(
            () => Text(
              "${controller.jop?.compName ?? ''} • ${controller.listLocation[controller.listLocation.length - 2]} ${controller.listLocation.last} ",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomChip(
                text: controller.jop?.jobTimeType ?? '',
              ),
              const SizedBox(
                width: 10,
              ),
              CustomChip(
                text: controller.jop?.jobType ?? '',
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          CustomSlidingSegmentedControl<int>(
            children: {
              0: Text(
                "Desicription",
                style: TextStyle(
                    color: controller.pageNumber.value == 0
                        ? Colors.white
                        : const Color.fromARGB(255, 93, 98, 110)),
              ),
              1: Text(
                "Company",
                style: TextStyle(
                    color: controller.pageNumber.value == 1
                        ? Colors.white
                        : const Color(0XFF6B7280)),
              ),
              2: Text(
                "People",
                style: TextStyle(
                    color: controller.pageNumber.value == 2
                        ? Colors.white
                        : const Color(0XFF6B7280)),
              ),
            },
            fixedWidth: 107,
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
            duration: const Duration(milliseconds: 200),
            onValueChanged: (index) {
              controller.changePage(index);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(
              () => PageView(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  controller.pageNumber.value = value;
                },
                controller: controller.pageController,
                children: [
                  JopDetailDescreptionScreen(jops: jop),
                  JopDetailCompanyScreen(jops: jop),
                  JopDetailPeopleScreen(jops: jop)
                ],
              ),
            ),
          ),
          CustomElvatedButton(
              text: const Text("Apply now"),
              onpress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ApplyJopScreen(
                      jop: jop,
                    ),
                  ),
                );
              },
              color: const Color(0xff3366FF)),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class JopDetailController extends GetxController {
  Jops? jop;
  late RxList<String> listLocation;
  late PageController pageController;
  RxInt currentText = 0.obs;
  RxInt pageNumber = 0.obs;

  @override
  void onInit() {
    super.onInit();
    jop = jop;
    listLocation = RxList<String>.from(jop!.location.split(" "));
    pageController = PageController();
  }

  void changeText(int value) {
    currentText.value = value;
  }

  void changePage(int value) {
    pageNumber.value = value;
    pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}**/