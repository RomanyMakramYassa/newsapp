import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/NewsApp/states.dart';

//import 'package:metest/modules/Business/BusinessScreen.dart';

//import 'package:metest/modules/Scince/ScienceScreen.dart';
//import 'package:metest/modules/Sport/SportScreen.dart';

import '../../shared/network/remote/diohelper.dart';
import '../NewssApp/Business/BusinessScreen.dart';
import '../NewssApp/Scince/ScienceScreen.dart';
import '../NewssApp/Sport/SportScreen.dart';
import '../NewssApp/settings/SettingsScreen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialStates());
  static NewsCubit get(context) => BlocProvider.of(context);
  int Curentboton = 0;
  List<BottomNavigationBarItem> Botonc = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science_sharp), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
  ];
  List<Widget> Screen = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingScreen(),
  ];
  void cnangboton(int index) {
    Curentboton = index;
    if (index == 1) {
      GetSports();
    } else if (index == 2) {
      GetScience();
    }
    emit(NewsBotonNavigationStates());
  }

  List<dynamic> businesss = [];

  void getbusiness() {
    emit(NewsgetleadiingStates());
    Diohelper.getdate(url: 'v2/top-headlines', pram: {
      'country': 'eg',
      'category': 'business',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      businesss = value.data['articles'];

      print(value.data.toString());
      print(businesss[0]['title']);
      emit(NewsgetbusinesssucseessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsgetbusinesserorStates(onError.toString()));
    });
  }

  //sport
  List<dynamic> Sports = [];
  void GetSports() {
    emit(NewsgetSportleadStates());
    if (Sports.length == 0) {
      Diohelper.getdate(url: 'v2/top-headlines', pram: {
        'country': 'eg',
        'category': 'sports',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        Sports = value.data['articles'];

        print(value.data.toString());
        print(Sports[0]['title']);
        emit(NewsgetSportsucseessStates());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsgetSportserorStates(onError.toString()));
      });
    } else {
      emit(NewsgetSportsucseessStates());
    }
  }

  //science
  List<dynamic> Science = [];
  void GetScience() {
    emit(NewsgetScienceleadStates());
    if (Science.length == 0) {
      Diohelper.getdate(url: 'v2/top-headlines', pram: {
        'country': 'eg',
        'category': 'science',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        Science = value.data['articles'];

        print(value.data.toString());
        print(Science[0]['title']);
        emit(NewsgetSciencesucseessStates());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsgetScienceserorStates(onError.toString()));
      });
    } else {
      emit(NewsgetSciencesucseessStates());
    }
  }

  List<dynamic> Search = [];
  void GetSearch(String value) {
    Search = [];
    emit(NewsgetSearchleadStates());

    Diohelper.getdate(
            url: 'v2/everything',
            pram: {'q': '$value', 'apikey': '65f7f556ec76449fa7dc7c0069f040ca'})
        .then((value) {
      Search = value.data['articles'];

      print(value.data.toString());
      print(Search[0]['title']);
      emit(NewsgetSearchsucseessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsgetSearchserorStates(onError.toString()));
    });
  }

  bool isdark = false;
  void changedarkmode() {
    isdark = !isdark;
    emit(changdarkmode());
  }
}
