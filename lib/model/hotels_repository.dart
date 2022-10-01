import 'hotel.dart';

class HotelRepository {
  static List<Hotel> loadHotel() {
    const allHotels = <Hotel>[
      Hotel(
        location: "10 Bayfront Avenue, Singapore 018956",
        name: "Marina Bay Sands Hotel",
        rate: 5,
        id: 1,
      ),
      Hotel(
        location: "1 Sheikh Mohammed bin Rashid Blvd, Dubai",
        name: "Burj Khalifa",
        rate: 4,
        id: 2,
      ),
      Hotel(
        location: "300 Olympic-ro, Seoul",
        name: "Lotte World Tower",
        rate: 5,
        id: 3,
      ),
      Hotel(
        location: "30-40 Songgun-gil, Jindo",
        name: "Sol Beach Jindo",
        rate: 5,
        id: 4,
      ),
      Hotel(
        location: "3570 S Las Vegas Blvd, Las Vegas",
        name: "Caesars Palace Las Vegas",
        rate: 3,
        id: 5,
      ),
      Hotel(
        location: "5th Avenue at, Central Park S, New York",
        name: "Plaza Hotel New York",
        rate: 3,
        id: 6,
      ),
    ];
    return allHotels.toList();
  }
}
