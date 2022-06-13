import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial(init: 0));

  increment() {
    emit(CounterInitial(init: state.counter + 2));
  }

  decrement() {
    if (state.counter > 0) {
      emit(CounterInitial(init: state.counter - 1));
    } else {
      emit(state);
    }
  }
}

@immutable
abstract class CounterState {
  final int counter;

  const CounterState({required this.counter});
}

class CounterInitial extends CounterState {
  final int init;

  const CounterInitial({required this.init}) : super(counter: init);
}
