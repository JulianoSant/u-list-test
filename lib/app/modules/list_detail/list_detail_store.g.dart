// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListDetailStore on _ListDetailStoreBase, Store {
  late final _$itemsAtom =
      Atom(name: '_ListDetailStoreBase.items', context: context);

  @override
  ObservableList<Map<String, dynamic>> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Map<String, dynamic>> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$_ListDetailStoreBaseActionController =
      ActionController(name: '_ListDetailStoreBase', context: context);

  @override
  void addItem(String description) {
    final _$actionInfo = _$_ListDetailStoreBaseActionController.startAction(
        name: '_ListDetailStoreBase.addItem');
    try {
      return super.addItem(description);
    } finally {
      _$_ListDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateItem(String id, String newDescription) {
    final _$actionInfo = _$_ListDetailStoreBaseActionController.startAction(
        name: '_ListDetailStoreBase.updateItem');
    try {
      return super.updateItem(id, newDescription);
    } finally {
      _$_ListDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(String id) {
    final _$actionInfo = _$_ListDetailStoreBaseActionController.startAction(
        name: '_ListDetailStoreBase.removeItem');
    try {
      return super.removeItem(id);
    } finally {
      _$_ListDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
