import 'package:sportvibez_test/app/app.bottomsheets.dart';
import 'package:sportvibez_test/app/app.locator.dart';
import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/services/cache/hive_service.dart';
import 'package:sportvibez_test/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactsViewModel extends BaseViewModel {
  final _cacheService = locator<HiveService>();
  final _bottomSheetService = locator<BottomSheetService>();

  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  void showBottomSheet() async {
    final res = await _bottomSheetService.showCustomSheet<Contact, void>(
      isScrollControlled: true,
      title: ksHomeBottomSheetTitle,
      variant: BottomSheetType.addContact,
      description: ksHomeBottomSheetDescription,
    );
    if (res?.data == null) return;
    await _cacheService.addContact(res!.data!);
    getContacts();
  }

  void getContacts() {
    _contacts = _cacheService.getAllContacts();
    rebuildUi();
  }
}
