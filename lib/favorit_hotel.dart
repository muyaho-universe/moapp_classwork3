import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/favorite_hotel_repository.dart';
import 'model/hotel.dart';
import 'model/hotels_repository.dart';

class FavoritHotelPage extends StatefulWidget {
  const FavoritHotelPage({Key? key}) : super(key: key);

  @override
  State<FavoritHotelPage> createState() => _FavoritHotelPageState();
}

class _FavoritHotelPageState extends State<FavoritHotelPage> {
  final List<Hotel> hotels = HotelRepository.loadHotel();
  late List <String> favoriteHotelName = favoriteHotel(hotels);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Hotels"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoriteHotelName.length,
        itemBuilder: (context, index) {
          final hotelName = favoriteHotelName[index];
          return Dismissible(
            key: Key(hotelName),
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                favoriteHotelName.removeAt(index);
                FavoriteHotelRepository.favorite[indexFinder(hotelName)] = false;
              });
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(hotelName),
            ),
          );
        },
      ),
    );
  }
  List<String> favoriteHotel(List<Hotel> hotelList){
    List<String> favoriteHotelName = List.empty(growable: true);
    for(int i = 1; i <= 6; i++){
      if(FavoriteHotelRepository.favorite[i]){
        favoriteHotelName.add(hotelList[i-1].name);

      }
    }

    return favoriteHotelName;
  }

  int indexFinder(String name){
    int indexNumber = 7;
    for(int i = 0; i < 6; i++){
      if(name == HotelRepository.loadHotel()[i].name){
        indexNumber = i + 1;
      }
    }
    return indexNumber;
  }
}
