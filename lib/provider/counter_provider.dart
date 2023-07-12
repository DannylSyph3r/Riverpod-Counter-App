import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_app/widgets/division_warning_modal.dart';

final counterProvider =
    StateNotifierProvider<CounterNotifier, CounterState>((ref) {
  return CounterNotifier();
});

class CounterState {
  double count;

  CounterState(this.count);

  CounterState copyWith({double? count}) {
    return CounterState(count ?? this.count);
  }
}

class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(CounterState(0.0));

  void performCounterOperations(BuildContext context, String operation) {
    final state = this.state.copyWith(); // Create a copy of the state

    if (operation.startsWith('add') || operation.startsWith('Add')) {
      final value = double.tryParse(operation.split(' ')[1]);
      if (value != null) {
        state.count += value;
      }
    } else if (operation.startsWith('subtract') || operation.startsWith('Subtract') ) {
      final value = double.tryParse(operation.split(' ')[1]);
      if (value != null) {
        state.count -= value;
      }
    } else if (operation.startsWith('multiply by') || operation.startsWith('Multiply by') ) {
      final value = double.tryParse(operation.split(' ')[2]);
      if (value != null) {
        state.count *= value;
      }
    } else if (operation.startsWith('divide by') || operation.startsWith('Divide by') ) {
      final value = double.tryParse(operation.split(' ')[2]);
      if (value != null && value != 0) {
        state.count /= value;
      } else {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          builder: (BuildContext context) {
            return const DivsionModalWidget();
          },
        );
      }
    }

    state.count = double.parse(
        state.count.toStringAsFixed(2)); // Round to 2 decimal places

    this.state = state.copyWith(); // Update the state
  }

  void resetCounter() {
    state = state.copyWith(count: 0.0); // Update the state
  }
}
