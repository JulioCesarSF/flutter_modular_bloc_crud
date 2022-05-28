import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_bloc_crud/app_routes.dart';
import 'package:flutter_modular_bloc_crud/widgets/custom_elevated_button_widget.dart';

class ProductMainView extends StatefulWidget {
  const ProductMainView({Key? key}) : super(key: key);

  @override
  State<ProductMainView> createState() => _ProductMainViewState();
}

class _ProductMainViewState extends State<ProductMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButtonWidget(
                  title: 'Add',
                  color: Colors.green,
                  onPressed: () => Modular.to.pushNamed(AppRoute.productDetail),
                ),
                CustomElevatedButtonWidget(
                  title: 'List',
                  color: Colors.purple,
                  onPressed: () => Modular.to.pushNamed(AppRoute.productList),
                ),
              ],
            ),
          ),
        ));
  }
}
