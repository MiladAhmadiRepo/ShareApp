import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'api.dart';

final sl = GetIt.instance;

void initGetIt() {
  sl.registerLazySingleton<Api>(() => Api(client: sl()));

  sl.registerLazySingleton<Client>(() => Client());
}
