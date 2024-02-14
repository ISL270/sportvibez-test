import 'package:sportvibez_test/ui/bottom_sheets/add_contact/add_contact_sheet.dart';
import 'package:sportvibez_test/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:sportvibez_test/ui/views/contacts/contacts_view.dart';
import 'package:sportvibez_test/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ContactsView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: AddContactSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
