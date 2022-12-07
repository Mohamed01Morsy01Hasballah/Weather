import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/States.dart';
import 'package:weather/Bloc/cubit.dart';
import 'package:weather/Modules/HomeScreen.dart';

class SearchScreen extends StatelessWidget{
  var textt=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: (context,state){
        if(state is GetDataCitySuccessState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        }
      },
      builder: (context,state){
        var cubit=WeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: textt,
                    decoration: InputDecoration(
                        label: Text('City Name '),
                        hintText: 'Please Enter City Name',
                        border:OutlineInputBorder()
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.indigo
                    ),
                    child: ElevatedButton(
                        onPressed: (){
                          cubit.GetCity(city: textt.text);
                        },
                        child: Text('Submit')
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }

}