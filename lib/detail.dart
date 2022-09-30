import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine/model/hotel.dart';

//TODO: Hero Animation
class DetailPage extends StatelessWidget {
  DetailPage(this.hotel, {Key? key}) : super(key: key);
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Image.asset(
          //                 hotel.assetName,
          //                 fit: BoxFit.fitWidth,
          //               ),
          Text(hotel.name),
        ],
      ),
    );
  }
}
