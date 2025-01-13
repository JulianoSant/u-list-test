import 'package:mobx/mobx.dart';
import 'package:u_list/app/modules/home/models/task_list.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<TaskList> lists = ObservableList<TaskList>();

  @action
  void addList(String title) {
    lists.add(TaskList(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      createdAt: DateTime.now(),
    ));
  }

  @action
  void removeList(String listId) {
    lists.removeWhere((list) => list.id == listId);
  }

  @action
  @action
  void updateListTitle(String listId, String newTitle) {
    final listIndex = lists.indexWhere((list) => list.id == listId);
    if (listIndex != -1) {
      final updatedList = lists[listIndex];
      updatedList.updateTitle(newTitle);

      lists = ObservableList.of(lists);
    }
  }
}
