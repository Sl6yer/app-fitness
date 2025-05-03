import 'package:fitness_app/Widgets/avatar_profile.dart';
import 'package:mobx/mobx.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  @observable
  String name = 'Linh Nguyen';

  @action
  void setName(String newName) {
    name = newName;
    print(name);
  }

  @observable
  String id = '2';

  @action
  void setId(String newId) {
    id = newId;
    print('id da imagem alterada: $id');
  }
}
