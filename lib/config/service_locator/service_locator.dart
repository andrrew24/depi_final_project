import 'package:get_it/get_it.dart';
import 'package:movie_app/service/api_service.dart';
import 'package:movie_app/service/local_data_source.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Singelton for NetworkService
  sl.registerSingleton<NetworkService>(NetworkService());

  // Singelton for Local Data Source
  sl.registerSingleton<LocalDataSource>(LocalDataSource());
} // App service locator
