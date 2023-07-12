import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider =
    StateNotifierProvider<CounterNotifier, CounterState>((ref) {
  return CounterNotifier();
});

class CounterState {
  int count;

  CounterState(this.count);

  CounterState copyWith({int? count}) {
    return CounterState(count ?? this.count);
  }
}

class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(CounterState(0));

  void performCounterOperations(String operation) {
    final state = this.state.copyWith(); // Create a copy of the state

    if (operation.startsWith('add')) {
      final value = int.tryParse(operation.split(' ')[1]);
      if (value != null) {
        state.count += value;
      }
    } else if (operation.startsWith('subtract')) {
      final value = int.tryParse(operation.split(' ')[1]);
      if (value != null) {
        state.count -= value;
      }
    } else if (operation.startsWith('multiply by')) {
      final value = int.tryParse(operation.split(' ')[2]);
      if (value != null) {
        state.count *= value;
      }
    } else if (operation.startsWith('divide by')) {
      final value = int.tryParse(operation.split(' ')[2]);
      if (value != null && value != 0) {
        state.count ~/= value;
      }
    }

    this.state = state.copyWith(); // Update the state
  }

  void resetCounter() {
    state = state.copyWith(count: 0); // Update the state
  }
}
