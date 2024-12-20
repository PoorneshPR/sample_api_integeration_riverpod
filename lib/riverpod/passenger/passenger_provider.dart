import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/model/passengers/passengers_model.dart';
import 'package:sample_riverpod/riverpod/passenger/passenger_state.dart';

import 'package:sample_riverpod/services/passenger_base_services.dart';
import 'package:sample_riverpod/services/service_locator.dart';

class PassengerProvider extends Notifier<PassengerState> {
  final _apiServices = getIt.get<PassengerBaseServices>();

  PassengersModel? model;
  List<PassengerData>? data;
  int pageCount = 1;
  int? totalPageCount;

  void getPassengers({bool enableLoaderState = true, int? page}) async {
    state = state.copyWith(
        passengersList: data,
        loaderState: LoaderState.loading,
        enableLoaderState: enableLoaderState);

    try {
      model = await _apiServices.getPassengers(page: page);
      if (data == null || (data?.isEmpty ?? true)) {
        data = model?.data;
        pageCount = pageCount + 1;
      } else {
        data = [...?data, ...?model?.data];
        pageCount = pageCount + 1;
      }

      totalPageCount = model?.totalPages;
      state = state.copyWith(
          passengersList: data,
          loaderState: LoaderState.loaded,
          enableLoaderState: enableLoaderState);
    } catch (e) {
      state = state.copyWith(
          error: e.toString(),
          loaderState: LoaderState.error,
          enableLoaderState: enableLoaderState);
    }
  }

  @override
  PassengerState build() {
    return const PassengerState(
        loaderState: LoaderState.loaded, enableLoaderState: true);
  }
}
