import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../applyid_jop/applyid_jop_screen/screen/applyid_jop_screen.dart';
import '../../../../message/screen/home_messsage_screen/home_messsage.dart';
import '../../../../profile/screen/profile_screen.dart';
import '../../../../saved_jops/saved_screen.dart';
import '../../../screen/home_screen.dart';
import '../controller/bottom_nav_bar_controller.dart';

class BootomNavigator extends StatelessWidget {
  BootomNavigator({super.key, this.selectedIndex = 0});

  final int selectedIndex;

  final List<Widget> body = [
    const HomeScreen(),
    HomeMessageScreen(),
    const ApplyidJopScreen(),
    const SavedScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    BottomNavigatorController controller = Get.put(BottomNavigatorController());
    return Scaffold(
      body: Obx(
            () => body[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
            () =>
            BottomNavigationBar(
              // backgroundColor: Colors.amber,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xff3366ff),
              selectedFontSize: 12,
              unselectedFontSize: 12,

              // unselectedFontSize: 5,
              onTap: (index) {
                controller.selectedIndex.value = index;
              },
              currentIndex: controller.selectedIndex.value,
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.white54,
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Image.asset(
                        controller.selectedIndex.value == 0
                            ? "assets/image/icons/home_bold.png"
                            : "assets/image/icons/home.png",
                        height: 30,
                        color: controller.selectedIndex.value == 0
                            ? const Color(0xff3366ff)
                            : const Color(0xffa2a9b4),
                      ),
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child:
                      Image.asset(
                        controller.selectedIndex.value == 1
                            ? "assets/image/icons/message_bold.png"
                            : "assets/image/icons/message.png",
                        height: 30,
                        color: controller.selectedIndex.value == 1
                            ? const Color(0xff3366ff)
                            : const Color(0xffa2a9b4),
                      ),
                    ),
                    label: "Messages"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Image.asset(
                        controller
                            .selectedIndex.value == 2
                            ? "assets/image/icons/briefcase_bold.png"
                            : "assets/image/icons/briefcase.png",
                        height: 30,
                        color: controller
                            .selectedIndex.value == 2
                            ? const Color(0xff3366ff)
                            : const Color(0xffa2a9b4),
                      ),
                    ),
                    label: "Applied"),

                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Image.asset(
                      controller
                          .selectedIndex.value == 3
                          ? "assets/image/icons/archive-minus_bold.png"
                          : "assets/image/icons/archive-minus.png",
                      height: 30,
                      color: controller
                          .selectedIndex.value == 3
                          ? const Color(0xff3366ff)
                          : const Color(0xffa2a9b4),
                    ),
                  ),
                  backgroundColor: Colors.black,
                  label: "Saved",
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Image.asset(
                        controller
                            .selectedIndex.value == 4
                            ? "assets/image/icons/profile_bold.png"
                            : "assets/image/icons/profile.png",
                        height: 30,
                        color: controller
                            .selectedIndex.value == 4
                            ? const Color(0xff3366ff)
                            : const Color(0xffa2a9b4),
                      ),
                    ),
                    label: "Profile"),
              ],
            ),
      ),
    );
  }
}

