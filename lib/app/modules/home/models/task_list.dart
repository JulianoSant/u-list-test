import 'package:mobx/mobx.dart';
import 'task_item.dart';

part 'task_list.g.dart';

class TaskList = _TaskListBase with _$TaskList;

abstract class _TaskListBase with Store {
  _TaskListBase({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  final String id;

  @observable
  String title;

  final DateTime createdAt;

  @observable
  ObservableList<TaskItem> items = ObservableList<TaskItem>();

  @action
  void addItem(String description) {
    items.add(TaskItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      description: description,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ));
  }

  @action
  void removeItem(String itemId) {
    items.removeWhere((item) => item.id == itemId);
  }

  @action
  void updateTitle(String newTitle) {
    title = newTitle;
  }
}
