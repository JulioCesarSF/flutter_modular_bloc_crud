import 'package:flutter_modular_bloc_crud/database/data_provider.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/models/product.dart';

class MemoryProvider extends DataProvider<Product> {
  List<Product> products = [];

  @override
  Future<bool> addOrUpdate(Product value) async {
    return await Future<bool>.sync(() {
      try {
        var found = products.indexWhere((element) => element == value);
        if (found == -1) {
          products.add(value);
        } else {
          products.elementAt(found).description = value.description;
          products.elementAt(found).value = value.value;
        }
        return true;
      } catch (e) {
        return false;
      }
    });
  }

  @override
  Future<bool> delete(Product value) async {
    return await Future<bool>.sync(() {
      try {
        products.remove(value);
        return true;
      } catch (e) {
        return false;
      }
    });
  }

  @override
  Future<List<Product>> getAll() async {
    return await Future<List<Product>>.sync(() => products);
  }
}
