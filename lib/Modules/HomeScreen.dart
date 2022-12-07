import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/States.dart';
import 'package:weather/Bloc/cubit.dart';
import 'package:weather/Modules/SearchScreen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wheather'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
              },
              icon: Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<WeatherCubit,WeatherStates>(
        builder: (context,state){
          var cubit=WeatherCubit.get(context);
          if(state is   InitialState) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey
              ),
              child: Center(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('There NO Found Weather '),
                    SizedBox(height: 10,),
                    Text('Search about Weather Now '),
                  ],
                ),
              ),
            );
          }
          else if(state is GetDataCityErrorState){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('There Enter Data Invalid '),
                ],
              ),
            );
          }
            return Container(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0)
                        ),
                        child: Image(image: AssetImage('assets/images/weather.png',),
                        )),
                    SizedBox(height: 20,),
                    Text('${cubit.model!.city}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                    SizedBox(height: 5,),
                    Text('${cubit.model!.date}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,

                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(

                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Container(
                         height: 50,
                           width: 100,
                           child: Image(image: NetworkImage('https:${cubit.model!.image}'))),
                        Text(
                          '${cubit.model!.temp}'
                              ,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                          ),
                        ),
                        Column(
                          children: [
                            Text('Max is ${cubit.model!.maxtemp}'
                            ,style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  
                              ),
                            ),
                            SizedBox(height: 3,),
                            Text('Max is ${cubit.model!.mintemp}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Text('${cubit.model!.WeatherStateName}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                        
                      ),
                    )
                  ],
                ),
              ),
            );



        }


      ),
    );
  }

}