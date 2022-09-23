import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_easy/app/modules/login/view/login_page.dart';
import 'package:house_easy/app/style/logo_guide.dart';

void main() {
  group('login page', () {
    group('find logo', () {
      testWidgets("logo", (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: LoginPage(),
        ));
        await tester.pump();
        expect(find.byType(Image), findsOneWidget);
        expect(find.image(AssetImage(LogoGuide.logo)), findsWidgets);
      });
    });
    group('input email', () {
      testWidgets('input email', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: LoginPage(),
        ));
        // escrever email de teste
        await tester.enterText(
            find.byKey(const Key("TextFormEmail")), "emailInvalido.com");

        /// clicar no botão entrar
        await tester.tap(find.byKey(
          const Key("buttonKey"),
        ));
        await tester.pump();
        expect(find.textContaining("E-mail digitado incorretamente"),
            findsWidgets);
      });
    });
group('input Password', () {
      testWidgets('input Password', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: LoginPage(),
        ));
        // escrever email de teste
        await tester.enterText(
            find.byKey(const Key("TextFormPassword")), "12345");

        /// clicar no botão entrar
        await tester.tap(find.byKey(
          const Key("buttonKey"),
        ));
        await tester.pump();
        expect(find.textContaining("A senha é muito curta"),
            findsWidgets);
      });
    });

  });
}
