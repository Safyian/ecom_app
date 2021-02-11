import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          Catagory(
            imgLocation: 'assets/cats/tshirt.png',
            imgCaption: 'Shirts'),

            Catagory(
            imgLocation: 'assets/cats/dress.png',
            imgCaption: 'Dress'),

            Catagory(
            imgLocation: 'assets/cats/jeans.png',
            imgCaption: 'Pants'),

            Catagory(
            imgLocation: 'assets/cats/formal.png',
            imgCaption: 'Formal'),

            Catagory(
            imgLocation: 'assets/cats/informal.png',
            imgCaption: 'Casual'),

            Catagory(
            imgLocation: 'assets/cats/shoe.png',
            imgCaption: 'Shoes'),

            Catagory(
            imgLocation: 'assets/cats/accessories.png',
            imgCaption: 'Accessory'),
        ],

      ),
      );
  }
}




class Catagory extends StatelessWidget {

  final String imgLocation;
  final String imgCaption;

    Catagory({
      this.imgLocation, this.imgCaption});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(
              imgLocation,
              width: 40.0,
              height: 40.0,
              ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(imgCaption, style: TextStyle(fontSize: 14.0),)),
          ),
        ),
      ),
    );
  }
}