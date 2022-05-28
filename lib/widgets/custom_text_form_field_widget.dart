import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    Key? key,
    this.label,
    required this.hint,
    required this.textEditingController,
    this.color,
    this.errorColor,
    this.inputType,
    this.validate,
    this.onSubmitted,
    this.textCapitalization,
  }) : super(key: key);

  final Widget? label;
  final String hint;
  final TextEditingController textEditingController;
  final Color? color;
  final Color? errorColor;
  final TextInputType? inputType;
  final String? Function(String value)? validate;
  final VoidCallback? onSubmitted;
  final TextCapitalization? textCapitalization;

  @override
  State<CustomTextFormFieldWidget> createState() => _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  late FocusNode focusNode;
  final fieldKey = GlobalKey<FormFieldState>();

  String? _validateValue(String? value) {
    String? currentValue = widget.textEditingController.text;
    return widget.validate!(currentValue);
  }

  String? _onSubmitted(String? value) {
    widget.onSubmitted!();
    return null;
  }

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        fieldKey.currentState?.validate();
      }
    });

    widget.textEditingController.addListener(() {
      fieldKey.currentState?.validate();
    });

    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      keyboardType: widget.inputType ?? TextInputType.text,
      validator: _validateValue,
      onFieldSubmitted: _onSubmitted,
      focusNode: focusNode,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        hintText: widget.hint,
        label: widget.label ?? Text(widget.hint),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: widget.color ?? Colors.blue[200]!),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: widget.color ?? Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: widget.errorColor ?? Colors.red[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: widget.color ?? Colors.blue),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: widget.errorColor ?? Colors.red),
        ),
      ),
    );
  }
}
