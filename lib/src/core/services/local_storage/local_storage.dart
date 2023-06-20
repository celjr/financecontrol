abstract class LocalStorage{
  Future<bool> setData(String key, var value);
  Future<bool> containData(String key,);
  dynamic getData(String key);
  Future<bool> removeData(String key);
}