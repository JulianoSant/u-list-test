// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskList on _TaskListBase, Store {
  late final _$titleAtom = Atom(name: '_TaskListBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$itemsAtom = Atom(name: '_TaskListBase.items', context: context);

  @override
  ObservableList<TaskItem> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<TaskItem> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$_TaskListBaseActionController =
      ActionController(name: '_TaskListBase', context: context);

  @override
  void addItem(String description) {
    final _$actionInfo = _$_TaskListBaseActionController.startAction(
        name: '_TaskListBase.addItem');
    try {
      return super.addItem(description);
    } finally {
      _$_TaskListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(String itemId) {
    final _$actionInfo = _$_TaskListBaseActionController.startAction(
        name: '_TaskListBase.removeItem');
    try {
      return super.removeItem(itemId);
    } finally {
      _$_TaskListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTitle(String newTitle) {
    final _$actionInfo = _$_TaskListBaseActionController.startAction(
        name: '_TaskListBase.updateTitle');
    try {
      return super.updateTitle(newTitle);
    } finally {
      _$_TaskListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
items: ${items}
    ''';
  }
}
