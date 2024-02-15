import 'package:get_it/get_it.dart';
import 'package:nfc_travel/res/utils/navigation_service.dart';

final getIt = GetIt.instance;

void getItSetUp() {
  getIt.registerLazySingleton(NavigationService.new);
}
