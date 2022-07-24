// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/homeModule/controller/homeCubit.dart';
import 'package:newsapp/homeModule/controller/homeStates.dart';
import 'package:newsapp/homeModule/view/homeComponents.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homeCubit, homeStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        // var cubit = homeCubit.get(context);
        var list = homeCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(title: Text('Search')),
          body: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Search",
                    fillColor: Color.fromARGB(255, 255, 245, 245),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 0.4,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        // color: Colors.red,
                        width: 0.4,
                      ),
                    ),
                  ),
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Search must not be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    homeCubit.get(context).getSearch(value);
                    print(list);
                  },
                ),
              ),
              Expanded(child: ScreenBuilder(state, list)),
            ],
          ),
        );
      },
    );
  }
}
