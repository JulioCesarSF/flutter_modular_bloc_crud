abstract class DataProvider<T> {
  Future<bool> addOrUpdate(T value);
  Future<bool> delete(T value);
  Future<List<T>> getAll();
}
