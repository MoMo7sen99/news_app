import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener:(context, state) {
        },
        builder: (context, state) {
          var list = NewsCubit.get(context).business;
          return articleBuilder(list : list,context: context,
          imgUrl: 'https://www.simplilearn.com/ice9/free_resources_article_thumb/13_Famous_Business_Leaders_You_Must_Follow_in_2022.jpg'
          );
        }
    );
  }
}
