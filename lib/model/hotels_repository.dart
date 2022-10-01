import 'hotel.dart';

class HotelRepository {
  static List<Hotel> loadHotel() {
    const allHotels = <Hotel>[
      Hotel(
        location: "10 Bayfront Avenue, Singapore 018956",
        name: "Marina Bay Sands Hotel",
        rate: 5,
        id: 1,
        description: "Marina Bay Sands (abbreviation: MBS) is an integrated resort fronting Marina Bay in Singapore. The resort is owned by the Las Vegas Sands Corporation and at its opening in 2010, it was deemed the world's most expensive standalone casino property at S\$8 billion (US\$6.88 billion). The resort includes a 2,561-room hotel, a 120,000-square-metre (1,300,000 sq ft) convention-exhibition centre, the 74,000-square-metre (800,000 sq ft) The Shoppes at Marina Bay Sands mall, a museum, a large theatre, \"celebrity chef\" restaurants, two floating crystal pavilions, art-science exhibits, and the world's largest atrium casino with 500 tables and 1,600 slot machines. The complex includes three towers topped by a connecting 340-metre-long (1,120 ft) SkyPark with a capacity of 3,902 people and a 150 m (490 ft) infinity swimming pool, set on top of the world's largest public cantilevered platform, which overhangs the north tower by 66.5 m (218 ft). The 20-hectare resort was designed by Moshe Safdie architects",
        phoneNumber: "+65-6688-8888",
      ),
      Hotel(
        location: "1 Sheikh Mohammed bin Rashid Blvd, Dubai",
        name: "Burj Khalifa",
        rate: 4,
        id: 2,
        description: "The Burj Khalifa (/ˈbɜːrdʒ kəˈliːfə/; Arabic: برج خليفة, Arabic pronunciation: [bʊrd͡ʒ xaˈliːfa], Khalifa Tower), known as the Burj Dubai prior to its inauguration in 2010, is a skyscraper in Dubai, United Arab Emirates. With a total height of 829.8 m (2,722 ft, or just over half a mile) and a roof height (excluding antenna, but including a 223 m spire[2]) of 828 m (2,717 ft), the Burj Khalifa has been the tallest structure and building in the world since its topping out in 2009, supplanting Taipei 101, the previous holder of that status",
        phoneNumber: "+9714-8888888",
      ),
      Hotel(
        location: "300 Olympic-ro, Seoul",
        name: "Lotte World Tower",
        rate: 5,
        id: 3,
        description: "The Lotte World Tower (Korean: 롯데월드타워) is a 555.7-metre (1,823 ft), 123-story skyscraper located in Sincheon-dong, Songpa District, Seoul, South Korea. It opened to the public on April 3, 2017, and is currently the tallest building in South Korea and the sixth tallest in the world.",
        phoneNumber: "+822-3213-5000",
      ),
      Hotel(
        location: "30-40 Songgun-gil, Jindo",
        name: "Sol Beach Jindo",
        rate: 5,
        id: 4,
        description: "With its natural and simple rural landscape and antique vintage, the Sol Beach Hotel & Resort Jindo has been created as a 576-room hotel/resort that blends in with a fantastic ocean view. Healing your body and mind with pleasant winds, warm sunshine, and the sound of quiet waves.",
        phoneNumber: "+821588-4888",
      ),
      Hotel(
        location: "3570 S Las Vegas Blvd, Las Vegas",
        name: "Caesars Palace Las Vegas",
        rate: 3,
        id: 5,
        description: "Caesars Entertainment joins two successful gaming leaders, Caesars Entertainment and Eldorado Resorts, who have come together to create the largest and most diversified collection of destinations across the U.S.",
        phoneNumber: "+1-866-506-3454",
      ),
      Hotel(
        location: "5th Avenue at, Central Park S, New York",
        name: "Plaza Hotel New York",
        rate: 3,
        id: 6,
        description: "Since its debut on October 1, 1907, The Plaza Hotel has remained a New York icon hosting world leaders, dignitaries, captains of industry, Broadway legends, and Hollywood royalty. As an established staple for lavish society affairs and blockbuster films, The Plaza has welcomed guests from around the world to enjoy its magic at the castle on Central Park South for more than 100 years. Ideally situated on Fifth Avenue, The Plaza’s prestigious address continues to define elegance with unmatched service and an ever-evolving modern sensibility.",
        phoneNumber: "+1212-759-3000",
      ),
    ];
    return allHotels.toList();
  }
}
