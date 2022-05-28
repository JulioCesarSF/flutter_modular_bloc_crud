import 'package:flutter_modular_bloc_crud/database/memory_provider.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MemoryProvider database unit tests', () {
    Product product = Product();

    void arrangeProduct(int id, String description, double value) {
      product.id = id;
      product.description = description;
      product.value = value;
    }

    test('Shoud add a new product', () async {
      // Arrange
      MemoryProvider memoryProvider = MemoryProvider();
      arrangeProduct(0, 'p1', 0.0);

      // Act
      bool result = await memoryProvider.addOrUpdate(product);

      // Assert
      expect(result, true);
    });

    test('Shoud retrieve a list of products', () async {
      // Arrange
      MemoryProvider memoryProvider = MemoryProvider();
      arrangeProduct(0, 'p1', 0.0);
      await memoryProvider.addOrUpdate(product);

      // Act
      List<Product> result = await memoryProvider.getAll();

      // Assert
      expect(result.length, 1);
    });

    test('Shoud delete a product', () async {
      // Arrange
      MemoryProvider memoryProvider = MemoryProvider();
      arrangeProduct(0, 'p1', 0.0);
      await memoryProvider.addOrUpdate(product);

      // Act
      bool result = await memoryProvider.delete(product);

      // Assert
      expect(result, true);
    });

    test('Shoud update a product', () async {
      // Arrange
      MemoryProvider memoryProvider = MemoryProvider();
      arrangeProduct(0, 'p1', 0.0);
      await memoryProvider.addOrUpdate(product);

      // Act
      product.description = 'p2';
      await memoryProvider.addOrUpdate(product);
      List<Product> result = await memoryProvider.getAll();

      // Assert
      expect(result.length, 1);
      expect(result[0].description, 'p2');
    });
  });
}
