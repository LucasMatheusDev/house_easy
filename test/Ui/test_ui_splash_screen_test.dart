import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_easy/app/modules/splash_screen/view/splash_screen.dart';

void main() {
  group('Splash Screen', () {
    
  testWidgets('test Ui Splash Screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(
        find.image(const AssetImage("assets/splash_screen/logo_houseEasy.jpg")),
        findsOneWidget);
  });
  });

}
