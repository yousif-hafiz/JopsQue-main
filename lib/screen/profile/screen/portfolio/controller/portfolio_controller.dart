import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../../provider/provider.dart';


class PortfolioController extends GetxController {
  JopProvider cont = JopProvider();
  final List<Widget> portfolioList = [];

  void setPortfolio() {
    // Add portfolio file here
    cont.setPortfolio();
  }

  void setCVFile() {
    // Set CV file here
    cont.setCVFile();
  }

  void removePortfolio(String fileName) {
    // Remove portfolio file here
    cont.removeCVData();
  }
}
