import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sample_riverpod/model/passengers/passengers_model.dart';

@immutable
class PassengerListState extends Equatable {
  final List<PassengerData>? passengersList;

  const PassengerListState({this.passengersList});

  @override
  List<Object?> get props => [passengersList];

  PassengerListState copyWith({List<PassengerData>? passengersList}) {
    return PassengerListState(passengersList: passengersList ?? passengersList);
  }
}
