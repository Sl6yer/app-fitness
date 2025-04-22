import 'package:mobx/mobx.dart';
part 'bottom_nav_store.g.dart';

class BottomNavStore = _BottomNavStoreBase with _$BottomNavStore;

abstract class _BottomNavStoreBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void setIndex(int index) {
    selectedIndex = index;
  }
}
