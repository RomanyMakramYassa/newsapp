//import 'package:metest/layout/NewsApp/cubit.dart';

abstract class NewsStates {}

class NewsIntialStates extends NewsStates {}

class NewsBotonNavigationStates extends NewsStates {}

class NewsgetbusinesssucseessStates extends NewsStates {}

class NewsgetbusinesserorStates extends NewsStates {
  final String eror;
  NewsgetbusinesserorStates(this.eror);
}

class NewsgetSportleadStates extends NewsStates {}

class NewsgetSportsucseessStates extends NewsStates {}

class NewsgetSportserorStates extends NewsStates {
  final String eror;
  NewsgetSportserorStates(this.eror);
}

class NewsgetleadiingStates extends NewsStates {}

class NewsgetScienceleadStates extends NewsStates {}

class NewsgetSciencesucseessStates extends NewsStates {}

class NewsgetScienceserorStates extends NewsStates {
  final String eror;
  NewsgetScienceserorStates(this.eror);
}

class NewsgetSearchleadStates extends NewsStates {}

class NewsgetSearchsucseessStates extends NewsStates {}

class NewsgetSearchserorStates extends NewsStates {
  final String eror;
  NewsgetSearchserorStates(this.eror);
}

class changdarkmode extends NewsStates {}
