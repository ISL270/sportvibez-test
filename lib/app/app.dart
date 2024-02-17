import 'package:sportvibez_test/services/cache/hive_service.dart';
import 'package:sportvibez_test/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: HiveService),
// @stacked-service
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
