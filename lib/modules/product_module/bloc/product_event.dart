part of 'product_bloc.dart';

abstract class ProductEvent {}

class AddProductEvent extends ProductEvent {
  Product value;
  AddProductEvent({
    required this.value,
  });
}

class ListProductEvent extends ProductEvent {}

class DeleteProductEvent extends ProductEvent {
  Product value;
  DeleteProductEvent({
    required this.value,
  });
}
