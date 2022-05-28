import 'package:flutter_modular_bloc_crud/extensions/double_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Should format double value', () {
    test('Receive zero value and return a formatted currency', () {
      // Arrange
      double value = 0.0;
      String expectedFormattedValue = r"$ 0.00";

      // Act
      var formattedValue = value.toCurrency();

      // Assert
      expect(formattedValue, expectedFormattedValue);
    });
  });
}
