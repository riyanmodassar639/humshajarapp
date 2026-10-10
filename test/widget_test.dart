import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hum_shajar/main.dart';

void main() {
  testWidgets('App loads and shows the book title', (WidgetTester tester) async {
    await tester.pumpWidget(const HumShajarApp());

    // The landing page should show the book title.
    expect(find.text('ہم شجر'), findsOneWidget);
  });
}
