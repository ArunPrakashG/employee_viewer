// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:employee_viewer/employee_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:employee_viewer/main.dart';

void main() {
  testWidgets('Check App', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const EmployeeViewerApp());

    // verify api result is success
    expect(find.text('Ervin'), findsOneWidget);
  });

  testWidgets('Check Search', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const EmployeeViewerApp());

    // verify api result is success
    expect(find.text('Leanne Graham'), findsOneWidget);

    // Tap the 'search' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Verify that search is working as intented
    expect(find.text('Leanne'), findsOneWidget);
  });
}
