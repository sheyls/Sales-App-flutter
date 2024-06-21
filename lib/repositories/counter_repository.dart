// lib/repositories/counter_repository.dart
import 'package:get_storage/get_storage.dart';
import 'icounter_repository.dart';

class CounterRepository implements ICounterRepository {
  final storage = GetStorage();

  @override
  Future<int> getCount() async {
    return storage.read('count') ?? 0;
  }

  @override
  Future<void> setCount(int count) async {
    await storage.write('count', count);
  }
}
