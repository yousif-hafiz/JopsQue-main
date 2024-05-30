import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HelpCenterController extends GetxController {
  Item item = Item(
    header: "The customer is very happy",
    expanded:
    "The customer is very important, the customer will be followed by the customer. Fusce ultricies mi enim, quis vulputate nibh faucibus at Maecenas is in front, whether he accepts or not, he flatters flatters. There is a pillow in front and a trigger porta vulputate. He wants to decorate the classroom and not to the ecological boundaries. The phase of the soft quiver before, in the ullamcorper the mass of the ullamcorper and I chat with Leo and let him be a lot of fun sometimes.",
  );

  bool isExpansion = false;

  void toggleExpansion() {
    isExpansion = !isExpansion;
    update();
  }
}

class Item {
  Item({
    required this.header,
    required this.expanded,
    this.isExpanded = false,
  });

  final String header;
  final String expanded;
  bool isExpanded;
}
