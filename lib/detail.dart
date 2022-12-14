import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine/model/hotel.dart';

import 'model/favorite_hotel_repository.dart';

//TODO: Hero Animation
class DetailPage extends StatefulWidget {
  DetailPage(this.hotel, {Key? key}) : super(key: key);
  final Hotel hotel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool isFavorited;
  late int key;

  @override
  initState(){
    key = widget.hotel.id;
    isFavorited = FavoriteHotelRepository.favorite[key];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: InkWell(
                  onDoubleTap: (){
                    setState(() {
                      isFavorited = !isFavorited;
                      FavoriteHotelRepository.favorite.update(key, (value) => isFavorited);
                    });
                    // print(key);
                    // print( widget.hotel.name);
                  },
                  child: Hero(
                    tag: widget.hotel.assetName,
                    child: Image.asset(
                      widget.hotel.assetName,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      isFavorited? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: starRate(widget.hotel.rate),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 30,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                      // fontFamily: 'Horizon'

                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText(widget.hotel.name,
                          textStyle: TextStyle(
                            color: Colors.lightBlue,
                          ),
                        ),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.lightBlue,
                    ),

                    Text(
                      widget.hotel.location,
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.lightBlue,
                    ),
                    Text(
                      widget.hotel.phoneNumber,
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2.0,
                ),
                Text(
                  widget.hotel.description,
                  maxLines: 100,
                  style: TextStyle(
                    color: Colors.lightBlue,
                  ),
                ),

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
