import 'package:flutter_modular_bloc_crud/database/memory_provider.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MemoryProvider unit test', () {
    test('Should add a new product', () async {
      // Arrange
      final memoryProvider = MemoryProvider();
      var product = Product();
      product.description = 'Description';
      product.value = 1.0;

      // Act
      memoryProvider.addOrUpdate(product);
      var products = await memoryProvider.getAll();

      // Assert
      expect(products.length, 1);
    });

    test('Should return empty list', () async {
      // Arrange
      final memoryProvider = MemoryProvider();

      // Act
      var products = await memoryProvider.getAll();

      // Assert
      expect(products.length, 0);
    });

    test('Should delete a product', () async {
      // Arrange
      final memoryProvider = MemoryProvider();
      var product = Product();
      product.description = 'Description';
      product.value = 1.0;

      // Act
      memoryProvider.addOrUpdate(product);
      var sut = await memoryProvider.delete(product);

      // Assert
      expect(sut, true);
    });

    test('Should add a new product and update description', () async {
      // Arrange
      final memoryProvider = MemoryProvider();
      var product = Product();
      product.description = 'Description';
      product.value = 1.0;
      const newDescription = 'New description';

      // Act
      memoryProvider.addOrUpdate(product);
      product.description = newDescription;
      memoryProvider.addOrUpdate(product);
      var products = await memoryProvider.getAll();

      // Assert
      expect(products.length, 1);
      expect(products[0].description, newDescription);
    });
  });
}
