import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../model/user.dart';
import '../../../../provider/provider.dart';
import '../../../../widgets/custom_search.dart';
import '../../../../widgets/jops_item.dart';
import '../../../applyid_jop/applied_jop_item/screen/AppliedJopItemScreen.dart';
import '../../../message/widget/message_items.dart';
import '../../../profile/screen/portfolio/portfolio_screen.dart';
import '../../../saved_jops/widget/saved_jops_tem.dart';
import '../../widget/recent_searches.dart';

class HomeScreenController extends GetxController {
  final JopProvider _jopProvider = JopProvider();

  List<JopsItem> get allJops => _jopProvider.allJops;
  List<RecentSearches> get recentSearches => _jopProvider.recentSearches;
  Set<PortfolioItem> get portfolioList => _jopProvider.portfolioList;
  List<SavedJopsItem> get savedJops => _jopProvider.savedJops;
  List<AppliedJopItem> get activeJop => _jopProvider.activeJop;
  List<JopsItem> get filterJops => _jopProvider.filterJops;
  List<MessageItems> get messageList => _jopProvider.messageList;
  List<CustomSearch> get messagesItem => _jopProvider.messagesItem;
  String? get typeOfWork => _jopProvider.typeOfWork;
  PlatformFile? get pdfData => _jopProvider.pdfData;
  User? get user => _jopProvider.user;
  bool get isSwitchingVerify => _jopProvider.isSwitchingVerify;
  bool get isTwoStepVerify => _jopProvider.isTwoStepVerify;

}
