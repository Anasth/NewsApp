// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/homeModule/controller/homeCubit.dart';
import 'package:newsapp/homeModule/controller/homeStates.dart';
import 'package:newsapp/homeModule/view/homeComponents.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homeCubit, homeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = homeCubit.get(context);
        var sportsNewsList = cubit.sports;
        return ConditionalBuilder(
            condition: state is! NewsGetScienceLoadingState,
            builder: (context) => ListView.separated(
                  itemBuilder: (context, index) =>
                      AcrticleItem(sportsNewsList[index]),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: sportsNewsList.length,
                ),
            fallback: (contxt) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }
}
