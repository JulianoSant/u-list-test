import 'package:mobx/mobx.dart';

part 'task_item.g.dart';

class TaskItem = _TaskItemBase with _$TaskItem;

abstract class _TaskItemBase with Store {
  _TaskItemBase({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.isCompleted = false,
  });

  final String id;

  @observable
  String description;

  @observable
  bool isCompleted;

  @observable
  DateTime updatedAt;

  final DateTime createdAt;

  @action
  void toggleCompletion() {
    isCompleted = !isCompleted;
    updatedAt = DateTime.now();
  }

  @action
  void updateDescription(String newDescription) {
    description = newDescription;
    updatedAt = DateTime.now();
  }
}
