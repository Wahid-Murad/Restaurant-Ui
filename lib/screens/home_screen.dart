import 'package:day23/data/data.dart';
import 'package:day23/models/restaurant.dart';
import 'package:day23/screens/cart_screen.dart';
import 'package:day23/widgets/recent_order.dart';
import 'package:day23/widgets/restaurant_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    buildRestaurant(){
    List <Widget> restaurantList=[];
    restaurants.forEach((Restaurant restaurant){
     restaurantList.add(
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantDetails(restaurant: restaurant,)));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(image: AssetImage("${restaurant.imageUrl}"),
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${restaurant.name}"),
                  Text("${restaurant.address}"),
                  Text("0.2 Miles"),
                ],
              ),
      
            ],
          ),
          
        ),
      ),
     );
    }
  );
    return Column(
      children: restaurantList,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.account_circle),),
        title: Text("Food Delivery",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
        actions: [
         TextButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (contex)=> CartScreen()));
         },
          child: Text("Add to Cart (${currentUser.cart!.length})",style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search Food",
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.close),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RecentOrder(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Near me Resturant",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
                buildRestaurant(),
              ],
            ),
          ),
        ],
      ),
    );
}
}