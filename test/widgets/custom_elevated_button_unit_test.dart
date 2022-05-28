import 'package:flutter/material.dart';
import 'package:flutter_modular_bloc_crud/widgets/custom_elevated_button_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should create a CustomElevatedButtonWidget', (tester) async {
    // Arrange
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomElevatedButtonWidget(title: 'Button', onPressed: () {}),
      ),
    ));

    // Act
    final title = find.text('Button');

    // Assert
    expect(title, findsOneWidget);
  });
}
