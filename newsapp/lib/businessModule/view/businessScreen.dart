// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/homeModule/controller/homeCubit.dart';
import 'package:newsapp/homeModule/controller/homeStates.dart';
import 'package:newsapp/homeModule/view/homeComponents.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homeCubit, homeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = homeCubit.get(context);

          var businessNewsList = cubit.business;

          return ScreenBuilder(
            state,
            businessNewsList,
          );
        });
  }
}
