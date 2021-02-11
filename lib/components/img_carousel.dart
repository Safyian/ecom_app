import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImgCarousel extends StatefulWidget {
  @override
  _ImgCarouselState createState() => _ImgCarouselState();
}

class _ImgCarouselState extends State<ImgCarousel> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/c1.jpg'),
          AssetImage('assets/m1.jpeg'),
          AssetImage('assets/m2.jpg'),
          AssetImage('assets/w1.jpeg'),
          AssetImage('assets/w3.jpeg'),
          AssetImage('assets/w4.jpeg'),
        ],
        autoplay: false,
        autoplayDuration: Duration(milliseconds: 3000),
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 2000),
        dotSize: 8.0,
        indicatorBgPadding: 10.0,
        dotBgColor: Colors.transparent,
      ),
    );
  }
}