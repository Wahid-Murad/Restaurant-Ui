import 'dart:html';

import 'package:day23/models/food.dart';
import 'package:day23/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RestaurantDetails extends StatefulWidget {
  //RestaurantDetails({Key? key}) : super(key: key);

  Restaurant ? restaurant;
  RestaurantDetails({this.restaurant});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {

  _buildMenuItem(Food menuItem){
     return Center(
      child: Stack(
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(
                  "${menuItem.imageUrl}"
                ),
                ),
            ),
          ),
           Positioned(
            left: 20,
            bottom: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("${menuItem.name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
               Text("\$ ${menuItem.price}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),
               Text("${menuItem.addcart}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
              ],
            ),
          ),
        ],
      ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(image: AssetImage("${widget.restaurant!.imageUrl}",
              ),
              height: 210,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: Icon(Icons.arrow_back),color: Colors.white,),
                    IconButton(onPressed: (){
                      
                    }, icon: Icon(Icons.favorite),color: Colors.red,),
                  ],
                ),
              ),   
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.restaurant!.name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      Text("${widget.restaurant!.address}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ],
                  ),
                  Text("0.2 Miles",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text("Contact")),
                   ),
                   Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text("Review")),
                   ),
                  ],
                ),    
              ),
              Text("Menu",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  // mainAxisSpacing: 30,
                  // crossAxisSpacing: 30,
                  children: List.generate(widget.restaurant!.menu!.length, (index) {
                    Food food=widget.restaurant!.menu![index];
                  return _buildMenuItem(food);
                  }),
                  
                  ),
              ),
        ],
      ),   
    );
    
  }
}