import 'package:flutter/material.dart';
//My Imports
import 'package:ecom_app/components/drawer.dart';
import 'package:ecom_app/components/horizontal_listview.dart';
import 'package:ecom_app/components/products.dart';
import 'package:ecom_app/pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('E-Commerce App'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          //img carousel begins
          // ImgCarousel(),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft, child: Text('Catagories')),
          ),
          //Catagory
          HorizontalList(),

          //Recent Products
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text('Recent Products')),
          ),

          //Grid View
          Flexible(
            child: Products(),
          ),
        ],
      ),
    );
  }
}
