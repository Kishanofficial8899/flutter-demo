import 'package:mobx/mobx.dart';

part 'store.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  int maxlimit = 5;
  @observable
  int intialCount = 0;

  @action
  void increment() {
    if (intialCount < maxlimit) {
      intialCount++;
    }
    print('increment ');
  }

  @action
  void decrement() {
    if (intialCount > 0) {
      intialCount--;
    } else {}
  }

  @action
  void reset() {
    intialCount = 0;
  }
}
