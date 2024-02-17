import 'package:sportvibez_test/app/app.locator.dart';
import 'package:sportvibez_test/services/cache/i_cache_service.dart';
import 'package:sportvibez_test/services/navigation/router.dart';
import 'package:sportvibez_test/ui/views/contacts/contacts_view.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  final _cacheService = locator<CacheService>();

  Future runStartupLogic() async {
    await _cacheService.init();
    clearAndNavigate(ContactsView.routeName);
  }
}
