import 'package:sportvibez_test/app/app.locator.dart';
import 'package:sportvibez_test/app/app.router.dart';
import 'package:sportvibez_test/services/cache/hive_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _cacheService = locator<HiveService>();

  Future runStartupLogic() async {
    await _cacheService.init();
    _navigationService.replaceWithContactsView();
  }
}
