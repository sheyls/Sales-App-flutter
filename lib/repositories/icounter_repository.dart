abstract class ICounterRepository {
  Future<int> getCount();
  Future<void> setCount(int count);
}
