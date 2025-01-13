import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'list_detail_store.g.dart';

class ListDetailStore = _ListDetailStoreBase with _$ListDetailStore;

abstract class _ListDetailStoreBase with Store {
  @observable
  ObservableList<Map<String, dynamic>> items = ObservableList.of([]);

  @action
  void addItem(String description) {
    items.add({
      'id': const Uuid().v4(),
      'description': description,
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
    });
  }

  @action
  void updateItem(String id, String newDescription) {
    final item = items.firstWhere((element) => element['id'] == id);
    item['description'] = newDescription;
    item['updatedAt'] = DateTime.now();
    items = ObservableList.of(items); // Atualiza a lista.
  }

  @action
  void removeItem(String id) {
    items.removeWhere((element) => element['id'] == id);
  }
}
