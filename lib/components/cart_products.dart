import 'package:flutter/material.dart';


class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {

  var productsOnCart = [
     {
      'name': 'Blazzer',
      'picture': 'assets/products/blazer1.jpeg',
      'price': 899,
      'size': 'M',
      'color': 'Red',
      'quantity': 1
    },
    {
      'name': 'Jogger Jeans ',
      'picture': 'assets/products/pants1.jpg',
      'price': 825,
      'size': '30',
      'color': 'black',
      'quantity': 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsOnCart.length,
      itemBuilder: (context, index){
        return new SingleCartProduct(
          cartProductName: productsOnCart[index]['name'],
          cartProdPic: productsOnCart[index]['picture'],
          cartProdPrice: productsOnCart[index]['price'],
          cartProdSize: productsOnCart[index]['size'],
          cartProdColor: productsOnCart[index]['color'],
          cartProdQty: productsOnCart[index]['quantity'],
          
        );
      },
      
    );
  }
}


class SingleCartProduct extends StatelessWidget {

  final cartProductName;
  final cartProdPic;
  final cartProdPrice;
  final cartProdSize;
  final cartProdColor;
  final cartProdQty;

  SingleCartProduct({
    this.cartProductName,
    this.cartProdPic,
    this.cartProdPrice,
    this.cartProdSize,
    this.cartProdColor,
    this.cartProdQty
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // =======         leading: Picture of the Product         ============= 
        leading: new Image.asset(
          cartProdPic,
          width:80.0,
          height:80.0
          ),

          //  ========         title: Name of the Product       ============
        title: Text(cartProductName),


        subtitle: new Column(
          children: <Widget>[
            new Row(children: <Widget>[
              //  =======      Size of the Product        ======
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text('Size:'),
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(cartProdSize, style: TextStyle(color: Colors.red),),
              ),

              //  =======     Color of the Product      ========
              new Padding(padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: Text('Color:'),
              ),

              new Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(cartProdColor, style: TextStyle(color: Colors.red)),
              ),

            ],),


            // =========        Price of the Products       ===========
            new Container(
              alignment: Alignment.topLeft,
              child: Text(
                '\$$cartProdPrice', 
                style: TextStyle(
                  fontSize: 17.0, 
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                  ),),
            ),
          ]
        ),

        trailing: new Column(
              children: <Widget>[
                new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
                new Text('$cartProdQty'),
                new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
              ],
            ),

      ),
      
    );
  }
}

