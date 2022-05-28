import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_bloc_crud/database/data_provider.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> with Disposable {
  late DataProvider<Product> provider;

  ProductBloc({required this.provider}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});
    on<AddProductEvent>((event, emit) => provider.addOrUpdate(event.value));
    on<ListProductEvent>((event, emit) async {
      var values = await provider.getAll();
      emit(ListProductState(values: values));
    });
    on<DeleteProductEvent>((event, emit) {
      provider.delete(event.value);
      add(ListProductEvent());
    });
  }

  @override
  void dispose() {
    close();
  }
}
