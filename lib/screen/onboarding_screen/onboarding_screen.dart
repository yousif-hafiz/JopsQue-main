import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../widgets/custom_elevated_button.dart';
import '../../widgets/jobsque_text.dart';
import '../create_accoun/screen/create_account_screen/create_account_screen.dart';
import 'controller/controller.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController _controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          PageView(
            onPageChanged: _controller.onPageChanged,
            controller: _controller.pageController,
            //itemCount: 3,
            children: const [
              OnboardingPage(
                image: 'assets/image/onboarding/Background 1.png',
                text: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: "Find a job, and"),
                      TextSpan(
                        text: " start building ",
                        style: TextStyle(color: Color(0xff3366FF)),
                      ),
                      TextSpan(text: "your career from now on"),
                    ],
                  ),
                ),
                description:
                    'Explore over 25,924 available job roles and upgrade your operator now.',
              ),
              OnboardingPage(
                image: 'assets/image/onboarding/Background 2.png',
                text: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                          text: "Hundreds of jobs are waiting for you to"),
                      TextSpan(
                        text: " join together",
                        style: TextStyle(color: Color(0xff3366FF)),
                      ),
                    ],
                  ),
                ),
                description:
                    'Immediately join us and start applying for the job you are interested in.',
              ),
              OnboardingPage(
                image: 'assets/image/onboarding/Background 3.png',
                text: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: "Get the best"),
                      TextSpan(
                          text: " choice for the job ",
                          style: TextStyle(color: Color(0xff3366FF))),
                      TextSpan(text: "you've always dreamed of"),
                    ],
                  ),
                ),
                description:
                    'The better the skills you have, the greater the good job opportunities for you.',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    JobsqueText(
                      fontSize: 14.0,
                      widthIcon: 14.0,
                      heightIcon: 14.0,
                    ),
                    SizedBox(
                      width: 210,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(()=> CreateAccounScreen());
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.black,
                            //fontWeight: FontWeight.bold
                          ),
                        )),
                  ],
                ),
                const Spacer(),
                dotIndicator(),
                const SizedBox(
                  height: 16,
                ),
                Obx(() =>  CustomElevatedButton(
                  text: _controller.pageNumber.value == 2 ? "Get Started" : "Next",
                  onPressed: () {
                    if (_controller.pageNumber.value == 2) {
                      // Navigate to the CreateAccountOne screen when the "Get Started" button is pressed
                      Get.to(() => CreateAccounScreen());
                    } else {
                      // Navigate to the next page of the onboarding when the "Next" button is pressed
                      _controller.nextPage(context);
                    }
                  },
                  shapeDecorationColor: Colors.blue,
                  textColor: Colors.white,
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dotIndicator() {
    final controller = Get.find<OnboardingController>();
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: i == controller.pageNumber.value
                    ? const Color(0xff3366FF)
                    : const Color(0xffADC8FF),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
        ],
      ),
    );
  }
}
