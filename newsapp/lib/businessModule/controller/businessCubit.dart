import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/businessModule/controller/businessStates.dart';

class businessCubit extends Cubit<businessStates> {
  businessCubit() : super(initalBusinessState());

  static businessCubit get(context) => BlocProvider.of(context);
  
}
