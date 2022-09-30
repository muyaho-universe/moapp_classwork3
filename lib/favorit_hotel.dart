import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritHotelPage extends StatefulWidget {
  const FavoritHotelPage({Key? key}) : super(key: key);

  @override
  State<FavoritHotelPage> createState() => _FavoritHotelPageState();
}

class _FavoritHotelPageState extends State<FavoritHotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Hotels"),
        centerTitle: true,
      ),
    );
  }
}
