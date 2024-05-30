import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduated_project/widgets/custom_search.dart';

import 'controller/help_center_controller.dart';

class HelpCenterScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomSearch(
                hinitText: "What can we help?",
                searchController: searchController,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  CustomExpansionTile({super.key, this.isExpansion = false});

  bool isExpansion;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpCenterController>(
      init: HelpCenterController(),
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD1D5DB)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            onExpansionChanged: (value) {
              controller.toggleExpansion();
            },
            trailing: Image.asset(
              controller.isExpansion
                  ? "assets/image/icons/arrow-up.png"
                  : "assets/image/icons/arrow-down.png",
              color: const Color(0xff9CA3AF),
              height: 20,
            ),
            iconColor: Colors.black,
            title: const Text(
              "The customer is very happy",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(width: 00, color: Color(0xffD1D5DB)),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  controller.item.expanded,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                  ),
                  strutStyle: StrutStyle(height: 1.3),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

