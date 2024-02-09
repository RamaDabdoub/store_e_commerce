import 'package:empty_code/core/enums/connectivity_status.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:get/get.dart';

class MyAppController extends GetxController {
  @override
  void onInit() {
    checkConnection();
    super.onInit();
  }

  void checkConnection() async {
    ConnectivityStatus status =
        connectivitySerivce.getStatus(await connectivity.checkConnectivity());

    connectivitySerivce.connectivityStatusController.add(status);
    isOnline = status == ConnectivityStatus.ONLINE;

    connectivitySerivce.connectivityStatusController.stream.listen((event) {
      isOnline = event == ConnectivityStatus.ONLINE;
    });
  }
}
