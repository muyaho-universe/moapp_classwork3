import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine/model/hotel.dart';

//TODO: Hero Animation
class DetailPage extends StatefulWidget {
  DetailPage(this.hotel, {Key? key}) : super(key: key);
  final Hotel hotel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Hero(
              tag: widget.hotel.assetName,
              child: Image.asset(
                widget.hotel.assetName,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Row(
                  children: starRate(widget.hotel.rate),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.hotel.name),
                SizedBox(
                  width: 100,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 40.0,
                      // fontFamily: 'Horizon',
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Hello world!',
                          textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 2000),
                        ),
                      ],

                      totalRepeatCount: 4,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    )
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
