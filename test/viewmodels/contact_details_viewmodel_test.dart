import 'package:flutter_test/flutter_test.dart';
import 'package:sportvibez_test/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ContactDetailsViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
