import 'package:flutter/material.dart';
import 'package:food_app/models/order_details_.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/services/orderdetails_api.dart';
import 'package:food_app/widgets/dashboard_widget.dart';
import 'package:provider/provider.dart';

class orders extends StatelessWidget {
  const orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<cartprovider>(context);
       var order = order_details();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Orders',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,

        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming orders',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    ' Clear all',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder<OrderDetails>(
              future:order.getorders() ,
              builder: (c,   snap){
                if (!snap.hasData)
                  return Align(
                      alignment: Alignment.center,
                      child: dashboardwidget().cicularbar());
                if (snap.hasData)
                  return
                    Expanded(
                      child: ListView.builder(
                        itemCount: snap.data!.orders!.length,
                        itemBuilder: ( BuildContext context, int index )=>
                          Container(
                             margin: EdgeInsets.only(bottom: 10),
                          
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network('${order.imageurl}${snap.data!.orders![index].restaurant!.logoImg}',height: 120,width: 110,),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                children: [
                                  Text('${snap.data!.orders![index].restaurant!.name }', style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('${snap.data!.orders![index].restaurant!.ownerName }',
                                    style: TextStyle(
                                        color: Color.fromRGBO(1, 15, 7, 1),

                                        fontSize: 15),),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text( '\$\$', style: TextStyle(
                                          color: Color.fromRGBO(1, 15, 7, 1),

                                          fontSize: 15),),
                                      SizedBox(width: 5,),
                                      Text('Chinese', style: TextStyle(
                                          color: Color.fromRGBO(1, 15, 7, 1),

                                          fontSize: 15),),
                                      SizedBox(width: 95,),
                                      Text( '\$${snap.data!.orders![index].totalPrice }', style: TextStyle(
                                          color: Color.fromRGBO(252, 186, 24, 1),

                                          fontSize: 15),),
                                    ],
                                  )

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                if (snap.hasError) print(snap.error.toString());
                return Align(
                    alignment: Alignment.center,
                    child: dashboardwidget().cicularbar());
              },


            )
          ],
        ),
      ),
    );
  }
}
