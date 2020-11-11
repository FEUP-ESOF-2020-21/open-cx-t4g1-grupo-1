// test/test_driver/app_test.dart

// Imports the Flutter Driver API
import 'package:adov_flutter/database.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
/*
void main() {
  group('happy path integration tests', () {
    final talks;
    getAllTalks().then((talksx) => {talks = talksx});

    // First, define the Finders. We can use these to locate Widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final talkListItemTextFinder =
        find.byValueKey('talk_list_item_${talks.first.id}');
    final talkTileOverlayTextFinder =
        find.byValueKey('talk_tile_name_${talks.first.id}');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('a location name appears in talk list', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(talkListItemTextFinder), isNotEmpty);
    });

    test('a talk in the list is tappable', () async {
      // First, tap on the button
      await driver.tap(talkTileOverlayTextFinder);

      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(talkTileOverlayTextFinder), isNotEmpty);
    });
    // NOTE one more test to come in the next step!
  });
}
*/