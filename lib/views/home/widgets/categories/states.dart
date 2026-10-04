part of 'cubit.dart';

class CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates {
  final List<CategoryModel> list;

  CategoriesSuccessState({required this.list});
}
