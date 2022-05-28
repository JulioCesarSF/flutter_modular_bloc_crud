import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_modular_bloc_crud/database/memory_provider.dart' as memory_provider;
import 'package:flutter_modular_bloc_crud/modules/product_module/bloc/product_bloc.dart';
import 'package:flutter_modular_bloc_crud/modules/product_module/models/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../product_bloc_unit_test.mocks.dart';

@GenerateMocks([memory_provider.MemoryProvider])
void main() {
  group('ProductBloc unit test', () {
    ProductBloc productBloc = ProductBloc(provider: memory_provider.MemoryProvider());

    blocTest(
      "Add product should not emit state",
      setUp: () {
        var memoryProviderMock = MockMemoryProvider();
        when(memoryProviderMock.addOrUpdate(any)).thenAnswer((realInvocation) => Future.value(true));
        productBloc = ProductBloc(provider: memoryProviderMock);
      },
      build: () => productBloc,
      act: (ProductBloc bloc) => bloc.add(AddProductEvent(value: Product())),
      expect: () => [],
    );

    blocTest(
      "Get product list should emit ListProductState",
      setUp: () {
        var memoryProviderMock = MockMemoryProvider();
        when(memoryProviderMock.getAll()).thenAnswer((realInvocation) => Future.value([]));
        productBloc = ProductBloc(provider: memoryProviderMock);
      },
      build: () => productBloc,
      act: (ProductBloc bloc) => bloc.add(ListProductEvent()),
      expect: () => [isA<ListProductState>()],
    );

    blocTest(
      "Delete product should emit ListProductState",
      setUp: () {
        var memoryProviderMock = MockMemoryProvider();
        when(memoryProviderMock.delete(any)).thenAnswer((realInvocation) => Future.value(true));
        when(memoryProviderMock.getAll()).thenAnswer((realInvocation) => Future.value([]));
        productBloc = ProductBloc(provider: memoryProviderMock);
      },
      build: () => productBloc,
      act: (ProductBloc bloc) => bloc.add(DeleteProductEvent(value: Product())),
      expect: () => [isA<ListProductState>()],
    );
  });
}
