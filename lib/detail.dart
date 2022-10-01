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
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Hero(
              tag: hotel.assetName,
              child: Image.asset(
                hotel.assetName,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hotel.name),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Icon> starRate(int count) {
    return List.generate(
            count, (i) => Icon(Icons.star_rate, color: Colors.amber))
        .toList(); // replace * with your rupee or use Icon instead
  }
}
