import 'package:flutter/material.dart';
import 'pages/login.dart';

//My Imports
// import 'package:ecom_app/components/drawer.dart';
// import 'package:ecom_app/components/horizontal_listview.dart';
// import 'package:ecom_app/components/products.dart';
// import 'package:ecom_app/pages/cart.dart';

void main() => runApp(MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red.shade900),
    ));
