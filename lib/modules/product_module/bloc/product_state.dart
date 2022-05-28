part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ListProductState extends ProductState {
  List<Product> values;
  ListProductState({
    required this.values,
  });
}
