// ignore_for_file: library_private_types_in_public_api, unnecessary_new

import 'package:mobx/mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/category_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/category/category_repository.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  CategoryRepository repository = new CategoryRepository();

  @observable
  ObservableList<Category> categories = ObservableList<Category>();

  @observable
  List<String> filtersCategory = [];

  @observable
  bool isLoading = false;

  @observable
  bool filterChanged = false;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void addCategory(Category category) {
    categories.add(category);
  }

  @action
  void removeCategory(Category category) {
    categories.remove(category);
  }

  @action
  void clearCategories() {
    categories.clear();
  }

  @action
  void addFilter(String uuid) {
    if (uuid == 'all') {
      clearFilter();
    } else {
      filtersCategory.add(uuid);
    }

    categories = categories;
    filterChanged = filterChanged;
  }

  @action
  void removeFilter(String uuid) {
    if (uuid != 'all') {
      filtersCategory.remove(uuid);
    }

    categories = categories;
    filterChanged = filterChanged;
  }

  @action
  void clearFilter() {
    filtersCategory.clear();

    categories = categories;
    filterChanged = filterChanged;
  }

  @action
  bool inFilter(String uuid) {
    return (uuid == 'all' && filtersCategory.isEmpty) ||
        filtersCategory.contains(uuid);
  }

  @action
  Future getCategories(String tokenCompany) async {
    setLoading(true);
    clearCategories();
    clearFilter();

    final response = await repository.getCategories(tokenCompany);
    response
        .map((categoryJson) => addCategory(Category.fromJson(categoryJson)))
        .toList();
    setLoading(false);
  }
}
