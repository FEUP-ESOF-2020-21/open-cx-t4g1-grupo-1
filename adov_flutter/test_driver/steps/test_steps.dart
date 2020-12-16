import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckGivenWidgets
    extends Given3WithWorld<String, String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2, String input3) async {
    final textinput1 = find.byValueKey(input1);
    final textinput2 = find.byValueKey(input2);
    final button = find.byValueKey(input3);
    await FlutterDriverUtils.isPresent(world.driver, textinput1);
    await FlutterDriverUtils.isPresent(world.driver, textinput2);
    await FlutterDriverUtils.isPresent(world.driver, button);
  }

  @override
  RegExp get pattern => RegExp(r"I have {string} and {string} and {string}");
}

class CheckLoggedInAPage extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input) async {
    await Future.delayed(Duration(seconds: 1));
    bool isInPage = await FlutterDriverUtils.isPresent(
        world.driver, find.byValueKey(input));
    expectMatch(isInPage, true);
  }

  @override
  RegExp get pattern => RegExp(r"I'm logged in and in {string}");
}

class GivenInPage extends Given1WithWorld<String, FlutterWorld> {
  GivenInPage()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String name) async {
    bool isInPage =
        await FlutterDriverUtils.isPresent(world.driver, find.byValueKey(name));
    expectMatch(isInPage, true);
  }

  @override
  RegExp get pattern => RegExp(r"I'm in {string} page");
}

class ExpectToBeInPage extends Then1WithWorld<String, FlutterWorld> {
  ExpectToBeInPage()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String name) async {
    bool isInPage =
        await FlutterDriverUtils.isPresent(world.driver, find.byValueKey(name));
    expectMatch(isInPage, true);
  }

  @override
  RegExp get pattern => RegExp(r"I expect to be in {string} page");
}
