import 'local_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';



class SharedPreferencesService implements LocalStorage {
  final SharedPreferences sharedPreferences;

  SharedPreferencesService({
    required this.sharedPreferences,
  });

  @override
  dynamic getData(String key) {
    final result = sharedPreferences.get(key);

    if (result != null) {
      return result;
    }

    throw SharedPreferencesException(
        'There is no key ($key) passed as a parameter');
  }

  

  @override
  Future<bool> removeData(String key) async {
    return await sharedPreferences.remove(key);
  }
  
  @override
  Future<bool> setData(String key, value) async{
    switch (value.runtimeType) {
      case String:
        return await sharedPreferences.setString(key, value);
      case int:
        return await sharedPreferences.setInt(key, value);
      case bool:
        return await sharedPreferences.setBool(key, value);
      case double:
        return await sharedPreferences.setDouble(key, value);
      case List<String>:
        return await sharedPreferences.setStringList(key, value);
    }
    return false;
  
  }
  
  @override
  Future<bool> containData(String key) async {
    return sharedPreferences.containsKey(key);
  }
}

class SharedPreferencesException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  SharedPreferencesException(
    this.message, {
    this.stackTrace,
  });
}
