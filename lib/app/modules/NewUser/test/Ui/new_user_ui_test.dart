import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_easy/app/modules/NewUser/view/new_user_view.dart';

void main() {
  group('View New User', () {
    group('logo image', () {
      testWidgets(
        'find logo',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: NewUserView(),
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
          home: NewUserView(),
        ));

        expect(find.text("Criar conta"), findsOneWidget);
        expect(find.byType(TextFormField), findsWidgets);
        expect(find.byType(TextButton), findsWidgets);
      });
      group('input text', () {
        testWidgets('inputs email validation', (WidgetTester tester) async {
          await tester.pumpWidget(const MaterialApp(
            home: NewUserView(),
          ));

          await tester
              .enterText(
                  find.byKey(const Key(
                    "formEmail",
                  )),
                  "emailInvalido.com")
              .onError(
                  (error, stackTrace) => throw "error testing email input ");

          await tester.tap(find.byKey(const Key("buttonNewUser")));
          await tester.pump();

          expect(find.textContaining("E-mail digitado incorretamente"),
              findsOneWidget);
        });
      });
    });
  });
}
