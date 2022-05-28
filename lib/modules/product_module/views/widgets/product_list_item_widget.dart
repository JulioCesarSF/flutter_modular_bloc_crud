import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_bloc_crud/app_routes.dart';
import 'package:flutter_modular_bloc_crud/extensions/double_extensions.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/bloc/product_bloc.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/models/product.dart';
import 'package:flutter_modular_bloc_crud/widgets/custom_confirmation_alert_dialog_widget.dart';

class ProductListItemWidget extends StatelessWidget {
  const ProductListItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(spreadRadius: 0.1, blurRadius: 1.0, blurStyle: BlurStyle.solid),
          ],
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                constraints: const BoxConstraints(minWidth: 150),
                child: Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    shadows: [
                      BoxShadow(
                        blurRadius: 0.3,
                        blurStyle: BlurStyle.solid,
                        spreadRadius: 25.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              product.value.toCurrency(),
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey,
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: () => Modular.to.pushNamed(AppRoute.productDetail, arguments: product),
                child: const Icon(
                  Icons.edit,
                  color: Colors.yellow,
                  shadows: [
                    BoxShadow(spreadRadius: 0.1, blurRadius: 1.0, blurStyle: BlurStyle.solid),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return CustomConfirmationAlertDialogWidget(
                        title: 'Delete product',
                        message: 'Are you sure?',
                        confirmCallback: () {
                          Modular.get<ProductBloc>().add(DeleteProductEvent(value: product));
                          Navigator.of(dialogContext).pop();
                        },
                      );
                    });
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
                shadows: [
                  BoxShadow(spreadRadius: 0.1, blurRadius: 1.0, blurStyle: BlurStyle.solid),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
