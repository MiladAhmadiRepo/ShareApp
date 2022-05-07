// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/second_page.dart';

import 'package:testing/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('new Page after 3 hitting the button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    Finder icon = find.byIcon(Icons.add);

    await tester.tap(icon);
    await tester.pump();

    await tester.tap(icon);
    await tester.pump();

    await tester.tap(icon);
    await tester.pump();

    // باید از این اسفاده کنیم تا صفحه کامل لود بشود
    // we should use this method to load page completely
    await tester.pumpAndSettle();

    // in the new page
    expect(find.byType(SecondPage), findsOneWidget,reason: "we should find new page");
    expect(find.byType(MyHomePage), findsNothing,reason: "we should find new page");

  });

  /// for create or update golden image we use following comment
  /// flutter test --update-goldens
  /// after that we use
  ///
  /// flutter test
  ///
  /// useful resources:
  /// https://medium.com/flutter-community/flutter-golden-tests-compare-widgets-with-snapshots-27f83f266cea
  ///
  /// https://verygood.ventures/blog/alchemist-golden-tests-tutorial
  ///
  /// 
  ///

  testWidgets('golden image test ', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    await expectLater(
      find.byType(MyHomePage),
      matchesGoldenFile('snapshot.png'),
    );
  });

}
