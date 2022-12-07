import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/cubit.dart';
import 'package:weather/Modules/HomeScreen.dart';

import 'Shared/DioHelper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( Weather());

}
class Weather extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    DioHelper.init();

    return  BlocProvider(
    create: (context)=>WeatherCubit(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
//c021a08fce6f4e0dba2132308220712
  }

}
