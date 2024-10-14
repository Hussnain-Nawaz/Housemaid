import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/Client/CLientOTPController.dart';
import 'package:house_maid_project/Controllers/Registeration/Client/ClientRegController.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Lazy initialization of the RegistrationController
    Get.lazyPut<HousemaidRegistrationController>(
        () => HousemaidRegistrationController());
    Get.lazyPut<ClientRegistrationController>(
        () => ClientRegistrationController());
    Get.lazyPut<HousemaidRegistrationController>(
        () => HousemaidRegistrationController(),
        fenix: true);
    Get.lazyPut<ClientOtpController>(() => ClientOtpController(), fenix: true);

    // If you have other controllers, you can initialize them here
    // Get.lazyPut<AnotherController>(() => AnotherController());
  }
}
