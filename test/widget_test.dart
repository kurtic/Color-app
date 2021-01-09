import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:color_app/main.dart';

void main() {
  Widget testWidget ({Widget child}){
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(ColorApp());
    // Verify that the text "Hey there!" is present.
    expect(find.text('Hey there!'), findsOneWidget);
    GradientPage page = GradientPage();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpWidget(testWidget(child: page));
    await tester.pump();
    // Verify that the text "Gradient page" is present.
    expect(find.text('Gradient page'),findsOneWidget);

  });
}
