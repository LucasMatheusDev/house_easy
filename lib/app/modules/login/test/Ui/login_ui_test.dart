import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_easy/app/modules/login/view/login_page.dart';

void main() {
  group('logo image', () {
    testWidgets(
      'login',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: LoginPage(),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
        expect(
            find.image(
                const AssetImage("assets/splash_screen/logo_houseEasy.jpg")),
            findsOneWidget);
      },
    );
  });

  group('find widgets default', () {
    testWidgets('widgets', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));

      expect(find.text("Entrar"), findsOneWidget);
      expect(find.byType(TextFormField), findsWidgets);
      expect(find.byType(TextButton), findsWidgets);
    });
    group('input text', () {
      testWidgets('inputs email validation', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: LoginPage(),
        ));
        // a escrita do campo email tem que ser exatamente igual
        await tester.enterText(
            find.widgetWithIcon(TextFormField, Icons.person_outline_rounded),
            "emailInvalido.com");

        await tester.tap(find.widgetWithText(ElevatedButton, "Entrar"));
        await tester.pump();

        expect(find.textContaining("E-mail digitado incorretamente"),
            findsOneWidget);
      });
    });
  });
}
