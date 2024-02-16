import 'package:sportvibez_test/app/app.locator.dart';
import 'package:sportvibez_test/services/cache/hive_service.dart';
import 'package:sportvibez_test/services/navigation/router.dart';
import 'package:sportvibez_test/ui/views/contacts/contacts_view.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  final _cacheService = locator<HiveService>();

  Future runStartupLogic() async {
    await _cacheService.init();
    clearAndNavigate(ContactsView.routeName);
  }
}
