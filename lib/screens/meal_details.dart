import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget{
  const MealDetailsScreen({super.key,required this.meal, required this.onTogglefavorite});

  final Meal meal;
  final void Function(Meal meal) onTogglefavorite;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      actions: [
        IconButton(onPressed: (){
          onTogglefavorite(meal);
        },icon: Icon(Icons.star)),
      ],
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Image.network(meal.imageUrl),
          Text('Ingredients',style: TextStyle(color: Colors.orange,fontSize: 24,fontWeight: FontWeight.w600),),
          SizedBox(height: 10,),
          Column(
            children: meal.ingredients.map((ingredients) => Text(ingredients)).toList(),
          ),
          SizedBox(height: 10,),
          Text("Steps",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w600,fontSize: 22),),
          Column(
            
           children: meal.steps.map((steps) => Text(steps)).toList(),
          ),
        ],
      )),
    );
  }
}