import 'package:sportvibez_test/services/cache/hive_service.dart';
import 'package:stacked/stacked_annotations.dart';
// @stacked-import

@StackedApp(
  routes: [],
  dependencies: [
    LazySingleton(classType: HiveService),
    // @stacked-service
  ],
)
class App {}
