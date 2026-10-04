import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'model.dart';

part 'states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesStates());

  void getData() async {
    /*
    final fakeList = [
      CategoryModel(text: 'الخضار', image: '', color: Colors.brown),
      CategoryModel(text: 'الفواكه', image: '', color: Colors.blue),
      CategoryModel(text: 'اللحوم', image: '', color: Colors.grey),
      CategoryModel(text: 'البهارات', image: '', color: Colors.lightBlue),
      CategoryModel(text: 'التمور', image: '', color: Colors.deepPurpleAccent),
      CategoryModel(text: 'المكسرات', image: '', color: Colors.teal),
    ];
    */
    emit(CategoriesLoadingState());


    final response= await Dio().get('https://thimar.amr.aait-d.com/api/categories');
    final model=CategoriesData(response.data);

    await Future.delayed(Duration(seconds: 2));
    emit(CategoriesSuccessState(list: model.list));
  }
}
