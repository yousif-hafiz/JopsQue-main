import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../model/jops.dart';
import '../../../../widgets/custom_chip.dart';
import '../../../../widgets/saved_icon.dart';

import '../../../apply_jop/apply_jop_screen.dart';
import '../controller/AppliedJopItemController.dart';

class AppliedJopItem extends StatelessWidget {
  AppliedJopItem({
    super.key,
    required this.jop,
  }) : controller = AppliedJopItemController(jop);

  final Jops jop;
  final AppliedJopItemController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppliedJopItemController>(
      init: AppliedJopItemController(jop),
      builder: (controller) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(() => ApplyJopScreen(jop: jop));
              },
              child: SizedBox(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            jop.image,
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              jop.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${jop.compName} • ${controller.listLocation[controller.listLocation.length - 2]} ${controller.listLocation.last} ",
                              style: const TextStyle(
                                fontSize: 12,
                                // color: Color(0xff374151),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SavedIcon(jops: jop)
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CustomChip(
                            text: jop.jobTimeType,
                          ),
                          const Spacer(),
                          CustomChip(
                            text: jop.jobType,
                          ),
                          const Spacer(
                            flex: 10,
                          ),
                          const Text(
                            "Posted 2 days ago",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffD1D5DB),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Column(
                                children: [
                                  controller.pageNumber > 0
                                      ? Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff3366FF),
                                        borderRadius:
                                        BorderRadius.circular(100)),
                                    child: const Center(
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )),
                                  )
                                      : Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff9CA3AF)),
                                      borderRadius:
                                      BorderRadius.circular(100),
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: Color(0xff9CA3AF),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Biodata",
                                    style: TextStyle(
                                      color: controller.pageNumber > 0
                                          ? const Color(0xff3366FF)
                                          : Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: DottedLine(
                                  lineLength: 30,
                                  dashColor: controller.pageNumber > 0
                                      ? const Color(0xff3366FF)
                                      : Colors.black),
                            ),
                            Column(
                              children: [
                                controller.pageNumber >= 2
                                    ? Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff3366FF),
                                      borderRadius:
                                      BorderRadius.circular(100)),
                                  child: const Center(
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      )),
                                )
                                    : Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.pageNumber >= 2
                                            ? const Color(0xff3366FF)
                                            : const Color(0xff9CA3AF)),
                                    borderRadius:
                                    BorderRadius.circular(100),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: controller.pageNumber >=
                                              2
                                              ? const Color(0xff3366FF)
                                              : const Color(0xff9CA3AF),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Type of work",
                                  style: TextStyle(
                                    color: controller.pageNumber > 1
                                        ? const Color(0xff3366FF)
                                        : Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                              child: DottedLine(
                                  lineLength: 30,
                                  dashColor: controller.pageNumber > 1
                                      ? const Color(0xff3366FF)
                                      : Colors.black),
                            ),
                            Column(
                              children: [
                                controller.pageNumber > 2
                                    ? Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff3366FF),
                                      borderRadius:
                                      BorderRadius.circular(100)),
                                  child: const Center(
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      )),
                                )
                                    : Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.pageNumber >= 3
                                            ? const Color(0xff3366FF)
                                            : const Color(0xff9CA3AF)),
                                    borderRadius:
                                    BorderRadius.circular(100),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      "3",
                                      style: TextStyle(
                                          color: controller.pageNumber >=
                                              3
                                              ? const Color(0xff3366FF)
                                              : const Color(0xff9CA3AF),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Upload portfolio",
                                  style: TextStyle(
                                    color: controller.pageNumber > 2
                                        ? const Color(0xff3366FF)
                                        : Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
