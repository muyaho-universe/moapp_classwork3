class Hotel{

  const Hotel({
    required this.location,
    required this.name,
    required this.rate,
    required this.id,
  });

  final int rate;
  final String location;
  // late bool isFavorited;
  final String name;
  final int id;
  String get assetName => 'hotel0$id.jpg';
}