// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryStore on _CategoryStoreBase, Store {
  late final _$categoriesAtom =
      Atom(name: '_CategoryStoreBase.categories', context: context);

  @override
  ObservableList<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$filtersCategoryAtom =
      Atom(name: '_CategoryStoreBase.filtersCategory', context: context);

  @override
  List<String> get filtersCategory {
    _$filtersCategoryAtom.reportRead();
    return super.filtersCategory;
  }

  @override
  set filtersCategory(List<String> value) {
    _$filtersCategoryAtom.reportWrite(value, super.filtersCategory, () {
      super.filtersCategory = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CategoryStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$filterChangedAtom =
      Atom(name: '_CategoryStoreBase.filterChanged', context: context);

  @override
  bool get filterChanged {
    _$filterChangedAtom.reportRead();
    return super.filterChanged;
  }

  @override
  set filterChanged(bool value) {
    _$filterChangedAtom.reportWrite(value, super.filterChanged, () {
      super.filterChanged = value;
    });
  }

  late final _$getCategoriesAsyncAction =
      AsyncAction('_CategoryStoreBase.getCategories', context: context);

  @override
  Future<dynamic> getCategories(String tokenCompany) {
    return _$getCategoriesAsyncAction
        .run(() => super.getCategories(tokenCompany));
  }

  late final _$_CategoryStoreBaseActionController =
      ActionController(name: '_CategoryStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCategory(Category category) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.addCategory');
    try {
      return super.addCategory(category);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCategory(Category category) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.removeCategory');
    try {
      return super.removeCategory(category);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCategories() {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.clearCategories');
    try {
      return super.clearCategories();
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFilter(String uuid) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.addFilter');
    try {
      return super.addFilter(uuid);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFilter(String uuid) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.removeFilter');
    try {
      return super.removeFilter(uuid);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilter() {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.clearFilter');
    try {
      return super.clearFilter();
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool inFilter(String uuid) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.inFilter');
    try {
      return super.inFilter(uuid);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
filtersCategory: ${filtersCategory},
isLoading: ${isLoading},
filterChanged: ${filterChanged}
    ''';
  }
}
