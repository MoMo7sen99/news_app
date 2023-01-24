import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../shared/cubit/cubit.dart';

class SciencesScreen extends StatelessWidget {
  const SciencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener:(context, state) {
        },
        builder: (context, state) {
          var list = NewsCubit.get(context).science;
          return articleBuilder(list:list,context:context,
          imgUrl: 'https://images.ctfassets.net/cnu0m8re1exe/5z0hdZSE6gkeomcudrl1Kl/b089967c69232887e0121e9083210115/scientist.jpg?fm=jpg&fl=progressive&w=660&h=433&fit=fill'
          );
        }
    );
  }
}
