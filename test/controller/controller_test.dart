import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test example", () {
    test("test fake", () {
      const bool result = true;
      expect(true, result);
    });
  });
}
