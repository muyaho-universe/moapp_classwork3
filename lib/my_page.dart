import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'detail.dart';
import 'model/favorite_hotel_repository.dart';
import 'model/hotel.dart';
import 'model/hotels_repository.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Card> _buildListCards(BuildContext context) {
    List<Hotel> hotels = HotelRepository.loadHotel();
    List<Card> favoriteCard = List.empty(growable: true);

    if (hotels.isEmpty) {
      return const <Card>[];
    }

    for (int i = 1; i <= 6; i++) {
      if (FavoriteHotelRepository.favorite[i]) {
        favoriteCard.add(
          Card(
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width - 50,
              child: Stack(
                children: [
                  SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width - 50,
                    child: InkWell(
                      child: Hero(
                      tag: hotels[i - 1].assetName,
                        child: Image.asset(
                          hotels[i - 1].assetName,
                          fit: BoxFit.fill,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(hotels[i - 1])));
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    left: 10,
                    child: Text(
                      hotels[i - 1].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    child: Text(
                      hotels[i - 1].location,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    return favoriteCard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: ClipOval(
                  child: Lottie.network(
                      'https://assets5.lottiefiles.com/packages/lf20_6FYRYX8fKd.json'),
                ),
              ),
            ),
            Center(
              child: Text(
                "Daeseok Kim",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Center(
              child: Text(
                "21800059",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "My Favorite Hotel List",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              child: Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  shrinkWrap: true,
                  children: _buildListCards(context),
                  physics: BouncingScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
