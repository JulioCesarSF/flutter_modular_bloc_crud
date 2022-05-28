import 'package:flutter/material.dart';
import 'package:flutter_modular_bloc_crud/widgets/custom_confirmation_alert_dialog_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should create a CustomConnfirmationAlertDialog', (tester) async {
    // Arrange
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
          body: CustomConfirmationAlertDialogWidget(
        title: 'Title',
        message: 'Message',
        confirmCallback: () {},
      )),
    ));

    // Act
    final title = find.text('Title');
    final message = find.text('Message');

    // Assert
    expect(title, findsOneWidget);
    expect(message, findsOneWidget);
  });
}
