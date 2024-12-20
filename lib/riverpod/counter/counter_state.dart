import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CounterState extends Equatable {
  final int? counter;
  final int? counterOne;
  final int? counterTwo;
  final int? counterThree;
  final bool? colorOne;
  final bool? colorTwo;
  final bool? colorThree;

  const CounterState({
    this.counter,
    this.counterOne,
    this.counterTwo,
    this.counterThree,
    this.colorOne,
    this.colorTwo,
    this.colorThree,
  });

  CounterState copyWith({
    int? counter,
    int? counterOne,
    int? counterTwo,
    int? counterThree,
    bool? colorOne,
    bool? colorTwo,
    bool? colorThree,
  }) {
    return CounterState(
      counter: counter ?? counter,
      counterOne: counterOne ?? this.counterOne,
      counterTwo: counterTwo ?? this.counterTwo,
      counterThree: counterThree ?? this.counterThree,
      colorOne: colorOne ?? this.colorOne,
      colorTwo: colorTwo ?? this.colorTwo,
      colorThree: colorThree ?? this.colorThree,
    );
  }

  @override
  List<Object?> get props => [
        counter,
        counterOne,
        counterTwo,
        counterThree,
        colorOne,
        colorTwo,
        colorThree,
      ];
}
