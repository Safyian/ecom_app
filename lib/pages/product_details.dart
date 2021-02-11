// import 'package:ecom_app/main.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/components/products.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailOldPrice;
  final productDetailPrice;
  final productDetailPic;

  ProductDetails(
      {this.productDetailName,
      this.productDetailOldPrice,
      this.productDetailPrice,
      this.productDetailPic});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text('E-Commerce App')),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailPic),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.productDetailName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(children: <Widget>[
                    Expanded(
                        child: new Text(
                      '\$${widget.productDetailOldPrice}',
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    )),
                    Expanded(
                        child: new Text(
                      '\$${widget.productDetailPrice}',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ]),
                ),
              ),
            ),
          ),

//  ===============       The First Button       =============
          Row(
            children: <Widget>[
              // ========   Size Button     ===========
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                            title: Text('Size'),
                            content: new Text('Choose the Size'),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('Close'),
                              ),
                            ]);
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: new Text('Size'),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),
                  ]),
                ),
              ),

              // ========   Color Button     ===========
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                            title: Text('Color'),
                            content: new Text('Choose the Color'),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('Close'),
                              ),
                            ]);
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: new Text('Color'),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),
                  ]),
                ),
              ),

              // ========   Qty Button     ===========
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                            title: Text('Quantity'),
                            content: new Text('Choose the Quantity'),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('Close'),
                              ),
                            ]);
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: new Text('Qty'),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),
                  ]),
                ),
              ),
            ],
          ),

//  ===============       The Second Button       =============
          Row(
            children: <Widget>[
              // ========   Buy Button     ===========
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text('Buy Now'),
                ),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: null),
              new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: null),
            ],
          ),

          Divider(),

          new ListTile(
            title: new Text('Product Details'),
            subtitle: new Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
          ),

          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  'Product Name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text(widget.productDetailName)),
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  'Product Brand',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0), child: new Text('Brand X')),
            ],
          ),

// Add the Product Condition
          new Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  'Product Condition',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0), child: new Text('New')),
            ],
          ),

//  Similar Product Section

          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Similar Products'),
          ),

          Container(
            height: 360.0,
            child: SimilarProducts(),
          ),
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
        return SingleProduct(
          productName: productList[index]['name'],
          prodPic: productList[index]['picture'],
          prodOldPrice: productList[index]['old_price'],
          prodPrice: productList[index]['price'],
        );
      },
    );
  }
}
