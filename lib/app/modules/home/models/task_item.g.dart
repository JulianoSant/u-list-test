// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskItem on _TaskItemBase, Store {
  late final _$descriptionAtom =
      Atom(name: '_TaskItemBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$isCompletedAtom =
      Atom(name: '_TaskItemBase.isCompleted', context: context);

  @override
  bool get isCompleted {
    _$isCompletedAtom.reportRead();
    return super.isCompleted;
  }

  @override
  set isCompleted(bool value) {
    _$isCompletedAtom.reportWrite(value, super.isCompleted, () {
      super.isCompleted = value;
    });
  }

  late final _$updatedAtAtom =
      Atom(name: '_TaskItemBase.updatedAt', context: context);

  @override
  DateTime get updatedAt {
    _$updatedAtAtom.reportRead();
    return super.updatedAt;
  }

  @override
  set updatedAt(DateTime value) {
    _$updatedAtAtom.reportWrite(value, super.updatedAt, () {
      super.updatedAt = value;
    });
  }

  late final _$_TaskItemBaseActionController =
      ActionController(name: '_TaskItemBase', context: context);

  @override
  void toggleCompletion() {
    final _$actionInfo = _$_TaskItemBaseActionController.startAction(
        name: '_TaskItemBase.toggleCompletion');
    try {
      return super.toggleCompletion();
    } finally {
      _$_TaskItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDescription(String newDescription) {
    final _$actionInfo = _$_TaskItemBaseActionController.startAction(
        name: '_TaskItemBase.updateDescription');
    try {
      return super.updateDescription(newDescription);
    } finally {
      _$_TaskItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
isCompleted: ${isCompleted},
updatedAt: ${updatedAt}
    ''';
  }
}
