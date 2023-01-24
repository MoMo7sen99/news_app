import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/cubit.dart';

import '../shared/components/components.dart';
import '../shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {

        var cubit = NewsCubit.get(context);

        var list = cubit.search;

        TextEditingController controller = TextEditingController();
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: defaultFormField(
                  prefix: Icons.search,
                  onChange: (value) {
                      cubit.getSearch(value);
                  },
                  label: "search",
                ),
              ),
              Expanded(child: articleBuilder(list: list, context: context,imgUrl: "https://img.freepik.com/premium-vector/search-bar-icon-flat-vector-illustration_435184-854.jpg?w=1060"))
            ],
          ),
        );
      },
    );
  }
}
