import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_easy/app/modules/NewUser/view/new_user_view.dart';

void main() {
  group('View New User', () {
    group('logo image', () {
      testWidgets(
        'find logo',
        (WidgetTester tester) async {
          await tester.pumpWidget(const MaterialApp(home: NewUserView()));

          expect(find.byType(Image), findsWidgets);
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
          home: NewUserView(),
        ));

        expect(find.text("Criar conta"), findsOneWidget);
        expect(find.byType(TextFormField), findsWidgets);
        expect(find.byType(TextButton), findsWidgets);
      });
    });
    group('input text e-mail', () {
      testWidgets('inputs email validation', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: NewUserView(),
        ));

        await tester
            .enterText(find.byKey(const Key("formEmail")), "emailInvalido.com")
            .onError((error, stackTrace) => throw "error testing email input ");

        await tester.tap(find.byKey(const Key("buttonNewUser")));
        await tester.pump();

        expect(find.textContaining("E-mail digitado incorretamente"),
            findsOneWidget);
      });
    });
    group('input text password', () {
      testWidgets('inputs password validation', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: NewUserView(),
        ));

        await tester
            .enterText(find.byKey(const Key("formPassword")), "12345")
            .onError(
                (error, stackTrace) => throw "error testing password input ");

        await tester.tap(find.byKey(const Key("buttonNewUser")));
        await tester.pump();

        expect(find.textContaining("A senha é muito curta"), findsOneWidget);
      });
    });
    group('input text name', () {
      testWidgets('inputs name validation', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: NewUserView(),
        ));

        await tester
            .enterText(find.byKey(const Key("formName")), "Lucas")
            .onError((error, stackTrace) => throw "error testing name input ");

        await tester.tap(find.byKey(const Key("buttonNewUser")));
        await tester.pump();

        expect(
            find.textContaining("Digite um Nome Valido, Com nome e sobrenome"),
            findsOneWidget);
      });
    });
  });
}
