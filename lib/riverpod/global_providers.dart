import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/riverpod/counter/counter_provider.dart';
import 'package:sample_riverpod/riverpod/counter/counter_state.dart';

final counterGlobalProvider =
    NotifierProvider<CounterProvider, CounterState>(CounterProvider.new);
