import 'package:sportvibez_test/app/app.bottomsheets.dart';
import 'package:sportvibez_test/app/app.locator.dart';
import 'package:sportvibez_test/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactsViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      title: ksHomeBottomSheetTitle,
      variant: BottomSheetType.addContact,
      description: ksHomeBottomSheetDescription,
    );
  }
}
