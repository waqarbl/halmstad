import 'package:get/get.dart';
import 'package:halmstad/controllers/local_storage.dart';

class EnumsController extends GetxController {
  final jsonMap = {}.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    jsonMap.value = await LocalStorage().readJsonFromFile();

    jsonMap.forEach((key, value) {
      print(key);
      switch (key) {
        case 'userStatuses':
          userStatuses = value;
          print(userStatuses.length);
          break;
        case 'usertype':
          userType = value;
          print(userType.length);
          break;
        case 'actiontype':
          actionType = value;
          print(actionType.length);
          break;
        case 'activitytype':
          activityType = value;
          print(activityType.length);
          break;
        case 'requesttype':
          requestType = value;
          print(requestType.length);
          break;
        case 'locationtype':
          locationType = value;
          print(locationType.length);
          break;
        case 'outcometype':
          outcomeType = value;
          print(outcomeType.length);
          break;
        case 'meetingtype':
          meetingType = value;
          print(meetingType.length);
          break;
        case 'requestcategory':
          requestCategory = value;
          print(requestCategory.length);
          break;
        case 'tipcategory':
          tipCategory = value;
          print(tipCategory.length);
          break;
        case 'requesturgency':
          requestUrgency = value;
          print(requestUrgency.length);
          break;
        case 'requeststatus':
          requestStatus = value;
          print(requestStatus.length);
          break;
        case 'todopriority':
          todoPriority = value;
          print(todoPriority.length);
          break;
      }
    });
  }

  List userStatuses = [];
  List userType = [];
  List actionType = [];
  List activityType = [];
  List requestType = [];
  List locationType = [];
  List outcomeType = [];
  List meetingType = [];
  List requestCategory = [];
  List tipCategory = [];
  List requestUrgency = [];
  List requestStatus = [];
  List todoPriority = [];
}
