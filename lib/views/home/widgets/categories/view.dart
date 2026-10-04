import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:thimar/views/home/widgets/categories/cubit.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<CategoriesCubit>();
          cubit.getData();

          return Container(
            height: 180,
            padding: EdgeInsets.symmetric(vertical: 16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    'الأقسام',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                Gap(16),
                Expanded(
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      if (state is CategoriesLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CategoriesSuccessState) {
                        return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) =>
                              _Item(model: state.list[index]),
                          itemCount: state.list.length,
                          scrollDirection: Axis.horizontal,
                        );
                      } else {
                        return Text('${state.runtimeType}');
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final CategoryModel model;

  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 16),
      child: Column(
        children: [
          Container(
            height: 74,
            width: 74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: model.color,
            ),
            child: Center(
              child: Image.network(
                model.image,
                height: 36,
                width: 36,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Gap(2),
          Text(model.text),
        ],
      ),
    );
  }
}
