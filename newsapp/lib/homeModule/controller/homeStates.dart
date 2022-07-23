abstract class homeStates {}

class NewsIninital extends homeStates {}

class NewsButtomNav extends homeStates {}

class NewsGetBusinessSucessState extends homeStates {}

class NewsGetBusinessLoadingState extends homeStates {}

class NewsGetBusinessErrorState extends homeStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsSucessState extends homeStates {}

class NewsGetSportsLoadingState extends homeStates {}

class NewsGetSportsErrorState extends homeStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceSucessState extends homeStates {}

class NewsGetScienceLoadingState extends homeStates {}

class NewsGetScienceErrorState extends homeStates {
  final String error;
  NewsGetScienceErrorState(this.error);
}


class NewsChangeAppTheme extends homeStates{}
