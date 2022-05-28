import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/bloc/product_bloc.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/models/product.dart';
import 'package:flutter_modular_bloc_crud/widgets/custom_elevated_button_widget.dart';
import 'package:flutter_modular_bloc_crud/widgets/custom_text_form_field_widget.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key, required product}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descriptionEditingController = TextEditingController();
  final TextEditingController valueEditingController = TextEditingController();
  late Product product;

  String? _validateDescription(String value) {
    if (value.isEmpty) return 'Description can not be empty';
    if (value.length <= 2) return 'Minimum size is 3 characters';
    if (value.length > 15) return 'Maximum size if 15 characters';
    final RegExp regex = RegExp('[a-zA-Z]');
    var match = regex.hasMatch(value);
    return match ? null : 'Invalid value';
  }

  String? _validateValue(String value) {
    if (value.isEmpty) return 'Value can not be empty';
    var currentDoubleValue = double.tryParse(value) ?? 0.0;
    if (currentDoubleValue <= 0.0) return 'Value must be bigger than 0';
    final RegExp regex = RegExp(r'^\d+(\.\d+)*$');
    var match = regex.hasMatch(value);
    return match ? null : 'Invalid value';
  }

  void _onSubmitted() {
    if (_formKey.currentState!.validate()) {
      Modular.get<ProductBloc>().add(AddProductEvent(value: product));
      Modular.get<ProductBloc>().add(ListProductEvent());
      Modular.to.pop();
    }
  }

  @override
  void initState() {
    product = Modular.args.data ?? Product();
    descriptionEditingController.text = product.description;
    valueEditingController.text = product.value.toString();

    descriptionEditingController.addListener(() {
      product.description = descriptionEditingController.text;
    });

    valueEditingController.addListener(() {
      product.value = double.tryParse(valueEditingController.text) ?? 0.0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product detail')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextFormFieldWidget(
                  hint: 'Description',
                  textEditingController: descriptionEditingController,
                  validate: _validateDescription,
                  onSubmitted: _onSubmitted,
                  textCapitalization: TextCapitalization.words,
                ),
                CustomTextFormFieldWidget(
                  hint: 'Value',
                  inputType: TextInputType.number,
                  textEditingController: valueEditingController,
                  validate: _validateValue,
                  onSubmitted: _onSubmitted,
                ),
                CustomElevatedButtonWidget(title: 'Save', onPressed: _onSubmitted),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
