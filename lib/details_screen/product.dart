import 'package:flutter/material.dart';


class product extends StatefulWidget {
  const product({Key? key, this.name  }) : super(key: key);
final name;
  @override
  _productState createState() => _productState();
}

class _productState extends State<product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/details_product.png',
              fit: BoxFit.cover,
            ),
          ),
      Expanded(
      child: DefaultTabController(

      length: 3,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height),
            child: new Container(
              height: 50.0,
              child: new TabBar(

                indicatorColor: Colors.orange,
                onTap: (int){
                  int ++;
                  print(int);
                },
                labelColor: Colors.black,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: widget.name,
                  ),
                  Tab(
                    text: "Burger",
                  ),
                  Tab(
                    text: "Pizza",
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
             
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    ),
        ],
      ),
    );
  }
}
