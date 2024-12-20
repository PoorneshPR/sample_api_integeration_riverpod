import 'package:sample_riverpod/model/passengers/passengers_model.dart';

abstract class PassengerBaseServices {
  Future<PassengersModel?> getPassengers({int? page});
}