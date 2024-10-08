import 'package:get_it/get_it.dart';
import 'package:movie_app/service/api_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  // Singelton for NetworkService
  sl.registerSingleton<NetworkService>(NetworkService());

} // App service locator
