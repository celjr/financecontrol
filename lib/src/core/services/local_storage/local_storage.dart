abstract class LocalStorage{
  Future<bool> setData(String key, var value);
  dynamic getData(String key);
  Future<bool> removeData(String key);
}