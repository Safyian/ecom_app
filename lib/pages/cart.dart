import 'package:flutter/material.dart';

import 'package:ecom_app/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Cart'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,color: Colors.white),
            onPressed: (){},        
            ),
        ],
      ),

      body: new CartProducts(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: Text('Total:'),
              subtitle: Text('\$230'),
            )),

            Expanded(child: new MaterialButton(
              onPressed: (){},
              child: Text('Check Out',
              style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            )),
          ],
          ),
      ),
      
    );
  }
}