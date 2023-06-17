import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/local_storage/local_storage.dart';
import 'services/local_storage/shared_preferences.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance(),
        export: true),
    Bind.lazySingleton<LocalStorage>(
        ((i) => SharedPreferencesService(
              sharedPreferences: i<SharedPreferences>(),
            )),
        export: true)
  ];
}
