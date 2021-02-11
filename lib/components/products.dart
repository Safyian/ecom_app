import 'package:flutter/material.dart';

import 'package:ecom_app/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      'name': 'Blazzer',
      'picture': 'assets/products/blazer1.jpeg',
      'old_price': 1199,
      'price': 899
    },
    {
      'name': 'Red Dress',
      'picture': 'assets/products/dress1.jpeg',
      'old_price': 1699,
      'price': 1000
    },
    {
      'name': 'Black Dress',
      'picture': 'assets/products/dress2.jpeg',
      'old_price': 2000,
      'price': 1695
    },
    {
      'name': 'Black Blazzer',
      'picture': 'assets/products/blazer2.jpeg',
      'old_price': 1600,
      'price': 1250
    },
    {
      'name': 'Jogger Jeans ',
      'picture': 'assets/products/pants1.jpg',
      'old_price': 1000,
      'price': 825
    },
    {
      'name': 'Casual Jeans',
      'picture': 'assets/products/pants2.jpeg',
      'old_price': 1400,
      'price': 700
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: SingleProduct(
            productName: productList[index]['name'],
            prodPic: productList[index]['picture'],
            prodOldPrice: productList[index]['old_price'],
            prodPrice: productList[index]['price'],
          ),
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final prodPic;
  final prodOldPrice;
  final prodPrice;

  SingleProduct(
      {this.productName, this.prodPic, this.prodOldPrice, this.prodPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            //push Product detail screen over Home screen when tap on product also pass values to detail screen
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                    productDetailName: productName,
                    productDetailOldPrice: prodOldPrice,
                    productDetailPrice: prodPrice,
                    productDetailPic: prodPic))),

            child: GridTile(
              footer: Container(
                  color: Colors.white,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: new Text(
                            productName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          )),
                      Expanded(
                          child: new Text(
                        '\$$prodOldPrice',
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      new Text(
                        '\$$prodPrice',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )
                    ],
                  )),
              child: Image.asset(prodPic, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
