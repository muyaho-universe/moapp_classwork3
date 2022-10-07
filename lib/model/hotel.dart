class Hotel {
  const Hotel({
    required this.phoneNumber,
    required this.description,
    required this.location,
    required this.name,
    required this.rate,
    required this.id,
  });

  final int rate;
  final String location;

  // late bool isFavorited;
  final String name;
  final String phoneNumber;
  final String description;
  final int id;

  String get assetName => 'assets/hotel0$id.jpg';
}
