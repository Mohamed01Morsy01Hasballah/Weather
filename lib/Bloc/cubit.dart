import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/States.dart';
import 'package:weather/model/WeatherModel.dart';
import 'package:weather/Shared/DioHelper.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit():super(InitialState());
  static WeatherCubit get(context)=>BlocProvider.of(context);
  WeatherModel? model;
  void GetCity({
  required String city
}){
    emit(GetDataCityLoadingState());
   DioHelper.GetData(
       url: 'v1/forecast.json?',
      query:{
         'q':'$city',
        'key':'c021a08fce6f4e0dba2132308220712',
        'days':'1'
      }
   ).then((value) {
    model=WeatherModel.fromJson(value.data);

    // print(value.data);
     emit(GetDataCitySuccessState());
   }).catchError((error){
     print('error ${error.toString()}');
     emit(GetDataCityErrorState());
   });
  }

}