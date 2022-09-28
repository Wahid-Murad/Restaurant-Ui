import 'package:day23/data/data.dart';
import 'package:day23/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecentOrder extends StatefulWidget {
  const RecentOrder({Key? key}) : super(key: key);

  @override
  State<RecentOrder> createState() => _RecentOrderState();
}

class _RecentOrderState extends State<RecentOrder> {

  buildRecentOrder(BuildContext context,Order order){
    return Container(
      width: 320,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(image: AssetImage("${order.food!.imageUrl}"),
            height: 120,
            width: 120,
            fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${order.food!.name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
              Text("${order.restaurant!.name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
              Text("${order.date}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange,
            ),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.add),color: Colors.white,),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("Recent Order",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
           Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:    currentUser.orders!.length,
             itemBuilder: (context,index){
              Order order=currentUser.orders![index];
              return buildRecentOrder(context,order);
            }
            ),
           ),
        ],
      );
  }
}