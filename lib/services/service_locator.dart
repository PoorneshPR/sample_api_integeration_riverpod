import 'package:sample_riverpod/services/api_services.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_riverpod/services/passenger_base_services.dart';

final getIt = GetIt.instance;

Future<void> registerServices() async {
  getIt.registerLazySingleton<PassengerBaseServices>(() => PassengerApiServices());
}
