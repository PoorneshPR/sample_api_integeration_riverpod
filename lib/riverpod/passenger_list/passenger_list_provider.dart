import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/model/passengers/passengers_model.dart';
import 'package:sample_riverpod/riverpod/passenger_list/passenger_list_state.dart';

class PassengerListProvider extends Notifier<PassengerListState> {

  void addToList() {
    List<PassengerData>? passengersList = [
      ...?state.passengersList,
      ...[PassengerData(id: Random().nextInt(100).toString(),)]
    ];
    state = state.copyWith(passengersList: passengersList);
  }

  void removeFromList() {
    List<PassengerData>? passengersList = [...?state.passengersList];
    if (passengersList.isNotEmpty) {
      passengersList.removeLast();
      state = state.copyWith(passengersList: passengersList);
    }
  }

  @override
  PassengerListState build() {
    return const PassengerListState();
  }
}
