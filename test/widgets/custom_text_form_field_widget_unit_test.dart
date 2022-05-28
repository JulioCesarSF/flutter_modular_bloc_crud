import 'package:flutter/material.dart';
import 'package:flutter_modular_bloc_crud/widgets/custom_text_form_field_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should create a TextFormField', (tester) async {
    // Arrange

    // Act
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTextFormFieldWidget(
          hint: 'TextFormField1',
          textEditingController: TextEditingController(),
        ),
      ),
    ));

    // Act
    final title = find.text('TextFormField1');

    // Assert
    expect(title, findsWidgets);

    // Assert
  });
}
