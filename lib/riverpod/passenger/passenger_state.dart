import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sample_riverpod/model/passengers/passengers_model.dart';

@immutable
class PassengerState extends Equatable {
  final List<PassengerData>? passengersList;
  final String? error;
  final LoaderState? loaderState;
  final bool? enableLoaderState;

  const PassengerState(
      {this.passengersList,
      this.error,
      this.loaderState,
      this.enableLoaderState});

  @override
  List<Object?> get props =>
      [passengersList, error, loaderState, enableLoaderState];

  PassengerState copyWith(
      {List<PassengerData>? passengersList,
      String? error,
      LoaderState? loaderState,
      bool? enableLoaderState}) {
    return PassengerState(
        passengersList: passengersList ?? passengersList,
        error: error ?? this.error,
        loaderState: loaderState ?? this.loaderState,
        enableLoaderState: enableLoaderState ?? this.enableLoaderState);
  }
}

enum LoaderState { loaded, loading, error }
