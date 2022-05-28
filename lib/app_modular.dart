import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_bloc_crud/app_routes.dart';
import 'package:flutter_modular_bloc_crud/database/memory_provider.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/bloc/product_bloc.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/views/product_detail_view.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/views/product_list_view.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/views/product_main_view.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<MemoryProvider>((i) => MemoryProvider()),
        Bind.singleton<ProductBloc>((i) => ProductBloc(provider: i()), onDispose: (value) => value.dispose()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (context, args) => const ProductMainView()),
        ChildRoute(AppRoute.productDetail, child: (context, args) => ProductDetailView(product: args.data)),
        ChildRoute(AppRoute.productList, child: (context, args) => const ProductListView()),
      ];
}
