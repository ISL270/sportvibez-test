import 'package:sportvibez_test/services/cache/hive_service.dart';
import 'package:sportvibez_test/services/cache/i_cache_service.dart';
import 'package:stacked/stacked_annotations.dart';
// @stacked-import

@StackedApp(
  routes: [],
  dependencies: [
    LazySingleton(
      asType: CacheService,
      classType: HiveService,
    ),
    // @stacked-service
  ],
)
class App {}
