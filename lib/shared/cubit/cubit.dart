import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  String url = 'v2/top-headlines';
  String country = "eg";
  String apiKey = "bc373e646fd5493f92180ef631235d6a";

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_soccer), label: "Sports"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getBusiness();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<Widget> screens = [
    const SportsScreen(),
    const BusinessScreen(),
    const SciencesScreen(),
  ];

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: url, query: {
      "country": country,
      "category": "sports",
      "apiKey": apiKey,
    }).then((value) {
      sports = value?.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(url: url, query: {
        "country": country,
        "category": "business",
        "apiKey": apiKey,
      }).then((value) {
        business = value?.data["articles"];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty)
    {
      DioHelper.getData(url: url, query: {
        "country": country,
        "category": "science",
        "apiKey": apiKey,
      }).then((value) {
        science = value?.data["articles"];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error));
      });
    }else
    {
      emit(NewsGetScienceSuccessState());
    }
  }


  List<dynamic> search = [];
  void getSearch(String value) {
    search = [];
    emit(NewsGetSearchLoadingState());
    if (value.isNotEmpty){
      DioHelper.getData(url: 'v2/everything', query: {
        "q": value,
        "apiKey": apiKey,
      }).then((value) {
        search = value?.data["articles"];
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorState(error));
      });
    }


  }



}
