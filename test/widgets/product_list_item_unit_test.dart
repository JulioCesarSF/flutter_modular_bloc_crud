import 'package:flutter/material.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/models/product.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/views/widgets/product_list_item_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should create a ProductListItemWidget', (tester) async {
    // Arrange
    var product = Product();
    product.description = 'X-Bacon';
    product.value = 25.50;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ProductListItemWidget(product: product),
      ),
    ));

    // Act
    final title = find.text(product.description);

    // Assert
    expect(title, findsOneWidget);
  });
}
