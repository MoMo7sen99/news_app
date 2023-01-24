import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../shared/cubit/cubit.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener:(context, state) {
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return articleBuilder(list:list,context:context,
            imgUrl: 'https://www.history.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTk0MTM3OTE4OTQyNDg4MDY5/soccer-ball-gettyimages-sb10066898ab-001.jpg');
      }
    );
  }
}
