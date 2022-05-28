import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/bloc/product_bloc.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/views/widgets/product_list_item_widget.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final productBloc = Modular.get<ProductBloc>();

  @override
  void initState() {
    productBloc.add(ListProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product list')),
      body: BlocBuilder(
        bloc: productBloc,
        builder: (context, state) {
          if (state is ListProductState) {
            return ListView.builder(
              itemCount: state.values.length,
              itemBuilder: (context, index) {
                var product = state.values.elementAt(index);
                return ProductListItemWidget(product: product);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
