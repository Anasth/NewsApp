// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/businessModule/controller/businessStates.dart';
import 'package:newsapp/businessModule/view/businessScreen.dart';
import 'package:newsapp/homeModule/controller/cacheHelper.dart';
import 'package:newsapp/homeModule/controller/dio_helper.dart';
import 'package:newsapp/homeModule/controller/homeStates.dart';
import 'package:newsapp/settingsModule/view/settingsScreen.dart';
import 'package:newsapp/sicenceModule/view/sicenceScreen.dart';
import 'package:newsapp/sportsModule/view/sportsScreen.dart';

class homeCubit extends Cubit<homeStates> {
  homeCubit() : super(NewsIninital());

  static homeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      getBusiness();
      emit(NewsGetBusinessSucessState());
    } else if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsButtomNav());
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeAppTheme());
    } else {
      {
        isDark = !isDark;

        CacheHelper.putData('isDark', isDark).then(
          (value) {
            emit(NewsChangeAppTheme());
          },
        );
      }
    }
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getDate(
      'v2/top-headlines',
      {
        'country': 'eg',
        'category': 'business',
        'apiKey': '9871caaf1b4b43e6a22cb2b97c848e76 '
      },
    ).then(
      (value) {
        business = value.data['articles'];
        print(business[0]['title']);

        emit(NewsGetBusinessSucessState());
      },
    ).catchError(
      (onError) {
        print(onError.toString());

        emit(NewsGetBusinessErrorState(onError.toString()));
      },
    );
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());

    DioHelper.getDate(
      'v2/top-headlines',
      {
        'country': 'eg',
        'category': 'Sports',
        'apiKey': '9871caaf1b4b43e6a22cb2b97c848e76 '
      },
    ).then(
      (value) {
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSucessState());
      },
    ).catchError(
      (onError) {
        print(onError.toString());

        emit(NewsGetSportsErrorState(onError.toString()));
      },
    );
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());

    DioHelper.getDate(
      'v2/top-headlines',
      {
        'country': 'eg',
        'category': 'Science',
        'apiKey': '9871caaf1b4b43e6a22cb2b97c848e76 '
      },
    ).then(
      (value) {
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSucessState());
      },
    ).catchError(
      (onError) {
        print(onError.toString());

        emit(NewsGetScienceErrorState(onError.toString()));
      },
    );
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    search = [];

    DioHelper.getDate(
      'v2/everything',
      {'q': '${value}', 'apiKey': '9871caaf1b4b43e6a22cb2b97c848e76 '},
    ).then(
      (value) {
        search = value.data['articles'];
        print(search[0]['title']);

        emit(NewsGetSearchSucessState());
      },
    ).catchError(
      (onError) {
        print(onError.toString());

        emit(NewsGetSearchErrorStateE(onError.toString()));
      },
    );
  }
}
